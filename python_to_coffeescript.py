#!/usr/bin/env python
'''
This script makes a coffeescript file for every python source file listed
on the command line (wildcard file names are supported).

For full details, see README.md.

Released under the MIT Licence.

Written by Edward K. Ream.
'''
# All parts of this script are distributed under the following copyright. This is intended to be the same as the MIT license, namely that this script is absolutely free, even for commercial use, including resale. There is no GNU-like "copyleft" restriction. This license is compatible with the GPL.
# 
# **Copyright 2016 by Edward K. Ream. All Rights Reserved.**
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 
# **THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.**
from collections import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.

import ast
import glob
import optparse
import os
# import re
import sys
import time
import token
import tokenize
import types
isPython3 = sys.version_info >= (3, 0, 0)
# Avoid try/except here during development.
if isPython3:
    import configparser
    import io
else:
    import ConfigParser as configparser
    import StringIO as io
# try:
    # import ConfigParser as configparser # Python 2
# except ImportError:
    # import configparser # Python 3
# try:
    # import StringIO as io # Python 2
# except ImportError:
    # import io # Python 3
use_tree = False

def main():
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    # g.cls()
    controller = MakeCoffeeScriptController()
    controller.scan_command_line()
    controller.scan_options()
    controller.run()
    print('done')

#
# Utility functions...
#

def dump(title, s=None):
    if s:
        print('===== %s...\n%s\n' % (title, s.rstrip()))
    else:
        print('===== %s...\n' % title)

def dump_dict(title, d):
    '''Dump a dictionary with a header.'''
    dump(title)
    for z in sorted(d):
        print('%30s %s' % (z, d.get(z)))
    print('')

def dump_list(title, aList):
    '''Dump a list with a header.'''
    dump(title)
    for z in aList:
        print(z)
    print('')

def pdb(self):
    '''Invoke a debugger during unit testing.'''
    print('pdb')
    # Avoid try/except during development.
    # try:
        # import leo.core.leoGlobals as leo_g
        # leo_g.pdb()
    # except ImportError:
        # import pdb
        # pdb.set_trace()

def truncate(s, n):
    '''Return s truncated to n characters.'''
    return s if len(s) <= n else s[:n-3] + '...'


class CoffeeScriptTokenizer:
    '''A token-based Python beautifier.'''


    class OutputToken(object):
        '''A class representing Output Tokens'''

        def __init__(self, kind, value):
            self.kind = kind
            self.value = value

        def __repr__(self):
            if self.kind == 'line-indent':
                assert not self.value.strip(' ')
                return '%15s %s' % (self.kind, len(self.value))
            else:
                return '%15s %r' % (self.kind, self.value)

        __str__ = __repr__

        def to_string(self):
            '''Convert an output token to a string.'''
            return self.value if g.isString(self.value) else ''


    class StateStack(object):
        '''
        A class representing a stack of ParseStates and encapsulating various
        operations on same.
        '''
        
        def __init__(self):
            '''Ctor for ParseStack class.'''
            self.stack = []

        def get(self, kind):
            '''Return the last state of the given kind, leaving the stack unchanged.'''
            n = len(self.stack)
            i = n - 1
            while 0 <= i:
                state = self.stack[i]
                if state.kind == kind:
                    return state
                i -= 1
            return None

        def has(self, kind):
            '''Return True if state.kind == kind for some ParseState on the stack.'''
            return any([z.kind == kind for z in self.stack])

        def pop(self):
            '''Pop the state on the stack and return it.'''
            return self.stack.pop()

        def push(self, kind, value=None):
            '''Append a state to the state stack.'''
            trace = False
            self.stack.append(ParseState(kind, value))
            if trace and kind == 'tuple':
                g.trace(kind, value, g.callers(2))

        def remove(self, kind):
            '''Remove the last state on the stack of the given kind.'''
            trace = False
            n = len(self.stack)
            i = n - 1
            found = None
            while 0 <= i:
                state = self.stack[i]
                if state.kind == kind:
                    found = state
                    self.stack = self.stack[:i] + self.stack[i+1:]
                    assert len(self.stack) == n-1, (len(self.stack), n-1)
                    break
                i -= 1
            if trace and kind == 'tuple':
                kind = found and found.kind or 'fail'
                value = found and found.value or 'fail'
                g.trace(kind, value, g.callers(2))

    def __init__(self, controller):
        '''Ctor for CoffeeScriptTokenizer class.'''
        self.controller = controller
        # Globals...
        self.code_list = [] # The list of output tokens.
        # The present line and token...
        self.last_line_number = 0
        self.raw_val = None # Raw value for strings, comments.
        self.s = None # The string containing the line.
        self.val = None
        # State vars...
        self.after_self = False
        self.backslash_seen = False
        self.decorator_seen = False
        self.extends_flag = False
        self.in_class_line = False
        self.in_def_line = False
        self.in_import = False
        self.in_list = False
        self.input_paren_level = 0
        self.def_name_seen = False
        self.level = 0 # indentation level.
        self.lws = '' # Leading whitespace.
            # Typically ' '*self.tab_width*self.level,
            # but may be changed for continued lines.
        self.output_paren_level = 0 # Number of unmatched left parens in output.
        self.prev_sig_token = None # Previous non-whitespace token.
        self.stack = None # Stack of ParseState objects, set in format.
        # Settings...
        self.delete_blank_lines = False
        self.tab_width = 4

    def format(self, tokens):
        '''The main line of CoffeeScriptTokenizer class.'''
        trace = False
        self.code_list = []
        self.stack = self.StateStack()
        self.gen_file_start()
        for token5tuple in tokens:
            t1, t2, t3, t4, t5 = token5tuple
            srow, scol = t3
            self.kind = token.tok_name[t1].lower()
            self.val = g.toUnicode(t2)
            self.raw_val = g.toUnicode(t5)
            if srow != self.last_line_number:
                # Handle a previous backslash.
                if self.backslash_seen:
                    self.gen_backslash()
                # Start a new row.
                raw_val = self.raw_val.rstrip()
                self.backslash_seen = raw_val.endswith('\\')
                # g.trace('backslash_seen',self.backslash_seen)
                if self.output_paren_level > 0:
                    s = self.raw_val.rstrip()
                    n = g.computeLeadingWhitespaceWidth(s, self.tab_width)
                    # This n will be one-too-many if formatting has
                    # changed: foo (
                    # to:      foo(
                    self.gen_line_indent(ws=' ' * n)
                        # Do not set self.lws here!
                self.last_line_number = srow
            if trace: g.trace('%10s %r'% (self.kind,self.val))
            func = getattr(self, 'do_' + self.kind, None)
            if func: func()
        self.gen_file_end()
        return ''.join([z.to_string() for z in self.code_list])

    #
    # Input token handlers...
    #

    def do_comment(self):
        '''Handle a comment token.'''
        raw_val = self.raw_val.rstrip()
        val = self.val.rstrip()
        entire_line = raw_val.lstrip().startswith('#')
        self.backslash_seen = False
            # Putting the comment will put the backslash.
        if entire_line:
            self.clean('line-indent')
            self.add_token('comment', raw_val)
        else:
            self.gen_blank()
            self.add_token('comment', val)

    def do_endmarker(self):
        '''Handle an endmarker token.'''
        pass

    def do_errortoken(self):
        '''Handle an errortoken token.'''
        # This code is executed for versions of Python earlier than 2.4
        if self.val == '@':
            self.gen_op(self.val)

    def do_dedent(self):
        '''Handle dedent token.'''
        self.level -= 1
        self.lws = self.level * self.tab_width * ' '
        self.gen_line_start()
        # End all classes & defs.
        for state in self.stack.stack:
            if state.kind in ('class', 'def'):
                if state.value >= self.level:
                    # g.trace(self.level, 'end', state.kind)
                    self.stack.remove(state.kind)
                else:
                    break

    def do_indent(self):
        '''Handle indent token.'''
        self.level += 1
        self.lws = self.val
        self.gen_line_start()

    def do_name(self):
        '''Handle a name token.'''
        name = self.val
        if name in ('class', 'def'):
            self.gen_class_or_def(name)
        elif name in ('from', 'import'):
            self.gen_import(name)
        elif name == 'self':
            self.gen_self()
        elif self.in_def_line and not self.def_name_seen:
            if name == '__init__':
                name = 'constructor'
            self.gen_word(name)
            if self.stack.has('class'):
                self.gen_op_blank(':')
            else:
                self.gen_op('=')
            self.def_name_seen = True
        elif name in ('and', 'in', 'not', 'not in', 'or'):
            self.gen_word_op(name)
        elif name == 'default':
            # Hard to know where to put a warning comment.
            self.gen_word(name+'_')
        else:
            self.gen_word(name)

    def do_newline(self):
        '''Handle a regular newline.'''
        self.gen_line_end()

    def do_nl(self):
        '''Handle a continuation line.'''
        self.gen_line_end()

    def do_number(self):
        '''Handle a number token.'''
        self.add_token('number', self.val)

    def do_op(self):
        '''Handle an op token.'''
        val = self.val
        if val == '.':
            self.gen_period()
        elif val == '@':
            self.gen_at()
        elif val == ':':
            self.gen_colon()
        elif val == '(':
            self.gen_open_paren()
        elif val == ')':
            self.gen_close_paren()
        elif val == ',':
            self.gen_comma()
        elif val == ';':
            # Pep 8: Avoid extraneous whitespace immediately before
            # comma, semicolon, or colon.
            self.gen_op_blank(val)
        elif val in '[{':
            # Pep 8: Avoid extraneous whitespace immediately inside
            # parentheses, brackets or braces.
            self.gen_lt(val)
        elif val in ']}':
            self.gen_rt(val)
        elif val == '=':
            # Pep 8: Don't use spaces around the = sign when used to indicate
            # a keyword argument or a default parameter value.
            if self.output_paren_level:
                self.gen_op_no_blanks(val)
            else:
                self.gen_op(val)
        elif val in '~+-':
            self.gen_possible_unary_op(val)
        elif val == '*':
            self.gen_star_op()
        elif val == '**':
            self.gen_star_star_op()
        else:
            # Pep 8: always surround binary operators with a single space.
            # '==','+=','-=','*=','**=','/=','//=','%=','!=','<=','>=','<','>',
            # '^','~','*','**','&','|','/','//',
            # Pep 8: If operators with different priorities are used,
            # consider adding whitespace around the operators with the lowest priority(ies).
            self.gen_op(val)

    def do_string(self):
        '''Handle a 'string' token.'''
        self.add_token('string', self.val)
        if self.val.find('\\\n'):
            self.backslash_seen = False
            # This *does* retain the string's spelling.
        self.gen_blank()

    #
    # Output token generators and helpers...
    #

    def add_token(self, kind, value=''):
        '''Add a token to the code list.'''
        token = self.OutputToken(kind, value)
        self.code_list.append(token)
        if kind not in (
            'backslash',
            'blank', 'blank-lines',
            'file-start',
            'line-end', 'line-indent'
        ):
            # g.trace(token,g.callers())
            self.prev_sig_token = token

    def clean(self, kind):
        '''Remove the last item of token list if it has the given kind.'''
        prev = self.code_list[-1]
        if prev.kind == kind:
            self.code_list.pop()

    def clean_blank_lines(self):
        '''Remove all vestiges of previous lines.'''
        table = ('blank-lines', 'line-end', 'line-indent')
        while self.code_list[-1].kind in table:
            self.code_list.pop()

    def gen_at(self):
        
        val = self.val
        assert val == '@', val
        if not self.decorator_seen:
            self.gen_blank_lines(1)
            self.decorator_seen = True
        self.gen_op_no_blanks(val)
        self.stack.push('decorator')

    def gen_backslash(self):
        '''Add a backslash token and clear .backslash_seen'''
        self.add_token('backslash', '\\')
        self.add_token('line-end', '\n')
        self.gen_line_indent()
        self.backslash_seen = False

    def gen_blank(self):
        '''Add a blank request on the code list.'''
        prev = self.code_list[-1]
        if not prev.kind in (
            'blank', 'blank-lines', 'blank-op',
            'file-start',
            'line-end', 'line-indent',
            'lt', 'op-no-blanks', 'unary-op',
        ):
            self.add_token('blank', ' ')

    def gen_blank_lines(self, n):
        '''
        Add a request for n blank lines to the code list.
        Multiple blank-lines request yield at least the maximum of all requests.
        '''
        self.clean_blank_lines()
        kind = self.code_list[-1].kind
        if kind == 'file-start':
            self.add_token('blank-lines', n)
        else:
            for i in range(0, n + 1):
                self.add_token('line-end', '\n')
            # Retain the token (intention) for debugging.
            self.add_token('blank-lines', n)
            self.gen_line_indent()

    def gen_class_or_def(self, name):
        
        # g.trace(self.level, name)
        self.decorator_seen = False
        if self.stack.has('decorator'):
            self.stack.remove('decorator')
            self.clean_blank_lines()
            self.gen_line_end()
        else:
            self.gen_blank_lines(1)
        self.stack.push(name, self.level)
            # name is 'class' or 'def'
            # do_dedent pops these entries.
        if name == 'def':
            self.in_def_line = True
            self.in_class_line = False
            self.def_name_seen = False
        else:
            self.extends_flag = False
            self.in_class_line = True
            self.gen_word(name)

    def gen_close_paren(self):
        
        val = self.val
        assert val == ')', val
        self.input_paren_level -= 1
        if self.in_class_line:
            self.in_class_line = False
        else:
            self.gen_rt(val)
        self.after_self = False

    def gen_colon(self):
        
        val = self.val
        assert val == ':', val
        if self.in_def_line:
            if self.input_paren_level == 0:
                self.in_def_line = False
                self.gen_op('->')
        elif self.in_class_line:
            if self.input_paren_level == 0:
                self.in_class_line = False
        else:
            pass
            # TODO
            # Some colons are correct.
            # self.gen_op_blank(val)

    def gen_comma(self):
        
        val = self.val
        assert val == ',', val
        if self.after_self:
            self.after_self = False
        else:
            # Pep 8: Avoid extraneous whitespace immediately before
            # comma, semicolon, or colon.
            self.gen_op_blank(val)

    def gen_file_end(self):
        '''
        Add a file-end token to the code list.
        Retain exactly one line-end token.
        '''
        self.clean_blank_lines()
        self.add_token('line-end', '\n')
        self.add_token('line-end', '\n')
        self.add_token('file-end')

    def gen_file_start(self):
        '''Add a file-start token to the code list and the state stack.'''
        self.add_token('file-start')
        self.stack.push('file-start')

    def gen_import(self, name):
        '''Convert an import to something that looks like a call.'''
        self.gen_word('pass')
        self.add_token('comment', '# ' + name)

    def gen_line_indent(self, ws=None):
        '''Add a line-indent token if indentation is non-empty.'''
        self.clean('line-indent')
        ws = ws or self.lws
        if ws:
            self.add_token('line-indent', ws)

    def gen_line_end(self):
        '''Add a line-end request to the code list.'''
        prev = self.code_list[-1]
        if prev.kind == 'file-start':
            return
        self.clean('blank') # Important!
        if self.delete_blank_lines:
            self.clean_blank_lines()
        self.clean('line-indent')
        if self.backslash_seen:
            self.gen_backslash()
        self.add_token('line-end', '\n')
        self.gen_line_indent()
            # Add the indentation for all lines
            # until the next indent or unindent token.

    def gen_line_start(self):
        '''Add a line-start request to the code list.'''
        self.gen_line_indent()

    def gen_lt(self, s):
        '''Add a left paren to the code list.'''
        assert s in '([{', repr(s)
        self.output_paren_level += 1
        self.clean('blank')
        prev = self.code_list[-1]
        if self.in_def_line:
            self.gen_blank()
            self.add_token('lt', s)
        elif prev.kind in ('op', 'word-op'):
            self.gen_blank()
            if s == '(':
                # g.trace(self.prev_sig_token)
                s = '['
                self.stack.push('tuple', self.output_paren_level)
            self.add_token('lt', s)
        elif prev.kind == 'word':
            # Only suppress blanks before '(' or '[' for non-keyworks.
            if s == '{' or prev.value in ('if', 'else', 'return'):
                self.gen_blank()
            self.add_token('lt', s)
        elif prev.kind == 'op':
            self.gen_op(s)
        else:
            self.gen_op_no_blanks(s)

    def gen_rt(self, s):
        '''Add a right paren to the code list.'''
        assert s in ')]}', repr(s)
        self.output_paren_level -= 1
        prev = self.code_list[-1]
        if prev.kind == 'arg-end':
            # Remove a blank token preceding the arg-end token.
            prev = self.code_list.pop()
            self.clean('blank')
            self.code_list.append(prev)
        else:
            self.clean('blank')
            prev = self.code_list[-1]
        if self.stack.has('tuple'):
            # g.trace('line', self.last_line_number, self.output_paren_level + 1)
            state = self.stack.get('tuple')
            if state.value == self.output_paren_level + 1:
                self.add_token('rt', ']')
                self.stack.remove('tuple')
            else:
                self.add_token('rt', s)
        elif s == ')' and prev and prev.kind == 'lt' and prev.value == '(':
            # Remove ()
            self.code_list.pop()
        else:
            self.add_token('rt', s)

    def gen_op(self, s):
        '''Add op token to code list.'''
        assert s and g.isString(s), repr(s)
        self.gen_blank()
        self.add_token('op', s)
        self.gen_blank()

    def gen_op_blank(self, s):
        '''Remove a preceding blank token, then add op and blank tokens.'''
        assert s and g.isString(s), repr(s)
        self.clean('blank')
        self.add_token('op', s)
        self.gen_blank()

    def gen_op_no_blanks(self, s):
        '''Add an operator *not* surrounded by blanks.'''
        self.clean('blank')
        self.add_token('op-no-blanks', s)
        
    def gen_blank_op(self, s):
        '''Add an operator possibly with a preceding blank.'''
        self.gen_blank()
        self.add_token('blank-op', s)

    def gen_open_paren(self):
        
        val = self.val
        assert val == '(', val
        self.input_paren_level += 1
        if self.in_class_line:
            if not self.extends_flag:
                self.gen_word('extends')
                self.extends_flag = True
        else:
            # Generate a function call or a list.
            self.gen_lt(val)
        self.after_self = False

    def gen_period(self):
        
        val = self.val
        assert val == '.', val
        if self.after_self:
            self.after_self = False
        else:
            self.gen_op_no_blanks(val)

    def gen_possible_unary_op(self, s):
        '''Add a unary or binary op to the token list.'''
        self.clean('blank')
        prev = self.code_list[-1]
        if prev.kind in ('lt', 'op', 'op-no-blanks', 'word-op'):
            self.gen_unary_op(s)
        elif prev.kind == 'word' and prev.value in ('elif', 'if', 'return', 'while'):
            self.gen_unary_op(s)
        else:
            self.gen_op(s)

    def gen_unary_op(self, s):
        '''Add an operator request to the code list.'''
        assert s and g.isString(s), repr(s)
        self.gen_blank()
        self.add_token('unary-op', s)

    def gen_self(self):
        if self.in_def_line:
            self.after_self = True
        else:
            self.gen_blank_op('@')
            self.after_self = True

    def gen_star_op(self):
        '''Put a '*' op, with special cases for *args.'''
        val = '*'
        if self.output_paren_level:
            i = len(self.code_list) - 1
            if self.code_list[i].kind == 'blank':
                i -= 1
            token = self.code_list[i]
            if token.kind == 'lt':
                self.gen_op_no_blanks(val)
            elif token.value == ',':
                self.gen_blank()
                self.add_token('op-no-blanks', val)
            else:
                self.gen_op(val)
        else:
            self.gen_op(val)

    def gen_star_star_op(self):
        '''Put a ** operator, with a special case for **kwargs.'''
        val = '**'
        if self.output_paren_level:
            i = len(self.code_list) - 1
            if self.code_list[i].kind == 'blank':
                i -= 1
            token = self.code_list[i]
            if token.value == ',':
                self.gen_blank()
                self.add_token('op-no-blanks', val)
            else:
                self.gen_op(val)
        else:
            self.gen_op(val)

    def gen_word(self, s):
        '''Add a word request to the code list.'''
        assert s and g.isString(s), repr(s)
        self.gen_blank()
        self.add_token('word', s)
        self.gen_blank()

    def gen_word_op(self, s):
        '''Add a word-op request to the code list.'''
        assert s and g.isString(s), repr(s)
        self.gen_blank()
        self.add_token('word-op', s)
        self.gen_blank()


class CoffeeScriptTraverser(object):
    '''A class to convert python sources to coffeescript sources.'''
    # pylint: disable=consider-using-enumerate
    
    def __init__(self, controller):
        '''Ctor for CoffeeScriptFormatter class.'''
        self.controller = controller
        self.first_statement = False

    def format(self, node, tokens):
        '''Format the node (or list of nodes) and its descendants.'''
        self.level = 0
        self.tokens = tokens
        val = self.visit(node)
        return val or ''

    def indent(self, s):
        '''Return s, properly indented.'''
        assert not s.startswith('\n'), g.callers()
        return '%s%s' % (' ' * 4 * self.level, s)

    def visit(self, node):
        '''Return the formatted version of an Ast node, or list of Ast nodes.'''
        # g.trace(node.__class__.__name__)
        if isinstance(node, (list, tuple)):
            return ', '.join([self.visit(z) for z in node])
        elif node is None:
            return 'None'
        else:
            assert isinstance(node, ast.AST), node.__class__.__name__
            method_name = 'do_' + node.__class__.__name__
            method = getattr(self, method_name)
            s = method(node)
            # pylint: disable=unidiomatic-typecheck
            assert type(s) == type('abc'), (node, type(s))
            return s

    # Contexts...

    # ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

    def do_ClassDef(self, node):
        result = []
        name = node.name # Only a plain string is valid.
        bases = [self.visit(z) for z in node.bases] if node.bases else []
        result.append('\n\n')
        if bases:
            result.append(self.indent('class %s(%s):\n' % (name, ', '.join(bases))))
        else:
            result.append(self.indent('class %s:\n' % name))
        for i, z in enumerate(node.body):
            self.level += 1
            self.first_statement = i == 0
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

    def do_FunctionDef(self, node):
        '''Format a FunctionDef node.'''
        result = []
        if node.decorator_list:
            for z in node.decorator_list:
                result.append(self.indent('@%s\n' % self.visit(z)))
        name = node.name # Only a plain string is valid.
        args = self.visit(node.args) if node.args else ''
        result.append('\n')
        result.append(self.indent('def %s(%s):\n' % (name, args)))
        for i, z in enumerate(node.body):
            self.level += 1
            self.first_statement = i == 0
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    def do_Interactive(self, node):
        for z in node.body:
            self.visit(z)

    def do_Module(self, node):

        return''.join([self.visit(z) for z in node.body])

    def do_Lambda(self, node):
        return self.indent('lambda %s: %s' % (
            self.visit(node.args),
            self.visit(node.body)))

    # Expressions...

    def do_Expr(self, node):
        '''An outer expression: must be indented.'''
        return self.indent('%s\n' % self.visit(node.value))

    def do_Expression(self, node):
        '''An inner expression: do not indent.'''
        return '%s\n' % self.visit(node.body)

    def do_GeneratorExp(self, node):
        elt = self.visit(node.elt) or ''
        gens = [self.visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens] # Kludge: probable bug.
        return '<gen %s for %s>' % (elt, ','.join(gens))

    def do_AugLoad(self, node):
        return 'AugLoad'

    def do_Del(self, node):
        return 'Del'

    def do_Load(self, node):
        return 'Load'

    def do_Param(self, node):
        return 'Param'

    def do_Store(self, node):
        return 'Store'

    # Operands...

    # arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

    def do_arguments(self, node):
        '''Format the arguments node.'''
        assert isinstance(node, ast.arguments)
        args = [self.visit(z) for z in node.args]
        defaults = [self.visit(z) for z in node.defaults]
        # Assign default values to the last args.
        args2 = []
        n_plain = len(args) - len(defaults)
        for i in range(len(args)):
            if i < n_plain:
                args2.append(args[i])
            else:
                args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
        # Now add the vararg and kwarg args.
        name = getattr(node, 'vararg', None)
        if name:
            # pylint: disable=no-member
            if isPython3 and isinstance(name, ast.arg):
                name = name.arg
            args2.append('*' + name)
        name = getattr(node, 'kwarg', None)
        if name:
            # pylint: disable=no-member
            if isPython3 and isinstance(name, ast.arg):
                name = name.arg
            args2.append('**' + name)
        return ','.join(args2)

    # Python 3:
    # arg = (identifier arg, expr? annotation)

    def do_arg(self, node):
        return node.arg

    # Attribute(expr value, identifier attr, expr_context ctx)

    def do_Attribute(self, node):
        return '%s.%s' % (
            self.visit(node.value),
            node.attr) # Don't visit node.attr: it is always a string.

    def do_Bytes(self, node): # Python 3.x only.
        return str(node.s)

    # Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

    def do_Call(self, node):
        func = self.visit(node.func)
        args = [self.visit(z) for z in node.args]
        for z in node.keywords:
            # Calls f.do_keyword.
            args.append(self.visit(z))
        if getattr(node, 'starargs', None):
            args.append('*%s' % (self.visit(node.starargs)))
        if getattr(node, 'kwargs', None):
            args.append('**%s' % (self.visit(node.kwargs)))
        args = [z for z in args if z] # Kludge: Defensive coding.
        return '%s(%s)' % (func, ','.join(args))

    # keyword = (identifier arg, expr value)

    def do_keyword(self, node):
        # node.arg is a string.
        value = self.visit(node.value)
        # This is a keyword *arg*, not a Python keyword!
        return '%s=%s' % (node.arg, value)

    def do_comprehension(self, node):
        result = []
        name = self.visit(node.target) # A name.
        it = self.visit(node.iter) # An attribute.
        result.append('%s in %s' % (name, it))
        ifs = [self.visit(z) for z in node.ifs]
        if ifs:
            result.append(' if %s' % (''.join(ifs)))
        return ''.join(result)

    def do_Dict(self, node):
        result = []
        keys = [self.visit(z) for z in node.keys]
        values = [self.visit(z) for z in node.values]
        if len(keys) == len(values):
            # result.append('{\n' if keys else '{')
            result.append('{')
            items = []
            for i in range(len(keys)):
                items.append('%s:%s' % (keys[i], values[i]))
            result.append(', '.join(items))
            result.append('}')
            # result.append(',\n'.join(items))
            # result.append('\n}' if keys else '}')
        else:
            print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
                repr(keys), repr(values)))
        return ''.join(result)

    def do_Ellipsis(self, node):
        return '...'

    def do_ExtSlice(self, node):
        return ':'.join([self.visit(z) for z in node.dims])

    def do_Index(self, node):
        return self.visit(node.value)

    def do_List(self, node):
        # Not used: list context.
        # self.visit(node.ctx)
        elts = [self.visit(z) for z in node.elts]
        elst = [z for z in elts if z] # Defensive.
        return '[%s]' % ','.join(elts)

    def do_ListComp(self, node):
        elt = self.visit(node.elt)
        gens = [self.visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens] # Kludge: probable bug.
        return '%s for %s' % (elt, ''.join(gens))

    def do_Name(self, node):
        return node.id

    def do_NameConstant(self, node): # Python 3 only.
        s = repr(node.value)
        return 'bool' if s in ('True', 'False') else s

    def do_Num(self, node):
        return repr(node.n)

    # Python 2.x only

    def do_Repr(self, node):
        return 'repr(%s)' % self.visit(node.value)

    def do_Slice(self, node):
        lower, upper, step = '', '', ''
        if getattr(node, 'lower', None) is not None:
            lower = self.visit(node.lower)
        if getattr(node, 'upper', None) is not None:
            upper = self.visit(node.upper)
        if getattr(node, 'step', None) is not None:
            step = self.visit(node.step)
        if step:
            return '%s:%s:%s' % (lower, upper, step)
        else:
            return '%s:%s' % (lower, upper)

    def do_Str(self, node):
        '''A string constant, including docstrings.'''
        # A pretty spectacular hack.
        # We assume docstrings are the first expr following a class or def.
        docstring = False
        if self.first_statement:
            callers = ''.join([z for z in g.callers(2).split(',') if z != 'visit'])
            docstring = callers.endswith('do_Expr')
        if docstring:
            s = repr(node.s).replace('\\n','\n')
            if s.startswith('"'):
                return '""%s""' % s
            else:
                return "''%s''" % s
        else:
            return repr(node.s)

    # Subscript(expr value, slice slice, expr_context ctx)

    def do_Subscript(self, node):
        value = self.visit(node.value)
        the_slice = self.visit(node.slice)
        return '%s[%s]' % (value, the_slice)

    def do_Tuple(self, node):
        elts = [self.visit(z) for z in node.elts]
        return '(%s)' % ', '.join(elts)

    # Operators...

    def op_name (self,node,strict=True):
        '''Return the print name of an operator node.'''
        d = {
            # Binary operators. 
            'Add':       '+',
            'BitAnd':    '&',
            'BitOr':     '|',
            'BitXor':    '^',
            'Div':       '/',
            'FloorDiv':  '//',
            'LShift':    '<<',
            'Mod':       '%',
            'Mult':      '*',
            'Pow':       '**',
            'RShift':    '>>',
            'Sub':       '-',
            # Boolean operators.
            'And':   ' and ',
            'Or':    ' or ',
            # Comparison operators
            'Eq':    '==',
            'Gt':    '>',
            'GtE':   '>=',
            'In':    ' in ',
            'Is':    ' is ',
            'IsNot': ' is not ',
            'Lt':    '<',
            'LtE':   '<=',
            'NotEq': '!=',
            'NotIn': ' not in ',
            # Context operators.
            'AugLoad':  '<AugLoad>',
            'AugStore': '<AugStore>',
            'Del':      '<Del>',
            'Load':     '<Load>',
            'Param':    '<Param>',
            'Store':    '<Store>',
            # Unary operators.
            'Invert':   '~',
            'Not':      ' not ',
            'UAdd':     '+',
            'USub':     '-',
        }
        kind = node.__class__.__name__
        name = d.get(kind,'<%s>' % kind)
        if strict: assert name, kind
        return name

    def do_BinOp(self, node):
        return '%s%s%s' % (
            self.visit(node.left),
            self.op_name(node.op),
            self.visit(node.right))

    def do_BoolOp(self, node):
        op_name = self.op_name(node.op)
        values = [self.visit(z) for z in node.values]
        return op_name.join(values)

    def do_Compare(self, node):
        result = []
        lt = self.visit(node.left)
        ops = [self.op_name(z) for z in node.ops]
        comps = [self.visit(z) for z in node.comparators]
        result.append(lt)
        if len(ops) == len(comps):
            for i in range(len(ops)):
                result.append('%s%s' % (ops[i], comps[i]))
        else:
            print('can not happen: ops', repr(ops), 'comparators', repr(comps))
        return ''.join(result)

    def do_IfExp(self, node):
        return '%s if %s else %s ' % (
            self.visit(node.body),
            self.visit(node.test),
            self.visit(node.orelse))

    def do_UnaryOp(self, node):
        return '%s%s' % (
            self.op_name(node.op),
            self.visit(node.operand))

    # Statements...

    def do_Assert(self, node):
        test = self.visit(node.test)
        if getattr(node, 'msg', None):
            message = self.visit(node.msg)
            return self.indent('assert %s, %s\n' % (test, message))
        else:
            return self.indent('assert %s\n' % test)

    def do_Assign(self, node):
        return self.indent('%s=%s\n' % (
            '='.join([self.visit(z) for z in node.targets]),
            self.visit(node.value)))

    def do_AugAssign(self, node):
        return self.indent('%s%s=%s\n' % (
            self.visit(node.target),
            self.op_name(node.op), # Bug fix: 2013/03/08.
            self.visit(node.value)))

    def do_Break(self, node):
        return self.indent('break\n')

    def do_Continue(self, node):
        return self.indent('continue\n')

    def do_Delete(self, node):
        targets = [self.visit(z) for z in node.targets]
        return self.indent('del %s\n' % ','.join(targets))

    def do_ExceptHandler(self, node):
        result = []
        result.append(self.indent('except'))
        if getattr(node, 'type', None):
            result.append(' %s' % self.visit(node.type))
        if getattr(node, 'name', None):
            if isinstance(node.name, ast.AST):
                result.append(' as %s' % self.visit(node.name))
            else:
                result.append(' as %s' % node.name) # Python 3.x.
        result.append(':\n')
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    # Python 2.x only

    def do_Exec(self, node):
        body = self.visit(node.body)
        args = [] # Globals before locals.
        if getattr(node, 'globals', None):
            args.append(self.visit(node.globals))
        if getattr(node, 'locals', None):
            args.append(self.visit(node.locals))
        if args:
            return self.indent('exec %s in %s\n' % (
                body, ','.join(args)))
        else:
            return self.indent('exec %s\n' % (body))

    def do_For(self, node):
        result = []
        result.append(self.indent('for %s in %s:\n' % (
            self.visit(node.target),
            self.visit(node.iter))))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    def do_Global(self, node):
        return self.indent('global %s\n' % (
            ','.join(node.names)))

    def do_If(self, node):
        result = []
        result.append(self.indent('if %s:\n' % (
            self.visit(node.test))))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    def do_Import(self, node):
        names = []
        for fn, asname in self.get_import_names(node):
            if asname:
                names.append('%s as %s' % (fn, asname))
            else:
                names.append(fn)
        return self.indent('import %s\n' % (
            ','.join(names)))

    def get_import_names(self, node):
        '''Return a list of the the full file names in the import statement.'''
        result = []
        for ast2 in node.names:
            assert isinstance(ast2, ast.alias)
            data = ast2.name, ast2.asname
            result.append(data)
        return result

    def do_ImportFrom(self, node):
        names = []
        for fn, asname in self.get_import_names(node):
            if asname:
                names.append('%s as %s' % (fn, asname))
            else:
                names.append(fn)
        return self.indent('from %s import %s\n' % (
            node.module,
            ','.join(names)))

    def do_Pass(self, node):
        return self.indent('pass\n')

    # Python 2.x only

    def do_Print(self, node):
        vals = []
        for z in node.values:
            vals.append(self.visit(z))
        if getattr(node, 'dest', None):
            vals.append('dest=%s' % self.visit(node.dest))
        if getattr(node, 'nl', None):
            if node.nl == 'False':
                vals.append('nl=%s' % node.nl)
        return self.indent('print(%s)\n' % (
            ','.join(vals)))

    def do_Raise(self, node):
        args = []
        for attr in ('type', 'inst', 'tback'):
            if getattr(node, attr, None) is not None:
                args.append(self.visit(getattr(node, attr)))
        if args:
            return self.indent('raise %s\n' % (
                ','.join(args)))
        else:
            return self.indent('raise\n')

    def do_Return(self, node):
        if node.value:
            return self.indent('return %s\n' % (
                self.visit(node.value).strip()))
        else:
            return self.indent('return\n')

    # Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

    def do_Try(self, node): # Python 3
        result = []
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.handlers:
            for z in node.handlers:
                result.append(self.visit(z))
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        if node.finalbody:
            result.append(self.indent('finally:\n'))
            for z in node.finalbody:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    def do_TryExcept(self, node):
        result = []
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.handlers:
            for z in node.handlers:
                result.append(self.visit(z))
        if node.orelse:
            result.append('else:\n')
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    def do_TryFinally(self, node):
        result = []
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        result.append(self.indent('finally:\n'))
        for z in node.finalbody:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    def do_While(self, node):
        result = []
        result.append(self.indent('while %s:\n' % (
            self.visit(node.test))))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.orelse:
            result.append('else:\n')
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    def do_With(self, node):
        result = []
        result.append(self.indent('with '))
        if hasattr(node, 'context_expression'):
            result.append(self.visit(node.context_expresssion))
        vars_list = []
        if hasattr(node, 'optional_vars'):
            try:
                for z in node.optional_vars:
                    vars_list.append(self.visit(z))
            except TypeError: # Not iterable.
                vars_list.append(self.visit(node.optional_vars))
        result.append(','.join(vars_list))
        result.append(':\n')
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        result.append('\n')
        return ''.join(result)

    def do_Yield(self, node):
        if getattr(node, 'value', None):
            return self.indent('yield %s\n' % (
                self.visit(node.value)))
        else:
            return self.indent('yield\n')


class LeoGlobals(object):
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''


    class NullObject:
        """
        An object that does nothing, and does it very well.
        From the Python cookbook, recipe 5.23
        """
        def __init__(self, *args, **keys): pass
        def __call__(self, *args, **keys): return self
        def __repr__(self): return "NullObject"
        def __str__(self): return "NullObject"
        def __bool__(self): return False
        def __nonzero__(self): return 0
        def __delattr__(self, attr): return self
        def __getattr__(self, attr): return self
        def __setattr__(self, attr, val): return self


    class ReadLinesClass:
        """A class whose next method provides a readline method for Python's tokenize module."""

        def __init__(self, s):
            self.lines = s.splitlines(True) if s else []
                # g.splitLines(s)
            self.i = 0

        def next(self):
            if self.i < len(self.lines):
                line = self.lines[self.i]
                self.i += 1
            else:
                line = ''
            # g.trace(repr(line))
            return line

        __next__ = next

    def _callerName(self, n=1, files=False):
        # print('_callerName: %s %s' % (n,files))
        try: # get the function name from the call stack.
            f1 = sys._getframe(n) # The stack frame, n levels up.
            code1 = f1.f_code # The code object
            name = code1.co_name
            if name == '__init__':
                name = '__init__(%s,line %s)' % (
                    self.shortFileName(code1.co_filename), code1.co_firstlineno)
            if files:
                return '%s:%s' % (self.shortFileName(code1.co_filename), name)
            else:
                return name # The code name
        except ValueError:
            # print('g._callerName: ValueError',n)
            return '' # The stack is not deep enough.
        except Exception:
            # es_exception()
            return '' # "<no caller name>"

    def callers(self, n=4, count=0, excludeCaller=True, files=False):
        '''Return a list containing the callers of the function that called g.callerList.

        If the excludeCaller keyword is True (the default), g.callers is not on the list.

        If the files keyword argument is True, filenames are included in the list.
        '''
        # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
        # The jython stack often has less than 8 entries,
        # so we must be careful to call g._callerName with smaller values of i first.
        result = []
        i = 3 if excludeCaller else 2
        while 1:
            s = self._callerName(i, files=files)
            # print(i,s)
            if s:
                result.append(s)
            if not s or len(result) >= n: break
            i += 1
        result.reverse()
        if count > 0: result = result[: count]
        sep = '\n' if files else ','
        return sep.join(result)

    def cls(self):
        '''Clear the screen.'''
        if sys.platform.lower().startswith('win'):
            os.system('cls')

    def computeLeadingWhitespace(self, width, tab_width):
        '''Returns optimized whitespace corresponding to width with the indicated tab_width.'''
        if width <= 0:
            return ""
        elif tab_width > 1:
            tabs = int(width / tab_width)
            blanks = int(width % tab_width)
            return ('\t' * tabs) + (' ' * blanks)
        else: # Negative tab width always gets converted to blanks.
            return (' ' * width)

    def computeLeadingWhitespaceWidth(self, s, tab_width):
        '''Returns optimized whitespace corresponding to width with the indicated tab_width.'''
        w = 0
        for ch in s:
            if ch == ' ':
                w += 1
            elif ch == '\t':
                w += (abs(tab_width) - (w % abs(tab_width)))
            else:
                break
        return w

    def isString(self, s):
        '''Return True if s is any string, but not bytes.'''
        if isPython3:
            return type(s) == type('a')
        else:
            return type(s) in types.StringTypes

    def isUnicode(self, s):
        '''Return True if s is a unicode string.'''
        if isPython3:
            return type(s) == type('a')
        else:
            return type(s) == types.UnicodeType

    def pdb(self):
        try:
            import leo.core.leoGlobals as leo_g
            leo_g.pdb()
        except ImportError:
            import pdb
            pdb.set_trace()

    def shortFileName(self, fileName, n=None):
        if n is None or n < 1:
            return os.path.basename(fileName)
        else:
            return '/'.join(fileName.replace('\\', '/').split('/')[-n:])

    def splitLines(self, s):
        '''Split s into lines, preserving trailing newlines.'''
        return s.splitlines(True) if s else []

    def toUnicode(self, s, encoding='utf-8', reportErrors=False):
        '''Connvert a non-unicode string with the given encoding to unicode.'''
        trace = False
        if g.isUnicode(s):
            return s
        if not encoding:
            encoding = 'utf-8'
        # These are the only significant calls to s.decode in Leo.
        # Tracing these calls directly yields thousands of calls.
        # Never call g.trace here!
        try:
            s = s.decode(encoding, 'strict')
        except UnicodeError:
            s = s.decode(encoding, 'replace')
            if trace or reportErrors:
                g.trace(g.callers())
                print("toUnicode: Error converting %s... from %s encoding to unicode" % (
                    s[: 200], encoding))
        except AttributeError:
            if trace:
                print('toUnicode: AttributeError!: %s' % s)
            # May be a QString.
            s = g.u(s)
        if trace and encoding == 'cp1252':
            print('toUnicode: returns %s' % s)
        return s

    def trace(self, *args, **keys):
        try:
            import leo.core.leoGlobals as leo_g
            leo_g.trace(caller_level=2, *args, **keys)
        except ImportError:
            print(args, keys)

    if isPython3:

        def u(self, s):
            return s

        def ue(self, s, encoding):
            return s if g.isUnicode(s) else str(s, encoding)

    else:

        def u(self, s):
            return unicode(s)

        def ue(self, s, encoding):
            return unicode(s, encoding)


class MakeCoffeeScriptController(object):
    '''The controller class for python_to_coffeescript.py.'''


    def __init__(self):
        '''Ctor for MakeCoffeeScriptController class.'''
        self.options = {}
        # Ivars set on the command line...
        self.config_fn = None
        self.enable_unit_tests = False
        self.files = [] # May also be set in the config file.
        self.section_names = ('Global',)
        # Ivars set in the config file...
        self.output_directory = self.finalize('.')
        self.overwrite = False
        self.verbose = False # Trace config arguments.

    def finalize(self, fn):
        '''Finalize and regularize a filename.'''
        fn = os.path.expanduser(fn)
        fn = os.path.abspath(fn)
        fn = os.path.normpath(fn)
        return fn

    def make_coffeescript_file(self, fn):
        '''
        Make a stub file in the output directory for all source files mentioned
        in the [Source Files] section of the configuration file.
        '''
        if not fn.endswith('.py'):
            print('not a python file', fn)
            return
        if not os.path.exists(fn):
            print('not found', fn)
            return
        base_fn = os.path.basename(fn)
        out_fn = os.path.join(self.output_directory, base_fn)
        out_fn = os.path.normpath(out_fn)
        out_fn = out_fn[: -3] + '.coffee'
        dir_ = os.path.dirname(out_fn)
        if os.path.exists(out_fn) and not self.overwrite:
            print('file exists: %s' % out_fn)
        elif not dir_ or os.path.exists(dir_):
            t1 = time.clock()
            s = open(fn).read()
            readlines = g.ReadLinesClass(s).next
            tokens = list(tokenize.generate_tokens(readlines))
            if use_tree:
                node = ast.parse(s, filename=fn, mode='exec')
                s = CoffeeScriptTraverser(controller=self).format(node, tokens)
            else:
                s = CoffeeScriptTokenizer(controller=self).format(tokens)
            f = open(out_fn, 'w')
            self.output_time_stamp(f)
            f.write(s)
            f.close()
            print('wrote: %s' % out_fn)
        else:
            print('output directory not not found: %s' % dir_)

    def output_time_stamp(self, f):
        '''Put a time-stamp in the output file f.'''
        f.write('# python_to_coffeescript: %s\n' %
            time.strftime("%a %d %b %Y at %H:%M:%S"))

    def run(self):
        '''
        Make stub files for all files.
        Do nothing if the output directory does not exist.
        '''
        if self.enable_unit_tests:
            self.run_all_unit_tests()
        if self.files:
            dir_ = self.output_directory
            if dir_:
                if os.path.exists(dir_):
                    for fn in self.files:
                        self.make_coffeescript_file(fn)
                else:
                    print('output directory not found: %s' % dir_)
            else:
                print('no output directory')
        elif not self.enable_unit_tests:
            print('no input files')

    def run_all_unit_tests(self):
        '''Run all unit tests in the python-to-coffeescript/test directory.'''
        import unittest
        loader = unittest.TestLoader()
        suite = loader.discover(os.path.abspath('.'),
                                pattern='test*.py',
                                top_level_dir=None)
        unittest.TextTestRunner(verbosity=1).run(suite)

    def scan_command_line(self):
        '''Set ivars from command-line arguments.'''
        # This automatically implements the --help option.
        usage = "usage: python_to_coffeescript.py [options] file1, file2, ..."
        parser = optparse.OptionParser(usage=usage)
        add = parser.add_option
        add('-c', '--config', dest='fn',
            help='full path to configuration file')
        add('-d', '--dir', dest='dir',
            help='full path to the output directory')
        add('-o', '--overwrite', action='store_true', default=False,
            help='overwrite existing .coffee files')
        add('-t', '--test', action='store_true', default=False,
            help='run unit tests on startup')
        add('-v', '--verbose', action='store_true', default=False,
            help='verbose output')
        # Parse the options
        options, args = parser.parse_args()
        # Handle the options...
        self.enable_unit_tests = options.test
        self.overwrite = options.overwrite
        if options.fn:
            self.config_fn = options.fn
        if options.dir:
            dir_ = options.dir
            dir_ = self.finalize(dir_)
            if os.path.exists(dir_):
                self.output_directory = dir_
            else:
                print('--dir: directory does not exist: %s' % dir_)
                print('exiting')
                sys.exit(1)
        # If any files remain, set self.files.
        if args:
            args = [self.finalize(z) for z in args]
            if args:
                self.files = args

    def scan_options(self):
        '''Set all configuration-related ivars.'''
        trace = False
        if not self.config_fn:
            return
        self.parser = parser = self.create_parser()
        s = self.get_config_string()
        self.init_parser(s)
        if self.files:
            files_source = 'command-line'
            files = self.files
        elif parser.has_section('Global'):
            files_source = 'config file'
            files = parser.get('Global', 'files')
            files = [z.strip() for z in files.split('\n') if z.strip()]
        else:
            return
        files2 = []
        for z in files:
            files2.extend(glob.glob(self.finalize(z)))
        self.files = [z for z in files2 if z and os.path.exists(z)]
        if trace:
            print('Files (from %s)...\n' % files_source)
            for z in self.files:
                print(z)
            print('')
        if 'output_directory' in parser.options('Global'):
            s = parser.get('Global', 'output_directory')
            output_dir = self.finalize(s)
            if os.path.exists(output_dir):
                self.output_directory = output_dir
                if self.verbose:
                    print('output directory: %s\n' % output_dir)
            else:
                print('output directory not found: %s\n' % output_dir)
                self.output_directory = None # inhibit run().
        if 'prefix_lines' in parser.options('Global'):
            prefix = parser.get('Global', 'prefix_lines')
            self.prefix_lines = prefix.split('\n')
                # The parser does not preserve leading whitespace.
            if trace:
                print('Prefix lines...\n')
                for z in self.prefix_lines:
                    print(z)
                print('')
        #
        # self.def_patterns = self.scan_patterns('Def Name Patterns')
        # self.general_patterns = self.scan_patterns('General Patterns')
        # self.make_patterns_dict()

    def create_parser(self):
        '''Create a RawConfigParser and return it.'''
        parser = configparser.RawConfigParser(dict_type=OrderedDict)
            # Requires Python 2.7
        parser.optionxform = str
        return parser

    def get_config_string(self):
        fn = self.finalize(self.config_fn)
        if os.path.exists(fn):
            if self.verbose:
                print('\nconfiguration file: %s\n' % fn)
            f = open(fn, 'r')
            s = f.read()
            f.close()
            return s
        else:
            print('\nconfiguration file not found: %s' % fn)
            return ''

    def init_parser(self, s):
        '''Add double back-slashes to all patterns starting with '['.'''
        trace = False
        if not s: return
        aList = []
        for s in s.split('\n'):
            if self.is_section_name(s):
                aList.append(s)
            elif s.strip().startswith('['):
                aList.append(r'\\' + s[1:])
                if trace: g.trace('*** escaping:', s)
            else:
                aList.append(s)
        s = '\n'.join(aList) + '\n'
        if trace: g.trace(s)
        file_object = io.StringIO(s)
        self.parser.readfp(file_object)

    def is_section_name(self, s):

        def munge(s):
            return s.strip().lower().replace(' ', '')

        s = s.strip()
        if s.startswith('[') and s.endswith(']'):
            s = munge(s[1: -1])
            for s2 in self.section_names:
                if s == munge(s2):
                    return True
        return False


class ParseState(object):
    '''A class representing items parse state stack.'''

    def __init__(self, kind, value):
        self.kind = kind
        self.value = value

    def __repr__(self):
        return 'State: %10s %s' % (self.kind, repr(self.value))

    __str__ = __repr__


class TestClass(object):
    '''A class containing constructs that have caused difficulties.'''
    # pylint: disable=no-member
    # pylint: disable=undefined-variable
    # pylint: disable=no-self-argument
    # pylint: disable=no-method-argument


    def parse_group(group):
        if len(group) >= 3 and group[-2] == 'as':
            del group[-2:]
        ndots = 0
        i = 0
        while len(group) > i and group[i].startswith('.'):
            ndots += len(group[i])
            i += 1
        assert ''.join(group[: i]) == '.' * ndots, group
        del group[: i]
        assert all(g == '.' for g in group[1:: 2]), group
        return ndots, os.sep.join(group[:: 2])

    def return_all(self):
        return all([is_known_type(z) for z in s3.split(',')])
        # return all(['abc'])

    def return_array():
        return f(s[1: -1])

    def return_list(self, a):
        return [a]

    def return_two_lists(s):
        if 1:
            return aList
        else:
            return list(self.regex.finditer(s))


class TokenSync(object):
    '''A class to sync and remember tokens.'''

    def __init__(self, tokens):
        '''Ctor for TokenSync class.'''
        self.tab_width = 4
        self.tokens = tokens
        # Accumulation ivars...
        # self.lws = 0
        self.returns = []
        self.ws = []
        # State ivars...
        self.backslash_seen = False
        self.last_line_number = None
        self.output_paren_level = 0
        # TODO (maybe)...
        # self.kind = None
        # self.raw_val = None
        # self.val = = None

    def advance(self):
        '''Advance one token. Update ivars.'''
        trace = False
        if not self.tokens:
            return
        token5tuple = self.tokens.pop(0)
        t1, t2, t3, t4, t5 = token5tuple
        srow, scol = t3
        kind = token.tok_name[t1].lower()
        val = g.toUnicode(t2)
        raw_val = g.toUnicode(t5).rstrip()
        if srow != self.last_line_number:
            # Handle a previous backslash.
            if self.backslash_seen:
                self.do_backslash()
            # Start a new row.
            self.backslash_seen = raw_val.endswith('\\')
            if self.output_paren_level > 0:
                s = raw_val
                n = g.computeLeadingWhitespaceWidth(s, self.tab_width)
                # This n will be one-too-many if formatting has
                # changed: foo (
                # to:      foo(
                self.do_line_indent(ws=' ' * n)
                    # Do not set self.lws here!
            self.last_line_number = srow
        if trace: g.trace('%10s %r'% (kind,val))

    def do_backslash(self):
        '''Handle a backslash-newline.'''

    def do_line_indent(self, ws=None):
        '''Handle line indentation.'''
        # self.clean('line-indent')
        # ws = ws or self.lws
        # if ws:
            # self.add_token('line-indent', ws)

g = LeoGlobals() # For ekr.
if __name__ == "__main__":
    main()
