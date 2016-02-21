# python_to_coffeescript: Sun 21 Feb 2016 at 14:51:45
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
pass # from collections pass # import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.

pass # import ast
pass # import glob
pass # import optparse
pass # import os
# import re
pass # import sys
pass # import time
pass # import token
pass # import tokenize
pass # import types
isPython3 = sys.version_info >= [3, 0, 0]
# Avoid try/except here during development.
if isPython3
    pass # import configparser
    pass # import io
else
    pass # import ConfigParser as configparser
    pass # import StringIO as io
# try:
    # import ConfigParser as configparser # Python 2
# except ImportError:
    # import configparser # Python 3
# try:
    # import StringIO as io # Python 2
# except ImportError:
    # import io # Python 3
use_tree = False

main = ->
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    # g.cls()
    controller = MakeCoffeeScriptController
    controller.scan_command_line
    controller.scan_options
    controller.run
    print('done')

#
# Utility functions...
#

dump = (title, s=None) ->
    if s
        print('===== %s...\n%s\n' % [title, s.rstrip()])
    else
        print('===== %s...\n' % title)

dump_dict = (title, d) ->
    '''Dump a dictionary with a header.'''
    dump(title)
    for z in sorted(d)
        print('%30s %s' % [z, d.get(z)])
    print('')

dump_list = (title, aList) ->
    '''Dump a list with a header.'''
    dump(title)
    for z in aList
        print(z)
    print('')

pdb = ->
    '''Invoke a debugger during unit testing.'''
    print('pdb')
    # Avoid try/except during development.
    # try:
        # import leo.core.leoGlobals as leo_g
        # leo_g.pdb()
    # except ImportError:
        # import pdb
        # pdb.set_trace()

truncate = (s, n) ->
    '''Return s truncated to n characters.'''
    return s if len(s) <= n else s[n - 3] + '...'

class CoffeeScriptTokenizer
    '''A token-based Python beautifier.'''

    class OutputToken extends object
        '''A class representing Output Tokens'''

        constructor: (kind, value) ->
            @kind = kind
            @value = value

        __repr__: ->
            if @kind == 'line-indent'
                assert not @value.strip(' ')
                return '%15s %s' % [@kind, len(@value)]
            else
                return '%15s %r' % [@kind, @value]

        __str__ = __repr__

        to_string: ->
            '''Convert an output token to a string.'''
            return @value if g.isString(@value) else ''

    class StateStack extends object
        '''
        A class representing a stack of ParseStates and encapsulating various
        operations on same.
        '''

        constructor: ->
            '''Ctor for ParseStack class.'''
            @stack = []

        get: (kind) ->
            '''Return the last state of the given kind, leaving the stack unchanged.'''
            n = len(@stack)
            i = n - 1
            while 0 <= i
                state = @stack[i]
                if state.kind == kind
                    return state
                i -= 1
            return None

        has: (kind) ->
            '''Return True if state.kind == kind for some ParseState on the stack.'''
            return any([z.kind == kind for z in @stack])

        pop: ->
            '''Pop the state on the stack and return it.'''
            return @stack.pop

        push: (kind, value=None) ->
            '''Append a state to the state stack.'''
            trace = False
            @stack.append(ParseState(kind, value))
            if trace and kind == 'tuple'
                g.trace(kind, value, g.callers(2))

        remove: (kind) ->
            '''Remove the last state on the stack of the given kind.'''
            trace = False
            n = len(@stack)
            i = n - 1
            found = None
            while 0 <= i
                state = @stack[i]
                if state.kind == kind
                    found = state
                    @stack = @stack[i] + @stack[i + 1]
                    assert len(@stack) == n - 1, [len(@stack), n - 1]
                    break
                i -= 1
            if trace and kind == 'tuple'
                kind = found and found.kind or 'fail'
                value = found and found.value or 'fail'
                g.trace(kind, value, g.callers(2))

    constructor: (controller) ->
        '''Ctor for CoffeeScriptTokenizer class.'''
        @controller = controller
        # Globals...
        @code_list = [] # The list of output tokens.
        # The present line and token...
        @last_line_number = 0
        @raw_val = None # Raw value for strings, comments.
        @s = None # The string containing the line.
        @val = None
        # State vars...
        @after_self = False
        @backslash_seen = False
        @decorator_seen = False
        @extends_flag = False
        @in_class_line = False
        @in_def_line = False
        @in_import = False
        @in_list = False
        @input_paren_level = 0
        @def_name_seen = False
        @level = 0 # indentation level.
        @lws = '' # Leading whitespace.
            # Typically ' '*self.tab_width*self.level,
            # but may be changed for continued lines.
        @output_paren_level = 0 # Number of unmatched left parens in output.
        @prev_sig_token = None # Previous non-whitespace token.
        @stack = None # Stack of ParseState objects, set in format.
        # Settings...
        @delete_blank_lines = False
        @tab_width = 4

    format: (tokens) ->
        '''The main line of CoffeeScriptTokenizer class.'''
        trace = False
        @code_list = []
        @stack = @StateStack
        @gen_file_start
        for token5tuple in tokens
            t1, t2, t3, t4, t5 = token5tuple
            srow, scol = t3
            @kind = token.tok_name[t1].lower
            @val = g.toUnicode(t2)
            @raw_val = g.toUnicode(t5)
            if srow != @last_line_number
                # Handle a previous backslash.
                if @backslash_seen
                    @gen_backslash
                # Start a new row.
                raw_val = @raw_val.rstrip
                @backslash_seen = raw_val.endswith('\\')
                # g.trace('backslash_seen',self.backslash_seen)
                if @output_paren_level > 0
                    s = @raw_val.rstrip
                    n = g.computeLeadingWhitespaceWidth(s, @tab_width)
                    # This n will be one-too-many if formatting has
                    # changed: foo (
                    # to:      foo(
                    @gen_line_indent(ws=' ' * n)
                        # Do not set self.lws here!
                @last_line_number = srow
            if trace g.trace('%10s %r' % [@kind, @val])
            func = getattr(@'do_' + @kind, None)
            if func func
        @gen_file_end
        return ''.join([z.to_string for z in @code_list])

    #
    # Input token handlers...
    #

    do_comment: ->
        '''Handle a comment token.'''
        raw_val = @raw_val.rstrip
        val = @val.rstrip
        entire_line = raw_val.lstrip.startswith('#')
        @backslash_seen = False
            # Putting the comment will put the backslash.
        if entire_line
            @clean('line-indent')
            @add_token('comment', raw_val)
        else
            @gen_blank
            @add_token('comment', val)

    do_endmarker: ->
        '''Handle an endmarker token.'''
        pass

    do_errortoken: ->
        '''Handle an errortoken token.'''
        # This code is executed for versions of Python earlier than 2.4
        if @val == '@'
            @gen_op(@val)

    do_dedent: ->
        '''Handle dedent token.'''
        @level -= 1
        @lws = @level * @tab_width * ' '
        @gen_line_start
        # End all classes & defs.
        for state in @stack.stack
            if state.kind in ['class', 'def']
                if state.value >= @level
                    # g.trace(self.level, 'end', state.kind)
                    @stack.remove(state.kind)
                else
                    break

    do_indent: ->
        '''Handle indent token.'''
        @level += 1
        @lws = @val
        @gen_line_start

    do_name: ->
        '''Handle a name token.'''
        name = @val
        if name in ['class', 'def']
            @gen_class_or_def(name)
        elif name in ['from', 'import']
            @gen_import(name)
        elif name == 'self'
            @gen_self
        elif @in_def_line and not @def_name_seen
            if name == '__init__'
                name = 'constructor'
            @gen_word(name)
            if @stack.has('class')
                @gen_op_blank(':')
            else
                @gen_op('=')
            @def_name_seen = True
        elif name in ['and', 'in', 'not', 'not in', 'or']
            @gen_word_op(name)
        elif name == 'default'
            # Hard to know where to put a warning comment.
            @gen_word(name + '_')
        else
            @gen_word(name)

    do_newline: ->
        '''Handle a regular newline.'''
        @gen_line_end

    do_nl: ->
        '''Handle a continuation line.'''
        @gen_line_end

    do_number: ->
        '''Handle a number token.'''
        @add_token('number', @val)

    do_op: ->
        '''Handle an op token.'''
        val = @val
        if val == '.'
            @gen_period
        elif val == '@'
            @gen_at
        elif val == ':'
            @gen_colon
        elif val == '('
            @gen_open_paren
        elif val == ')'
            @gen_close_paren
        elif val == ','
            @gen_comma
        elif val == ';'
            # Pep 8: Avoid extraneous whitespace immediately before
            # comma, semicolon, or colon.
            @gen_op_blank(val)
        elif val in '[{'
            # Pep 8: Avoid extraneous whitespace immediately inside
            # parentheses, brackets or braces.
            @gen_lt(val)
        elif val in ']}'
            @gen_rt(val)
        elif val == '='
            # Pep 8: Don't use spaces around the = sign when used to indicate
            # a keyword argument or a default parameter value.
            if @output_paren_level
                @gen_op_no_blanks(val)
            else
                @gen_op(val)
        elif val in '~+-'
            @gen_possible_unary_op(val)
        elif val == '*'
            @gen_star_op
        elif val == '**'
            @gen_star_star_op
        else
            # Pep 8: always surround binary operators with a single space.
            # '==','+=','-=','*=','**=','/=','//=','%=','!=','<=','>=','<','>',
            # '^','~','*','**','&','|','/','//',
            # Pep 8: If operators with different priorities are used,
            # consider adding whitespace around the operators with the lowest priority(ies).
            @gen_op(val)

    do_string: ->
        '''Handle a 'string' token.'''
        @add_token('string', @val)
        if @val.find('\\\n')
            @backslash_seen = False
            # This *does* retain the string's spelling.
        @gen_blank

    #
    # Output token generators and helpers...
    #

    add_token: (kind, value='') ->
        '''Add a token to the code list.'''
        token = @OutputToken(kind, value)
        @code_list.append(token)
        if kind not in [
            'backslash',
            'blank', 'blank-lines',
            'file-start',
            'line-end', 'line-indent'
        ]
            # g.trace(token,g.callers())
            @prev_sig_token = token

    clean: (kind) ->
        '''Remove the last item of token list if it has the given kind.'''
        prev = @code_list[-1]
        if prev.kind == kind
            @code_list.pop

    clean_blank_lines: ->
        '''Remove all vestiges of previous lines.'''
        table = ['blank-lines', 'line-end', 'line-indent']
        while @code_list[-1].kind in table
            @code_list.pop

    gen_at: ->

        val = @val
        assert val == '@', val
        if not @decorator_seen
            @gen_blank_lines(1)
            @decorator_seen = True
        @gen_op_no_blanks(val)
        @stack.push('decorator')

    gen_backslash: ->
        '''Add a backslash token and clear .backslash_seen'''
        @add_token('backslash', '\\')
        @add_token('line-end', '\n')
        @gen_line_indent
        @backslash_seen = False

    gen_blank: ->
        '''Add a blank request on the code list.'''
        prev = @code_list[-1]
        if not prev.kind in [
            'blank', 'blank-lines', 'blank-op',
            'file-start',
            'line-end', 'line-indent',
            'lt', 'op-no-blanks', 'unary-op',
        ]
            @add_token('blank', ' ')

    gen_blank_lines: (n) ->
        '''
        Add a request for n blank lines to the code list.
        Multiple blank-lines request yield at least the maximum of all requests.
        '''
        @clean_blank_lines
        kind = @code_list[-1].kind
        if kind == 'file-start'
            @add_token('blank-lines', n)
        else
            for i in range(0, n + 1)
                @add_token('line-end', '\n')
            # Retain the token (intention) for debugging.
            @add_token('blank-lines', n)
            @gen_line_indent

    gen_class_or_def: (name) ->

        # g.trace(self.level, name)
        @decorator_seen = False
        if @stack.has('decorator')
            @stack.remove('decorator')
            @clean_blank_lines
            @gen_line_end
        else
            @gen_blank_lines(1)
        @stack.push(name, @level)
            # name is 'class' or 'def'
            # do_dedent pops these entries.
        if name == 'def'
            @in_def_line = True
            @in_class_line = False
            @def_name_seen = False
        else
            @extends_flag = False
            @in_class_line = True
            @gen_word(name)

    gen_close_paren: ->

        val = @val
        assert val == ')', val
        @input_paren_level -= 1
        if @in_class_line
            @in_class_line = False
        else
            @gen_rt(val)
        @after_self = False

    gen_colon: ->

        val = @val
        assert val == ':', val
        if @in_def_line
            if @input_paren_level == 0
                @in_def_line = False
                @gen_op('->')
        elif @in_class_line
            if @input_paren_level == 0
                @in_class_line = False
        else
            pass
            # TODO
            # Some colons are correct.
            # self.gen_op_blank(val)

    gen_comma: ->

        val = @val
        assert val == ',', val
        if @after_self
            @after_self = False
        else
            # Pep 8: Avoid extraneous whitespace immediately before
            # comma, semicolon, or colon.
            @gen_op_blank(val)

    gen_file_end: ->
        '''
        Add a file-end token to the code list.
        Retain exactly one line-end token.
        '''
        @clean_blank_lines
        @add_token('line-end', '\n')
        @add_token('line-end', '\n')
        @add_token('file-end')

    gen_file_start: ->
        '''Add a file-start token to the code list and the state stack.'''
        @add_token('file-start')
        @stack.push('file-start')

    gen_import: (name) ->
        '''Convert an import to something that looks like a call.'''
        @gen_word('pass')
        @add_token('comment', '# ' + name)

    gen_line_indent: (ws=None) ->
        '''Add a line-indent token if indentation is non-empty.'''
        @clean('line-indent')
        ws = ws or @lws
        if ws
            @add_token('line-indent', ws)

    gen_line_end: ->
        '''Add a line-end request to the code list.'''
        prev = @code_list[-1]
        if prev.kind == 'file-start'
            return
        @clean('blank') # Important!
        if @delete_blank_lines
            @clean_blank_lines
        @clean('line-indent')
        if @backslash_seen
            @gen_backslash
        @add_token('line-end', '\n')
        @gen_line_indent
            # Add the indentation for all lines
            # until the next indent or unindent token.

    gen_line_start: ->
        '''Add a line-start request to the code list.'''
        @gen_line_indent

    gen_lt: (s) ->
        '''Add a left paren to the code list.'''
        assert s in '([{', repr(s)
        @output_paren_level += 1
        @clean('blank')
        prev = @code_list[-1]
        if @in_def_line
            @gen_blank
            @add_token('lt', s)
        elif prev.kind in ['op', 'word-op']
            @gen_blank
            if s == '('
                # g.trace(self.prev_sig_token)
                s = '['
                @stack.push('tuple', @output_paren_level)
            @add_token('lt', s)
        elif prev.kind == 'word'
            # Only suppress blanks before '(' or '[' for non-keyworks.
            if s == '{' or prev.value in ['if', 'else', 'return']
                @gen_blank
            @add_token('lt', s)
        elif prev.kind == 'op'
            @gen_op(s)
        else
            @gen_op_no_blanks(s)

    gen_rt: (s) ->
        '''Add a right paren to the code list.'''
        assert s in ')]}', repr(s)
        @output_paren_level -= 1
        prev = @code_list[-1]
        if prev.kind == 'arg-end'
            # Remove a blank token preceding the arg-end token.
            prev = @code_list.pop
            @clean('blank')
            @code_list.append(prev)
        else
            @clean('blank')
            prev = @code_list[-1]
        if @stack.has('tuple')
            # g.trace('line', self.last_line_number, self.output_paren_level + 1)
            state = @stack.get('tuple')
            if state.value == @output_paren_level + 1
                @add_token('rt', ']')
                @stack.remove('tuple')
            else
                @add_token('rt', s)
        elif s == ')' and prev and prev.kind == 'lt' and prev.value == '('
            # Remove ()
            @code_list.pop
        else
            @add_token('rt', s)

    gen_op: (s) ->
        '''Add op token to code list.'''
        assert s and g.isString(s), repr(s)
        @gen_blank
        @add_token('op', s)
        @gen_blank

    gen_op_blank: (s) ->
        '''Remove a preceding blank token, then add op and blank tokens.'''
        assert s and g.isString(s), repr(s)
        @clean('blank')
        @add_token('op', s)
        @gen_blank

    gen_op_no_blanks: (s) ->
        '''Add an operator *not* surrounded by blanks.'''
        @clean('blank')
        @add_token('op-no-blanks', s)

    gen_blank_op: (s) ->
        '''Add an operator possibly with a preceding blank.'''
        @gen_blank
        @add_token('blank-op', s)

    gen_open_paren: ->

        val = @val
        assert val == '(', val
        @input_paren_level += 1
        if @in_class_line
            if not @extends_flag
                @gen_word('extends')
                @extends_flag = True
        else
            # Generate a function call or a list.
            @gen_lt(val)
        @after_self = False

    gen_period: ->

        val = @val
        assert val == '.', val
        if @after_self
            @after_self = False
        else
            @gen_op_no_blanks(val)

    gen_possible_unary_op: (s) ->
        '''Add a unary or binary op to the token list.'''
        @clean('blank')
        prev = @code_list[-1]
        if prev.kind in ['lt', 'op', 'op-no-blanks', 'word-op']
            @gen_unary_op(s)
        elif prev.kind == 'word' and prev.value in ['elif', 'if', 'return', 'while']
            @gen_unary_op(s)
        else
            @gen_op(s)

    gen_unary_op: (s) ->
        '''Add an operator request to the code list.'''
        assert s and g.isString(s), repr(s)
        @gen_blank
        @add_token('unary-op', s)

    gen_self: ->
        if @in_def_line
            @after_self = True
        else
            @gen_blank_op('@')
            @after_self = True

    gen_star_op: ->
        '''Put a '*' op, with special cases for *args.'''
        val = '*'
        if @output_paren_level
            i = len(@code_list) - 1
            if @code_list[i].kind == 'blank'
                i -= 1
            token = @code_list[i]
            if token.kind == 'lt'
                @gen_op_no_blanks(val)
            elif token.value == ','
                @gen_blank
                @add_token('op-no-blanks', val)
            else
                @gen_op(val)
        else
            @gen_op(val)

    gen_star_star_op: ->
        '''Put a ** operator, with a special case for **kwargs.'''
        val = '**'
        if @output_paren_level
            i = len(@code_list) - 1
            if @code_list[i].kind == 'blank'
                i -= 1
            token = @code_list[i]
            if token.value == ','
                @gen_blank
                @add_token('op-no-blanks', val)
            else
                @gen_op(val)
        else
            @gen_op(val)

    gen_word: (s) ->
        '''Add a word request to the code list.'''
        assert s and g.isString(s), repr(s)
        @gen_blank
        @add_token('word', s)
        @gen_blank

    gen_word_op: (s) ->
        '''Add a word-op request to the code list.'''
        assert s and g.isString(s), repr(s)
        @gen_blank
        @add_token('word-op', s)
        @gen_blank

class CoffeeScriptTraverser extends object
    '''A class to convert python sources to coffeescript sources.'''
    # pylint: disable=consider-using-enumerate

    constructor: (controller) ->
        '''Ctor for CoffeeScriptFormatter class.'''
        @controller = controller
        @first_statement = False

    format: (node, tokens) ->
        '''Format the node (or list of nodes) and its descendants.'''
        @level = 0
        @tokens = tokens
        val = @visit(node)
        return val or ''

    indent: (s) ->
        '''Return s, properly indented.'''
        assert not s.startswith('\n'), g.callers
        return '%s%s' % [' ' * 4 * @level, s]

    visit: (node) ->
        '''Return the formatted version of an Ast node, or list of Ast nodes.'''
        # g.trace(node.__class__.__name__)
        if isinstance(node, [list, tuple])
            return ', '.join([@visit(z) for z in node])
        elif node is None
            return 'None'
        else
            assert isinstance(node, ast.AST), node.__class__.__name__
            method_name = 'do_' + node.__class__.__name__
            method = getattr(@method_name)
            s = method(node)
            # pylint: disable=unidiomatic-typecheck
            assert type(s) == type('abc'), [node, type(s)]
            return s

    # Contexts...

    # ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

    do_ClassDef: (node) ->
        result = []
        name = node.name # Only a plain string is valid.
        bases = [@visit(z) for z in node.bases] if node.bases else []
        result.append('\n\n')
        if bases
            result.append(@indent('class %s(%s):\n' % [name, ', '.join(bases)]))
        else
            result.append(@indent('class %s:\n' % name))
        for i, z in enumerate(node.body)
            @level += 1
            @first_statement = i == 0
            result.append(@visit(z))
            @level -= 1
        return ''.join(result)

    # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

    do_FunctionDef: (node) ->
        '''Format a FunctionDef node.'''
        result = []
        if node.decorator_list
            for z in node.decorator_list
                result.append(@indent('@%s\n' % @visit(z)))
        name = node.name # Only a plain string is valid.
        args = @visit(node.args) if node.args else ''
        result.append('\n')
        result.append(@indent('def %s(%s):\n' % [name, args]))
        for i, z in enumerate(node.body)
            @level += 1
            @first_statement = i == 0
            result.append(@visit(z))
            @level -= 1
        return ''.join(result)

    do_Interactive: (node) ->
        for z in node.body
            @visit(z)

    do_Module: (node) ->

        return ''.join([@visit(z) for z in node.body])

    do_Lambda: (node) ->
        return @indent('lambda %s: %s' % [
            @visit(node.args),
            @visit(node.body)])

    # Expressions...

    do_Expr: (node) ->
        '''An outer expression: must be indented.'''
        return @indent('%s\n' % @visit(node.value))

    do_Expression: (node) ->
        '''An inner expression: do not indent.'''
        return '%s\n' % @visit(node.body)

    do_GeneratorExp: (node) ->
        elt = @visit(node.elt) or ''
        gens = [@visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens] # Kludge: probable bug.
        return '<gen %s for %s>' % [elt, ','.join(gens)]

    do_AugLoad: (node) ->
        return 'AugLoad'

    do_Del: (node) ->
        return 'Del'

    do_Load: (node) ->
        return 'Load'

    do_Param: (node) ->
        return 'Param'

    do_Store: (node) ->
        return 'Store'

    # Operands...

    # arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

    do_arguments: (node) ->
        '''Format the arguments node.'''
        assert isinstance(node, ast.arguments)
        args = [@visit(z) for z in node.args]
        defaults = [@visit(z) for z in node.defaults]
        # Assign default values to the last args.
        args2 = []
        n_plain = len(args) - len(defaults)
        for i in range(len(args))
            if i < n_plain
                args2.append(args[i])
            else
                args2.append('%s=%s' % [args[i], defaults[i - n_plain]])
        # Now add the vararg and kwarg args.
        name = getattr(node, 'vararg', None)
        if name
            # pylint: disable=no-member
            if isPython3 and isinstance(name, ast.arg)
                name = name.arg
            args2.append('*' + name)
        name = getattr(node, 'kwarg', None)
        if name
            # pylint: disable=no-member
            if isPython3 and isinstance(name, ast.arg)
                name = name.arg
            args2.append('**' + name)
        return ','.join(args2)

    # Python 3:
    # arg = (identifier arg, expr? annotation)

    do_arg: (node) ->
        return node.arg

    # Attribute(expr value, identifier attr, expr_context ctx)

    do_Attribute: (node) ->
        return '%s.%s' % [
            @visit(node.value),
            node.attr] # Don't visit node.attr: it is always a string.

    do_Bytes: (node) -> # Python 3.x only.
        return str(node.s)

    # Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

    do_Call: (node) ->
        func = @visit(node.func)
        args = [@visit(z) for z in node.args]
        for z in node.keywords
            # Calls f.do_keyword.
            args.append(@visit(z))
        if getattr(node, 'starargs', None)
            args.append('*%s' % [@visit(node.starargs)])
        if getattr(node, 'kwargs', None)
            args.append('**%s' % [@visit(node.kwargs)])
        args = [z for z in args if z] # Kludge: Defensive coding.
        return '%s(%s)' % [func, ','.join(args)]

    # keyword = (identifier arg, expr value)

    do_keyword: (node) ->
        # node.arg is a string.
        value = @visit(node.value)
        # This is a keyword *arg*, not a Python keyword!
        return '%s=%s' % [node.arg, value]

    do_comprehension: (node) ->
        result = []
        name = @visit(node.target) # A name.
        it = @visit(node.iter) # An attribute.
        result.append('%s in %s' % [name, it])
        ifs = [@visit(z) for z in node.ifs]
        if ifs
            result.append(' if %s' % [''.join(ifs)])
        return ''.join(result)

    do_Dict: (node) ->
        result = []
        keys = [@visit(z) for z in node.keys]
        values = [@visit(z) for z in node.values]
        if len(keys) == len(values)
            # result.append('{\n' if keys else '{')
            result.append('{')
            items = []
            for i in range(len(keys))
                items.append('%s:%s' % [keys[i], values[i]])
            result.append(', '.join(items))
            result.append('}')
            # result.append(',\n'.join(items))
            # result.append('\n}' if keys else '}')
        else
            print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % [
                repr(keys), repr(values)])
        return ''.join(result)

    do_Ellipsis: (node) ->
        return '...'

    do_ExtSlice: (node) ->
        return ':'.join([@visit(z) for z in node.dims])

    do_Index: (node) ->
        return @visit(node.value)

    do_List: (node) ->
        # Not used: list context.
        # self.visit(node.ctx)
        elts = [@visit(z) for z in node.elts]
        elst = [z for z in elts if z] # Defensive.
        return '[%s]' % ','.join(elts)

    do_ListComp: (node) ->
        elt = @visit(node.elt)
        gens = [@visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens] # Kludge: probable bug.
        return '%s for %s' % [elt, ''.join(gens)]

    do_Name: (node) ->
        return node.id

    do_NameConstant: (node) -> # Python 3 only.
        s = repr(node.value)
        return 'bool' if s in ['True', 'False'] else s

    do_Num: (node) ->
        return repr(node.n)

    # Python 2.x only

    do_Repr: (node) ->
        return 'repr(%s)' % @visit(node.value)

    do_Slice: (node) ->
        lower, upper, step = '', '', ''
        if getattr(node, 'lower', None) is not None
            lower = @visit(node.lower)
        if getattr(node, 'upper', None) is not None
            upper = @visit(node.upper)
        if getattr(node, 'step', None) is not None
            step = @visit(node.step)
        if step
            return '%s:%s:%s' % [lower, upper, step]
        else
            return '%s:%s' % [lower, upper]

    do_Str: (node) ->
        '''A string constant, including docstrings.'''
        # A pretty spectacular hack.
        # We assume docstrings are the first expr following a class or def.
        docstring = False
        if @first_statement
            callers = ''.join([z for z in g.callers(2).split(',') if z != 'visit'])
            docstring = callers.endswith('do_Expr')
        if docstring
            s = repr(node.s).replace('\\n', '\n')
            if s.startswith('"')
                return '""%s""' % s
            else
                return "''%s''" % s
        else
            return repr(node.s)

    # Subscript(expr value, slice slice, expr_context ctx)

    do_Subscript: (node) ->
        value = @visit(node.value)
        the_slice = @visit(node.slice)
        return '%s[%s]' % [value, the_slice]

    do_Tuple: (node) ->
        elts = [@visit(z) for z in node.elts]
        return '(%s)' % ', '.join(elts)

    # Operators...

    op_name: (node, strict=True) ->
        '''Return the print name of an operator node.'''
        d = {
            # Binary operators.
            'Add' '+',
            'BitAnd' '&',
            'BitOr' '|',
            'BitXor' '^',
            'Div' '/',
            'FloorDiv' '//',
            'LShift' '<<',
            'Mod' '%',
            'Mult' '*',
            'Pow' '**',
            'RShift' '>>',
            'Sub' '-',
            # Boolean operators.
            'And' ' and ',
            'Or' ' or ',
            # Comparison operators
            'Eq' '==',
            'Gt' '>',
            'GtE' '>=',
            'In' ' in ',
            'Is' ' is ',
            'IsNot' ' is not ',
            'Lt' '<',
            'LtE' '<=',
            'NotEq' '!=',
            'NotIn' ' not in ',
            # Context operators.
            'AugLoad' '<AugLoad>',
            'AugStore' '<AugStore>',
            'Del' '<Del>',
            'Load' '<Load>',
            'Param' '<Param>',
            'Store' '<Store>',
            # Unary operators.
            'Invert' '~',
            'Not' ' not ',
            'UAdd' '+',
            'USub' '-',
        }
        kind = node.__class__.__name__
        name = d.get(kind, '<%s>' % kind)
        if strict assert name, kind
        return name

    do_BinOp: (node) ->
        return '%s%s%s' % [
            @visit(node.left),
            @op_name(node.op),
            @visit(node.right)]

    do_BoolOp: (node) ->
        op_name = @op_name(node.op)
        values = [@visit(z) for z in node.values]
        return op_name.join(values)

    do_Compare: (node) ->
        result = []
        lt = @visit(node.left)
        ops = [@op_name(z) for z in node.ops]
        comps = [@visit(z) for z in node.comparators]
        result.append(lt)
        if len(ops) == len(comps)
            for i in range(len(ops))
                result.append('%s%s' % [ops[i], comps[i]])
        else
            print('can not happen: ops', repr(ops), 'comparators', repr(comps))
        return ''.join(result)

    do_IfExp: (node) ->
        return '%s if %s else %s ' % [
            @visit(node.body),
            @visit(node.test),
            @visit(node.orelse)]

    do_UnaryOp: (node) ->
        return '%s%s' % [
            @op_name(node.op),
            @visit(node.operand)]

    # Statements...

    do_Assert: (node) ->
        test = @visit(node.test)
        if getattr(node, 'msg', None)
            message = @visit(node.msg)
            return @indent('assert %s, %s\n' % [test, message])
        else
            return @indent('assert %s\n' % test)

    do_Assign: (node) ->
        return @indent('%s=%s\n' % [
            '='.join([@visit(z) for z in node.targets]),
            @visit(node.value)])

    do_AugAssign: (node) ->
        return @indent('%s%s=%s\n' % [
            @visit(node.target),
            @op_name(node.op), # Bug fix: 2013/03/08.
            @visit(node.value)])

    do_Break: (node) ->
        return @indent('break\n')

    do_Continue: (node) ->
        return @indent('continue\n')

    do_Delete: (node) ->
        targets = [@visit(z) for z in node.targets]
        return @indent('del %s\n' % ','.join(targets))

    do_ExceptHandler: (node) ->
        result = []
        result.append(@indent('except'))
        if getattr(node, 'type', None)
            result.append(' %s' % @visit(node.type))
        if getattr(node, 'name', None)
            if isinstance(node.name, ast.AST)
                result.append(' as %s' % @visit(node.name))
            else
                result.append(' as %s' % node.name) # Python 3.x.
        result.append(':\n')
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        return ''.join(result)

    # Python 2.x only

    do_Exec: (node) ->
        body = @visit(node.body)
        args = [] # Globals before locals.
        if getattr(node, 'globals', None)
            args.append(@visit(node.globals))
        if getattr(node, 'locals', None)
            args.append(@visit(node.locals))
        if args
            return @indent('exec %s in %s\n' % [
                body, ','.join(args)])
        else
            return @indent('exec %s\n' % [body])

    do_For: (node) ->
        result = []
        result.append(@indent('for %s in %s:\n' % [
            @visit(node.target),
            @visit(node.iter)]))
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        if node.orelse
            result.append(@indent('else:\n'))
            for z in node.orelse
                @level += 1
                result.append(@visit(z))
                @level -= 1
        return ''.join(result)

    do_Global: (node) ->
        return @indent('global %s\n' % [
            ','.join(node.names)])

    do_If: (node) ->
        result = []
        result.append(@indent('if %s:\n' % [
            @visit(node.test)]))
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        if node.orelse
            result.append(@indent('else:\n'))
            for z in node.orelse
                @level += 1
                result.append(@visit(z))
                @level -= 1
        return ''.join(result)

    do_Import: (node) ->
        names = []
        for fn, asname in @get_import_names(node)
            if asname
                names.append('%s as %s' % [fn, asname])
            else
                names.append(fn)
        return @indent('import %s\n' % [
            ','.join(names)])

    get_import_names: (node) ->
        '''Return a list of the the full file names in the import statement.'''
        result = []
        for ast2 in node.names
            assert isinstance(ast2, ast.alias)
            data = ast2.name, ast2.asname
            result.append(data)
        return result

    do_ImportFrom: (node) ->
        names = []
        for fn, asname in @get_import_names(node)
            if asname
                names.append('%s as %s' % [fn, asname])
            else
                names.append(fn)
        return @indent('from %s import %s\n' % [
            node.module,
            ','.join(names)])

    do_Pass: (node) ->
        return @indent('pass\n')

    # Python 2.x only

    do_Print: (node) ->
        vals = []
        for z in node.values
            vals.append(@visit(z))
        if getattr(node, 'dest', None)
            vals.append('dest=%s' % @visit(node.dest))
        if getattr(node, 'nl', None)
            if node.nl == 'False'
                vals.append('nl=%s' % node.nl)
        return @indent('print(%s)\n' % [
            ','.join(vals)])

    do_Raise: (node) ->
        args = []
        for attr in ['type', 'inst', 'tback']
            if getattr(node, attr, None) is not None
                args.append(@visit(getattr(node, attr)))
        if args
            return @indent('raise %s\n' % [
                ','.join(args)])
        else
            return @indent('raise\n')

    do_Return: (node) ->
        if node.value
            return @indent('return %s\n' % [
                @visit(node.value).strip()])
        else
            return @indent('return\n')

    # Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

    do_Try: (node) -> # Python 3
        result = []
        result.append(@indent('try:\n'))
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        if node.handlers
            for z in node.handlers
                result.append(@visit(z))
        if node.orelse
            result.append(@indent('else:\n'))
            for z in node.orelse
                @level += 1
                result.append(@visit(z))
                @level -= 1
        if node.finalbody
            result.append(@indent('finally:\n'))
            for z in node.finalbody
                @level += 1
                result.append(@visit(z))
                @level -= 1
        return ''.join(result)

    do_TryExcept: (node) ->
        result = []
        result.append(@indent('try:\n'))
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        if node.handlers
            for z in node.handlers
                result.append(@visit(z))
        if node.orelse
            result.append('else:\n')
            for z in node.orelse
                @level += 1
                result.append(@visit(z))
                @level -= 1
        return ''.join(result)

    do_TryFinally: (node) ->
        result = []
        result.append(@indent('try:\n'))
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        result.append(@indent('finally:\n'))
        for z in node.finalbody
            @level += 1
            result.append(@visit(z))
            @level -= 1
        return ''.join(result)

    do_While: (node) ->
        result = []
        result.append(@indent('while %s:\n' % [
            @visit(node.test)]))
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        if node.orelse
            result.append('else:\n')
            for z in node.orelse
                @level += 1
                result.append(@visit(z))
                @level -= 1
        return ''.join(result)

    do_With: (node) ->
        result = []
        result.append(@indent('with '))
        if hasattr(node, 'context_expression')
            result.append(@visit(node.context_expresssion))
        vars_list = []
        if hasattr(node, 'optional_vars')
            try
                for z in node.optional_vars
                    vars_list.append(@visit(z))
            except TypeError # Not iterable.
                vars_list.append(@visit(node.optional_vars))
        result.append(','.join(vars_list))
        result.append(':\n')
        for z in node.body
            @level += 1
            result.append(@visit(z))
            @level -= 1
        result.append('\n')
        return ''.join(result)

    do_Yield: (node) ->
        if getattr(node, 'value', None)
            return @indent('yield %s\n' % [
                @visit(node.value)])
        else
            return @indent('yield\n')

class LeoGlobals extends object
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''

    class NullObject
        """
        An object that does nothing, and does it very well.
        From the Python cookbook, recipe 5.23
        """

        constructor: (*args, **keys) -> pass

        __call__: (*args, **keys) -> return @

        __repr__: -> return "NullObject"

        __str__: -> return "NullObject"

        __bool__: -> return False

        __nonzero__: -> return 0

        __delattr__: (attr) -> return @

        __getattr__: (attr) -> return @

        __setattr__: (attr, val) -> return @

    class ReadLinesClass
        """A class whose next method provides a readline method for Python's tokenize module."""

        constructor: (s) ->
            @lines = s.splitlines(True) if s else []
                # g.splitLines(s)
            @i = 0

        next: ->
            if @i < len(@lines)
                line = @lines[@i]
                @i += 1
            else
                line = ''
            # g.trace(repr(line))
            return line

        __next__ = next

    _callerName: (n=1, files=False) ->
        # print('_callerName: %s %s' % (n,files))
        try # get the function name from the call stack.
            f1 = sys._getframe(n) # The stack frame, n levels up.
            code1 = f1.f_code # The code object
            name = code1.co_name
            if name == '__init__'
                name = '__init__(%s,line %s)' % [
                    @shortFileName(code1.co_filename), code1.co_firstlineno]
            if files
                return '%s:%s' % [@shortFileName(code1.co_filename), name]
            else
                return name # The code name
        except ValueError
            # print('g._callerName: ValueError',n)
            return '' # The stack is not deep enough.
        except Exception
            # es_exception()
            return '' # "<no caller name>"

    callers: (n=4, count=0, excludeCaller=True, files=False) ->
        '''Return a list containing the callers of the function that called g.callerList.

        If the excludeCaller keyword is True (the default), g.callers is not on the list.

        If the files keyword argument is True, filenames are included in the list.
        '''
        # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
        # The jython stack often has less than 8 entries,
        # so we must be careful to call g._callerName with smaller values of i first.
        result = []
        i = 3 if excludeCaller else 2
        while 1
            s = @_callerName(i, files=files)
            # print(i,s)
            if s
                result.append(s)
            if not s or len(result) >= n break
            i += 1
        result.reverse
        if count > 0 result = result[count]
        sep = '\n' if files else ','
        return sep.join(result)

    cls: ->
        '''Clear the screen.'''
        if sys.platform.lower.startswith('win')
            os.system('cls')

    computeLeadingWhitespace: (width, tab_width) ->
        '''Returns optimized whitespace corresponding to width with the indicated tab_width.'''
        if width <= 0
            return ""
        elif tab_width > 1
            tabs = int(width / tab_width)
            blanks = int(width % tab_width)
            return ('\t' * tabs) + [' ' * blanks]
        else # Negative tab width always gets converted to blanks.
            return (' ' * width)

    computeLeadingWhitespaceWidth: (s, tab_width) ->
        '''Returns optimized whitespace corresponding to width with the indicated tab_width.'''
        w = 0
        for ch in s
            if ch == ' '
                w += 1
            elif ch == '\t'
                w += [abs(tab_width) - [w % abs(tab_width)]]
            else
                break
        return w

    isString: (s) ->
        '''Return True if s is any string, but not bytes.'''
        if isPython3
            return type(s) == type('a')
        else
            return type(s) in types.StringTypes

    isUnicode: (s) ->
        '''Return True if s is a unicode string.'''
        if isPython3
            return type(s) == type('a')
        else
            return type(s) == types.UnicodeType

    pdb: ->
        try
            pass # import leo.core.leoGlobals as leo_g
            leo_g.pdb
        except ImportError
            pass # import pdb
            pdb.set_trace

    shortFileName: (fileName, n=None) ->
        if n is None or n < 1
            return os.path.basename(fileName)
        else
            return '/'.join(fileName.replace('\\', '/').split('/')[-n])

    splitLines: (s) ->
        '''Split s into lines, preserving trailing newlines.'''
        return s.splitlines(True) if s else []

    toUnicode: (s, encoding='utf-8', reportErrors=False) ->
        '''Connvert a non-unicode string with the given encoding to unicode.'''
        trace = False
        if g.isUnicode(s)
            return s
        if not encoding
            encoding = 'utf-8'
        # These are the only significant calls to s.decode in Leo.
        # Tracing these calls directly yields thousands of calls.
        # Never call g.trace here!
        try
            s = s.decode(encoding, 'strict')
        except UnicodeError
            s = s.decode(encoding, 'replace')
            if trace or reportErrors
                g.trace(g.callers)
                print("toUnicode: Error converting %s... from %s encoding to unicode" % [
                    s[200], encoding])
        except AttributeError
            if trace
                print('toUnicode: AttributeError!: %s' % s)
            # May be a QString.
            s = g.u(s)
        if trace and encoding == 'cp1252'
            print('toUnicode: returns %s' % s)
        return s

    trace: (*args, **keys) ->
        try
            pass # import leo.core.leoGlobals as leo_g
            leo_g.trace(caller_level=2, *args, **keys)
        except ImportError
            print(args, keys)

    if isPython3

        u: (s) ->
            return s

        ue: (s, encoding) ->
            return s if g.isUnicode(s) else str(s, encoding)

    else

        u: (s) ->
            return unicode(s)

        ue: (s, encoding) ->
            return unicode(s, encoding)

class MakeCoffeeScriptController extends object
    '''The controller class for python_to_coffeescript.py.'''

    constructor: ->
        '''Ctor for MakeCoffeeScriptController class.'''
        @options = {}
        # Ivars set on the command line...
        @config_fn = None
        @enable_unit_tests = False
        @files = [] # May also be set in the config file.
        @section_names = ['Global',]
        # Ivars set in the config file...
        @output_directory = @finalize('.')
        @overwrite = False
        @verbose = False # Trace config arguments.

    finalize: (fn) ->
        '''Finalize and regularize a filename.'''
        fn = os.path.expanduser(fn)
        fn = os.path.abspath(fn)
        fn = os.path.normpath(fn)
        return fn

    make_coffeescript_file: (fn) ->
        '''
        Make a stub file in the output directory for all source files mentioned
        in the [Source Files] section of the configuration file.
        '''
        if not fn.endswith('.py')
            print('not a python file', fn)
            return
        if not os.path.exists(fn)
            print('not found', fn)
            return
        base_fn = os.path.basename(fn)
        out_fn = os.path.join(@output_directory, base_fn)
        out_fn = os.path.normpath(out_fn)
        out_fn = out_fn[-3] + '.coffee'
        dir_ = os.path.dirname(out_fn)
        if os.path.exists(out_fn) and not @overwrite
            print('file exists: %s' % out_fn)
        elif not dir_ or os.path.exists(dir_)
            t1 = time.clock
            s = open(fn).read
            readlines = g.ReadLinesClass(s).next
            tokens = list(tokenize.generate_tokens(readlines))
            if use_tree
                node = ast.parse(s, filename=fn, mode='exec')
                s = CoffeeScriptTraverser(controller=@).format(node, tokens)
            else
                s = CoffeeScriptTokenizer(controller=@).format(tokens)
            f = open(out_fn, 'w')
            @output_time_stamp(f)
            f.write(s)
            f.close
            print('wrote: %s' % out_fn)
        else
            print('output directory not not found: %s' % dir_)

    output_time_stamp: (f) ->
        '''Put a time-stamp in the output file f.'''
        f.write('# python_to_coffeescript: %s\n' %
            time.strftime("%a %d %b %Y at %H:%M:%S"))

    run: ->
        '''
        Make stub files for all files.
        Do nothing if the output directory does not exist.
        '''
        if @enable_unit_tests
            @run_all_unit_tests
        if @files
            dir_ = @output_directory
            if dir_
                if os.path.exists(dir_)
                    for fn in @files
                        @make_coffeescript_file(fn)
                else
                    print('output directory not found: %s' % dir_)
            else
                print('no output directory')
        elif not @enable_unit_tests
            print('no input files')

    run_all_unit_tests: ->
        '''Run all unit tests in the python-to-coffeescript/test directory.'''
        pass # import unittest
        loader = unittest.TestLoader
        suite = loader.discover(os.path.abspath('.'),
                                pattern='test*.py',
                                top_level_dir=None)
        unittest.TextTestRunner(verbosity=1).run(suite)

    scan_command_line: ->
        '''Set ivars from command-line arguments.'''
        # This automatically implements the --help option.
        usage = "usage: python_to_coffeescript.py [options] file1, file2, ..."
        parser = optparse.OptionParser(usage=usage)
        add = parser.add_option
        add('-c', '--config', dest='fn',
            help='full path to configuration file')
        add('-d', '--dir', dest='dir',
            help='full path to the output directory')
        add('-o', '--overwrite', action='store_true', default_=False,
            help='overwrite existing .coffee files')
        add('-t', '--test', action='store_true', default_=False,
            help='run unit tests on startup')
        add('-v', '--verbose', action='store_true', default_=False,
            help='verbose output')
        # Parse the options
        options, args = parser.parse_args
        # Handle the options...
        @enable_unit_tests = options.test
        @overwrite = options.overwrite
        if options.fn
            @config_fn = options.fn
        if options.dir
            dir_ = options.dir
            dir_ = @finalize(dir_)
            if os.path.exists(dir_)
                @output_directory = dir_
            else
                print('--dir: directory does not exist: %s' % dir_)
                print('exiting')
                sys.exit(1)
        # If any files remain, set self.files.
        if args
            args = [@finalize(z) for z in args]
            if args
                @files = args

    scan_options: ->
        '''Set all configuration-related ivars.'''
        trace = False
        if not @config_fn
            return
        @parser = parser = @create_parser
        s = @get_config_string
        @init_parser(s)
        if @files
            files_source = 'command-line'
            files = @files
        elif parser.has_section('Global')
            files_source = 'config file'
            files = parser.get('Global', 'files')
            files = [z.strip for z in files.split('\n') if z.strip]
        else
            return
        files2 = []
        for z in files
            files2.extend(glob.glob(@finalize(z)))
        @files = [z for z in files2 if z and os.path.exists(z)]
        if trace
            print('Files (from %s)...\n' % files_source)
            for z in @files
                print(z)
            print('')
        if 'output_directory' in parser.options('Global')
            s = parser.get('Global', 'output_directory')
            output_dir = @finalize(s)
            if os.path.exists(output_dir)
                @output_directory = output_dir
                if @verbose
                    print('output directory: %s\n' % output_dir)
            else
                print('output directory not found: %s\n' % output_dir)
                @output_directory = None # inhibit run().
        if 'prefix_lines' in parser.options('Global')
            prefix = parser.get('Global', 'prefix_lines')
            @prefix_lines = prefix.split('\n')
                # The parser does not preserve leading whitespace.
            if trace
                print('Prefix lines...\n')
                for z in @prefix_lines
                    print(z)
                print('')
        #
        # self.def_patterns = self.scan_patterns('Def Name Patterns')
        # self.general_patterns = self.scan_patterns('General Patterns')
        # self.make_patterns_dict()

    create_parser: ->
        '''Create a RawConfigParser and return it.'''
        parser = configparser.RawConfigParser(dict_type=OrderedDict)
            # Requires Python 2.7
        parser.optionxform = str
        return parser

    get_config_string: ->
        fn = @finalize(@config_fn)
        if os.path.exists(fn)
            if @verbose
                print('\nconfiguration file: %s\n' % fn)
            f = open(fn, 'r')
            s = f.read
            f.close
            return s
        else
            print('\nconfiguration file not found: %s' % fn)
            return ''

    init_parser: (s) ->
        '''Add double back-slashes to all patterns starting with '['.'''
        trace = False
        if not s return
        aList = []
        for s in s.split('\n')
            if @is_section_name(s)
                aList.append(s)
            elif s.strip.startswith('[')
                aList.append(r'\\' + s[1])
                if trace g.trace('*** escaping:', s)
            else
                aList.append(s)
        s = '\n'.join(aList) + '\n'
        if trace g.trace(s)
        file_object = io.StringIO(s)
        @parser.readfp(file_object)

    is_section_name: (s) ->

        munge: (s) ->
            return s.strip.lower.replace(' ', '')

        s = s.strip
        if s.startswith('[') and s.endswith(']')
            s = munge(s[1 - 1])
            for s2 in @section_names
                if s == munge(s2)
                    return True
        return False

class ParseState extends object
    '''A class representing items parse state stack.'''

    constructor: (kind, value) ->
        @kind = kind
        @value = value

    __repr__: ->
        return 'State: %10s %s' % [@kind, repr(@value)]

    __str__ = __repr__

class TestClass extends object
    '''A class containing constructs that have caused difficulties.'''
    # pylint: disable=no-member
    # pylint: disable=undefined-variable
    # pylint: disable=no-self-argument
    # pylint: disable=no-method-argument

    parse_group: (group) ->
        if len(group) >= 3 and group[-2] == 'as'
            del group[-2]
        ndots = 0
        i = 0
        while len(group) > i and group[i].startswith('.')
            ndots += len(group[i])
            i += 1
        assert ''.join(group[i]) == '.' * ndots, group
        del group[i]
        assert all(g == '.' for g in group[12]), group
        return ndots, os.sep.join(group[2])

    return_all: ->
        return all([is_known_type(z) for z in s3.split(',')])
        # return all(['abc'])

    return_array: ->
        return f(s[1 - 1])

    return_list: (a) ->
        return [a]

    return_two_lists: (s) ->
        if 1
            return aList
        else
            return list(@regex.finditer(s))

class TokenSync extends object
    '''A class to sync and remember tokens.'''

    constructor: (tokens) ->
        '''Ctor for TokenSync class.'''
        @tab_width = 4
        @tokens = tokens
        # Accumulation ivars...
        # self.lws = 0
        @returns = []
        @ws = []
        # State ivars...
        @backslash_seen = False
        @last_line_number = None
        @output_paren_level = 0
        # TODO (maybe)...
        # self.kind = None
        # self.raw_val = None
        # self.val = = None

    advance: ->
        '''Advance one token. Update ivars.'''
        trace = False
        if not @tokens
            return
        token5tuple = @tokens.pop(0)
        t1, t2, t3, t4, t5 = token5tuple
        srow, scol = t3
        kind = token.tok_name[t1].lower
        val = g.toUnicode(t2)
        raw_val = g.toUnicode(t5).rstrip
        if srow != @last_line_number
            # Handle a previous backslash.
            if @backslash_seen
                @do_backslash
            # Start a new row.
            @backslash_seen = raw_val.endswith('\\')
            if @output_paren_level > 0
                s = raw_val
                n = g.computeLeadingWhitespaceWidth(s, @tab_width)
                # This n will be one-too-many if formatting has
                # changed: foo (
                # to:      foo(
                @do_line_indent(ws=' ' * n)
                    # Do not set self.lws here!
            @last_line_number = srow
        if trace g.trace('%10s %r' % [kind, val])

    do_backslash: ->
        '''Handle a backslash-newline.'''

    do_line_indent: (ws=None) ->
        '''Handle line indentation.'''
        # self.clean('line-indent')
        # ws = ws or self.lws
        # if ws:
            # self.add_token('line-indent', ws)

g = LeoGlobals # For ekr.
if __name__ == "__main__"
    main

