# python_to_coffeescript: Sat 20 Feb 2016 at 11:07:26
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
import ast
# import ast_utils
from collections import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.
try:
    import ConfigParser as configparser # Python 2
except ImportError:
    import configparser # Python 3
import glob
import optparse
import os
# import re
import sys
import time
import token
import tokenize
import types
try:
    import StringIO as io # Python 2
except ImportError:
    import io # Python 3
isPython3 = sys.version_info >= (3, 0, 0)

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

# Top-level functions

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
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()

def truncate(s, n):
    '''Return s truncated to n characters.'''
    return s if len(s) <= n else s[: n - 3] + '...'

class CoffeeScriptTokenizer:
    '''A token-based Python beautifier.'''

    class OutputToken:
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

    class ParseState:
        '''A class representing items parse state stack.'''

        def __init__(self, kind, value):
            self.kind = kind
            self.value = value

        def __repr__(self):
            return 'State: %10s %s' % (self.kind, repr(self.value))

        __str__ = __repr__

    def __init__(self, controller):
        '''Ctor for PythonPrettyPrinter class.'''
        self.controller = controller
        # Globals...
        self.code_list = [] # The list of output tokens.
        # The present line and token...
        self.last_line_number = 0
        self.raw_val = None # Raw value for strings, comments.
        self.s = None # The string containing the line.
        self.val = None
        # State vars...
        self.backslash_seen = False
        self.decorator_seen = False
        self.level = 0 # indentation level.
        self.lws = '' # Leading whitespace.
            # Typically ' '*self.tab_width*self.level,
            # but may be changed for continued lines.
        self.paren_level = 0 # Number of unmatched left parens.
        self.state_stack = [] # Stack of ParseState objects.
        # Settings...
        self.delete_blank_lines = False
        self.tab_width = 4
        # Statistics
        self.n_changed_nodes = 0
        self.n_input_tokens = 0
        self.n_output_tokens = 0
        self.n_strings = 0
        self.parse_time = 0.0
        self.tokenize_time = 0.0
        self.beautify_time = 0.0
        self.check_time = 0.0
        self.total_time = 0.0
         # Undo vars
        self.changed = False
        self.dirtyVnodeList = []

    def format(self, tokens):
        '''
        The main line of PythonTokenBeautifier class.
        Called by prettPrintNode & test_beautifier.
        '''

        def oops():
            g.trace('unknown kind', self.kind)

        self.code_list = []
        self.state_stack = []
        self.file_start()
        for token5tuple in tokens:
            t1, t2, t3, t4, t5 = token5tuple
            srow, scol = t3
            self.kind = token.tok_name[t1].lower()
            self.val = g.toUnicode(t2)
            self.raw_val = g.toUnicode(t5)
            if srow != self.last_line_number:
                # Handle a previous backslash.
                if self.backslash_seen:
                    self.backslash()
                # Start a new row.
                raw_val = self.raw_val.rstrip()
                self.backslash_seen = raw_val.endswith('\\')
                # g.trace('backslash_seen',self.backslash_seen)
                if self.paren_level > 0:
                    s = self.raw_val.rstrip()
                    n = g.computeLeadingWhitespaceWidth(s, self.tab_width)
                    # This n will be one-too-many if formatting has
                    # changed: foo (
                    # to:      foo(
                    self.line_indent(ws=' ' * n)
                        # Do not set self.lws here!
                self.last_line_number = srow
            # g.trace('%10s %r'% (self.kind,self.val))
            func = getattr(self, 'do_' + self.kind, oops)
            func()
        self.file_end()
        return ''.join([z.to_string() for z in self.code_list])

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
            self.blank()
            self.add_token('comment', val)

    def do_endmarker(self):
        '''Handle an endmarker token.'''
        pass

    def do_errortoken(self):
        '''Handle an errortoken token.'''
        # This code is executed for versions of Python earlier than 2.4
        if self.val == '@':
            self.op(self.val)

    def do_dedent(self):
        '''Handle dedent token.'''
        self.level -= 1
        self.lws = self.level * self.tab_width * ' '
        self.line_start()
        state = self.state_stack[-1]
        if state.kind == 'indent' and state.value == self.level:
            self.state_stack.pop()
            state = self.state_stack[-1]
            if state.kind in ('class', 'def'):
                self.state_stack.pop()
                self.blank_lines(1)
                    # Most Leo nodes aren't at the top level of the file.
                    # self.blank_lines(2 if self.level == 0 else 1)

    def do_indent(self):
        '''Handle indent token.'''
        self.level += 1
        self.lws = self.val
        self.line_start()

    def do_name(self):
        '''Handle a name token.'''
        name = self.val
        if name in ('class', 'def'):
            self.decorator_seen = False
            state = self.state_stack[-1]
            if state.kind == 'decorator':
                self.clean_blank_lines()
                self.line_end()
                self.state_stack.pop()
            else:
                self.blank_lines(1)
                # self.blank_lines(2 if self.level == 0 else 1)
            self.push_state(name)
            self.push_state('indent', self.level)
                # For trailing lines after inner classes/defs.
            self.word(name)
        elif name in ('and', 'in', 'not', 'not in', 'or'):
            self.word_op(name)
        else:
            self.word(name)

    def do_newline(self):
        '''Handle a regular newline.'''
        self.line_end()

    def do_nl(self):
        '''Handle a continuation line.'''
        self.line_end()

    def do_number(self):
        '''Handle a number token.'''
        self.add_token('number', self.val)

    def do_op(self):
        '''Handle an op token.'''
        val = self.val
        if val == '.':
            self.op_no_blanks(val)
        elif val == '@':
            if not self.decorator_seen:
                self.blank_lines(1)
                self.decorator_seen = True
            self.op_no_blanks(val)
            self.push_state('decorator')
        elif val in ',;:':
            # Pep 8: Avoid extraneous whitespace immediately before
            # comma, semicolon, or colon.
            self.op_blank(val)
        elif val in '([{':
            # Pep 8: Avoid extraneous whitespace immediately inside
            # parentheses, brackets or braces.
            self.lt(val)
        elif val in ')]}':
            # Ditto.
            self.rt(val)
        elif val == '=':
            # Pep 8: Don't use spaces around the = sign when used to indicate
            # a keyword argument or a default parameter value.
            if self.paren_level:
                self.op_no_blanks(val)
            else:
                self.op(val)
        elif val in '~+-':
            self.possible_unary_op(val)
        elif val == '*':
            self.star_op()
        elif val == '**':
            self.star_star_op()
        else:
            # Pep 8: always surround binary operators with a single space.
            # '==','+=','-=','*=','**=','/=','//=','%=','!=','<=','>=','<','>',
            # '^','~','*','**','&','|','/','//',
            # Pep 8: If operators with different priorities are used,
            # consider adding whitespace around the operators with the lowest priority(ies).
            self.op(val)

    def do_string(self):
        '''Handle a 'string' token.'''
        self.add_token('string', self.val)
        if self.val.find('\\\n'):
            self.backslash_seen = False
            # This *does* retain the string's spelling.
        self.blank()

    def add_token(self, kind, value=''):
        '''Add a token to the code list.'''
        # if kind in ('line-indent','line-start','line-end'):
            # g.trace(kind,repr(value),g.callers())
        tok = self.OutputToken(kind, value)
        self.code_list.append(tok)
    # def arg_end(self):
        # '''Add a token indicating the end of an argument list.'''
        # self.add_token('arg-end')
    # def arg_start(self):
        # '''Add a token indicating the start of an argument list.'''
        # self.add_token('arg-start')

    def backslash(self):
        '''Add a backslash token and clear .backslash_seen'''
        self.add_token('backslash', '\\')
        self.add_token('line-end', '\n')
        self.line_indent()
        self.backslash_seen = False

    def blank(self):
        '''Add a blank request on the code list.'''
        prev = self.code_list[-1]
        if not prev.kind in (
            'blank', 'blank-lines',
            'file-start',
            'line-end', 'line-indent',
            'lt', 'op-no-blanks', 'unary-op',
        ):
            self.add_token('blank', ' ')

    def blank_lines(self, n):
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
            self.line_indent()

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

    def file_end(self):
        '''
        Add a file-end token to the code list.
        Retain exactly one line-end token.
        '''
        self.clean_blank_lines()
        self.add_token('line-end', '\n')
        self.add_token('line-end', '\n')
        self.add_token('file-end')

    def file_start(self):
        '''Add a file-start token to the code list and the state stack.'''
        self.add_token('file-start')
        self.push_state('file-start')

    def line_indent(self, ws=None):
        '''Add a line-indent token if indentation is non-empty.'''
        self.clean('line-indent')
        ws = ws or self.lws
        if ws:
            self.add_token('line-indent', ws)

    def line_end(self):
        '''Add a line-end request to the code list.'''
        prev = self.code_list[-1]
        if prev.kind == 'file-start':
            return
        self.clean('blank') # Important!
        if self.delete_blank_lines:
            self.clean_blank_lines()
        self.clean('line-indent')
        if self.backslash_seen:
            self.backslash()
        self.add_token('line-end', '\n')
        self.line_indent()
            # Add the indentation for all lines
            # until the next indent or unindent token.

    def line_start(self):
        '''Add a line-start request to the code list.'''
        self.line_indent()

    def lt(self, s):
        '''Add a left paren request to the code list.'''
        assert s in '([{', repr(s)
        self.paren_level += 1
        self.clean('blank')
        prev = self.code_list[-1]
        if prev.kind in ('op', 'word-op'):
            self.blank()
            self.add_token('lt', s)
        elif prev.kind == 'word':
            # Only suppress blanks before '(' or '[' for non-keyworks.
            if s == '{' or prev.value in ('if', 'else', 'return'):
                self.blank()
            self.add_token('lt', s)
        elif prev.kind == 'op':
            self.op(s)
        else:
            self.op_no_blanks(s)

    def rt(self, s):
        '''Add a right paren request to the code list.'''
        assert s in ')]}', repr(s)
        self.paren_level -= 1
        prev = self.code_list[-1]
        if prev.kind == 'arg-end':
            # Remove a blank token preceding the arg-end token.
            prev = self.code_list.pop()
            self.clean('blank')
            self.code_list.append(prev)
        else:
            self.clean('blank')
        self.add_token('rt', s)

    def op(self, s):
        '''Add op token to code list.'''
        assert s and g.isString(s), repr(s)
        self.blank()
        self.add_token('op', s)
        self.blank()

    def op_blank(self, s):
        '''Remove a preceding blank token, then add op and blank tokens.'''
        assert s and g.isString(s), repr(s)
        self.clean('blank')
        self.add_token('op', s)
        self.blank()

    def op_no_blanks(self, s):
        '''Add an operator *not* surrounded by blanks.'''
        self.clean('blank')
        self.add_token('op-no-blanks', s)

    def possible_unary_op(self, s):
        '''Add a unary or binary op to the token list.'''
        self.clean('blank')
        prev = self.code_list[-1]
        if prev.kind in ('lt', 'op', 'op-no-blanks', 'word-op'):
            self.unary_op(s)
        elif prev.kind == 'word' and prev.value in ('elif', 'if', 'return', 'while'):
            self.unary_op(s)
        else:
            self.op(s)

    def unary_op(self, s):
        '''Add an operator request to the code list.'''
        assert s and g.isString(s), repr(s)
        self.blank()
        self.add_token('unary-op', s)

    def star_op(self):
        '''Put a '*' op, with special cases for *args.'''
        val = '*'
        if self.paren_level:
            i = len(self.code_list) - 1
            if self.code_list[i].kind == 'blank':
                i -= 1
            token = self.code_list[i]
            if token.kind == 'lt':
                self.op_no_blanks(val)
            elif token.value == ',':
                self.blank()
                self.add_token('op-no-blanks', val)
            else:
                self.op(val)
        else:
            self.op(val)

    def star_star_op(self):
        '''Put a ** operator, with a special case for **kwargs.'''
        val = '**'
        if self.paren_level:
            i = len(self.code_list) - 1
            if self.code_list[i].kind == 'blank':
                i -= 1
            token = self.code_list[i]
            if token.value == ',':
                self.blank()
                self.add_token('op-no-blanks', val)
            else:
                self.op(val)
        else:
            self.op(val)

    def word(self, s):
        '''Add a word request to the code list.'''
        assert s and g.isString(s), repr(s)
        self.blank()
        self.add_token('word', s)
        self.blank()

    def word_op(self, s):
        '''Add a word-op request to the code list.'''
        assert s and g.isString(s), repr(s)
        self.blank()
        self.add_token('word-op', s)
        self.blank()

    def print_stats(self):
        print('==================== stats')
        print('changed nodes  %s' % self.n_changed_nodes)
        print('tokens         %s' % self.n_input_tokens)
        print('len(code_list) %s' % self.n_output_tokens)
        print('len(s)         %s' % self.n_strings)
        print('parse          %4.2f sec.' % self.parse_time)
        print('tokenize       %4.2f sec.' % self.tokenize_time)
        print('format         %4.2f sec.' % self.beautify_time)
        print('check          %4.2f sec.' % self.check_time)
        print('total          %4.2f sec.' % self.total_time)

    def push_state(self, kind, value=None):
        '''Append a state to the state stack.'''
        state = self.ParseState(kind, value)
        self.state_stack.append(state)

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
    # Returns optimized whitespace corresponding to width with the indicated tab_width.

    def computeLeadingWhitespaceWidth(self, s, tab_width):
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

    if isPython3: # g.not defined yet.

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
            # 'Def Name Patterns', 'General Patterns')
        # Ivars set in the config file...
        ### self.output_fn = None
        self.output_directory = self.finalize('.')
        self.overwrite = False
        self.trace_visitors = False
        self.update_flag = False
        self.verbose = False # Trace config arguments.
        ###
        # self.prefix_lines = []
        # self.trace_matches = False
        # self.trace_patterns = False
        # self.trace_reduce = False
        # self.warn = False
        # Pattern lists, set by config sections...
        # self.def_patterns = [] # [Def Name Patterns]
        # self.general_patterns = [] # [General Patterns]
        # self.names_dict = {}
        # self.op_name_dict = self.make_op_name_dict()
        # self.patterns_dict = {}
        # self.regex_patterns = []

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
            # node = ast.parse(s,filename=fn,mode='exec')
            readlines = g.ReadLinesClass(s).next
            tokens = list(tokenize.generate_tokens(readlines))
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
        # add('--trace-matches', action='store_true', default=False,
            # help='trace Pattern.matches')
        # add('--trace-patterns', action='store_true', default=False,
            # help='trace pattern creation')
        # add('--trace-reduce', action='store_true', default=False,
            # help='trace st.reduce_types')
        add('--trace-visitors', action='store_true', default=False,
            help='trace visitor methods')
        # add('-u', '--update', action='store_true', default=False,
            # help='update stubs in existing stub file')
        add('-v', '--verbose', action='store_true', default=False,
            help='verbose output')
        # add('-w', '--warn', action='store_true', default=False,
            # help='warn about unannotated args')
        # Parse the options
        options, args = parser.parse_args()
        # Handle the options...
        self.enable_unit_tests = options.test
        self.overwrite = options.overwrite
        self.trace_visitors = options.trace_visitors
        ###
        # self.trace_matches = options.trace_matches
        # self.trace_patterns = options.trace_patterns
        # self.trace_reduce = options.trace_reduce
        # self.update_flag = options.update
        # self.verbose = options.verbose
        # self.warn = options.warn
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

class TestClass(object):
    '''
    A class containing constructs that have caused difficulties.
    This is in the make_stub_files directory, not the test directory.
    '''
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

g = LeoGlobals() # For ekr.
if __name__ == "__main__":
    main()

