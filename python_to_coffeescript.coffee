# python_to_coffeescript: Sun 21 Feb 2016 at 03:34:06
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
try:
    pass # import ConfigParser as configparser # Python 2
except ImportError:
    pass # import configparser # Python 3
pass # import glob
pass # import optparse
pass # import os
# import re
pass # import sys
pass # import time
pass # import token
pass # import tokenize
pass # import types
try:
    pass # import StringIO as io # Python 2
except ImportError:
    pass # import io # Python 3
isPython3 = sys.version_info >= (3, 0, 0)

main = () ->
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

dump = (title, s=None) ->
    if s:
        print('===== %s...\n%s\n' % (title, s.rstrip()))
    else:
        print('===== %s...\n' % title)

dump_dict = (title, d) ->
    '''Dump a dictionary with a header.'''
    dump(title)
    for z in sorted(d):
        print('%30s %s' % (z, d.get(z)))
    print('')

dump_list = (title, aList) ->
    '''Dump a list with a header.'''
    dump(title)
    for z in aList:
        print(z)
    print('')

pdb = () ->
    '''Invoke a debugger during unit testing.'''
    try:
        pass # import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        pass # import pdb
        pdb.set_trace()

truncate = (s, n) ->
    '''Return s truncated to n characters.'''
    return s if len(s) <= n else s[: n - 3] + '...'

class CoffeeScriptTokenizer
    '''A token-based Python beautifier.'''

    class OutputToken extends object:
        '''A class representing Output Tokens'''

        constructor: (kind, value) ->
            @kind = kind
            @value = value

        __repr__: () ->
            if @kind == 'line-indent':
                assert not @value.strip(' ')
                return '%15s %s' % (@kind, len(@value))
            else:
                return '%15s %r' % (@kind, @value)

        __str__ = __repr__

        to_string: () ->
            '''Convert an output token to a string.'''
            return @value if g.isString(@value) else ''

    class StateStack extends object:
        '''
        A class representing a stack of ParseStates and encapsulating various
        operations on same.
        '''

        constructor: () ->
            '''Ctor for ParseStack class.'''
            @stack = []

        get: (kind) ->
            '''Return the last state of the given kind, leaving the stack unchanged.'''
            n = len(@stack)
            i = n - 1
            while 0 <= i:
                state = @stack[i]
                if state.kind == kind:
                    return state
                i -= 1
            return None

        has: (kind) ->
            '''Return True if state.kind == kind for some ParseState on the stack.'''
            return any([z.kind == kind for z in @stack])

        pop: () ->
            '''Pop the state on the stack and return it.'''
            return @stack.pop()

        push: (kind, value=None) ->
            '''Append a state to the state stack.'''
            @stack.append(ParseState(kind, value))
            if kind == 'tuple':
                g.trace(kind, value, g.callers(2))

        remove: (kind) ->
            '''Remove the last state on the stack of the given kind.'''
            trace = True
            n = len(@stack)
            i = n - 1
            found = None
            while 0 <= i:
                state = @stack[i]
                if state.kind == kind:
                    found = state
                    @stack = @stack[: i] + @stack[i + 1:]
                    assert len(@stack) == n - 1, (len(@stack), n - 1)
                    break
                i -= 1
            if trace and kind == 'tuple':
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
        @stack = None # Stack of ParseState objects, set in format.
        # Settings...
        @delete_blank_lines = False
        @tab_width = 4

         # Undo vars
        @changed = False
        @dirtyVnodeList = []

    format: (tokens) ->
        '''
        The main line of PythonTokenBeautifier class.
        Called by prettPrintNode & test_beautifier.
        '''

        oops: () ->
            g.trace('unknown kind', @kind)

        trace = False
        @code_list = []
        @stack = @StateStack()
        @file_start()
        for token5tuple in tokens:
            t1, t2, t3, t4, t5 = token5tuple
            srow, scol = t3
            @kind = token.tok_name[t1].lower()
            @val = g.toUnicode(t2)
            @raw_val = g.toUnicode(t5)
            if srow != @last_line_number:
                # Handle a previous backslash.
                if @backslash_seen:
                    @backslash()
                # Start a new row.
                raw_val = @raw_val.rstrip()
                @backslash_seen = raw_val.endswith('\\')
                # g.trace('backslash_seen',self.backslash_seen)
                if @output_paren_level > 0:
                    s = @raw_val.rstrip()
                    n = g.computeLeadingWhitespaceWidth(s, @tab_width)
                    # This n will be one-too-many if formatting has
                    # changed: foo (
                    # to:      foo(
                    @line_indent(ws=' ' * n)
                        # Do not set self.lws here!
                @last_line_number = srow
            if trace: g.trace('%10s %r' % (@kind, @val))
            func = getattr(@'do_' + @kind, oops)
            func()
        @file_end()
        return ''.join([z.to_string() for z in @code_list])

    do_comment: () ->
        '''Handle a comment token.'''
        raw_val = @raw_val.rstrip()
        val = @val.rstrip()
        entire_line = raw_val.lstrip().startswith('#')
        @backslash_seen = False
            # Putting the comment will put the backslash.
        if entire_line:
            @clean('line-indent')
            @add_token('comment', raw_val)
        else:
            @blank()
            @add_token('comment', val)

    do_endmarker: () ->
        '''Handle an endmarker token.'''
        pass

    do_errortoken: () ->
        '''Handle an errortoken token.'''
        # This code is executed for versions of Python earlier than 2.4
        if @val == '@':
            @op(@val)

    do_dedent: () ->
        '''Handle dedent token.'''
        @level -= 1
        @lws = @level * @tab_width * ' '
        @line_start()
        # End all classes & defs.
        for state in @stack.stack:
            if state.kind in ('class', 'def'):
                if state.value >= @level:
                    # g.trace(self.level, 'end', state.kind)
                    @stack.remove(state.kind)
                else:
                    break

    do_indent: () ->
        '''Handle indent token.'''
        @level += 1
        @lws = @val
        @line_start()

    do_name: () ->
        '''Handle a name token.'''
        name = @val
        if name in ('class', 'def'):
            @gen_class_or_def(name)
        elif name in ('from', 'import'):
            @gen_import(name)
        elif name == 'self':
            @gen_self()
        elif @in_def_line and not @def_name_seen:
            if name == '__init__':
                name = 'constructor'
            @word(name)
            if @stack.has('class'):
                @op_blank(':')
            else:
                @op('=')
            @def_name_seen = True
        elif name in ('and', 'in', 'not', 'not in', 'or'):
            @word_op(name)
        elif name == 'default':
            # Hard to know where to put a warning comment.
            @word(name + '_')
        else:
            @word(name)

    gen_class_or_def: (name) ->

        # g.trace(self.level, name)
        @decorator_seen = False
        if @stack.has('decorator'):
            @stack.remove('decorator')
            @clean_blank_lines()
            @line_end()
        else:
            @blank_lines(1)
        @stack.push(name, @level)
            # name is 'class' or 'def'
            # do_dedent pops these entries.
        if name == 'def':
            @in_def_line = True
            @in_class_line = False
            @def_name_seen = False
        else:
            @extends_flag = False
            @in_class_line = True
            @word(name)

    gen_import: (name) ->
        '''Convert an import to something that looks like a call.'''
        @word('pass')
        @add_token('comment', '# ' + name)

    gen_self: () ->
        if @in_def_line:
            @after_self = True
        else:
            @blank_op('@')
            @after_self = True

    do_newline: () ->
        '''Handle a regular newline.'''
        @line_end()

    do_nl: () ->
        '''Handle a continuation line.'''
        @line_end()

    do_number: () ->
        '''Handle a number token.'''
        @add_token('number', @val)

    do_op: () ->
        '''Handle an op token.'''
        val = @val
        if val == '.':
            @gen_period()
        elif val == '@':
            @gen_at()
        elif val == ':':
            @gen_colon()
        elif val == '(':
            @gen_open_paren()
        elif val == ')':
            @gen_close_paren()
        elif val == ',':
            @gen_comma()
        elif val == ';':
            # Pep 8: Avoid extraneous whitespace immediately before
            # comma, semicolon, or colon.
            @op_blank(val)
        elif val in '[{':
            # Pep 8: Avoid extraneous whitespace immediately inside
            # parentheses, brackets or braces.
            @lt(val)
        elif val in ']}':
            @rt(val)
        elif val == '=':
            # Pep 8: Don't use spaces around the = sign when used to indicate
            # a keyword argument or a default parameter value.
            if @output_paren_level:
                @op_no_blanks(val)
            else:
                @op(val)
        elif val in '~+-':
            @possible_unary_op(val)
        elif val == '*':
            @star_op()
        elif val == '**':
            @star_star_op()
        else:
            # Pep 8: always surround binary operators with a single space.
            # '==','+=','-=','*=','**=','/=','//=','%=','!=','<=','>=','<','>',
            # '^','~','*','**','&','|','/','//',
            # Pep 8: If operators with different priorities are used,
            # consider adding whitespace around the operators with the lowest priority(ies).
            @op(val)

    gen_at: () ->

        val = @val
        assert val == '@', val
        if not @decorator_seen:
            @blank_lines(1)
            @decorator_seen = True
        @op_no_blanks(val)
        @stack.push('decorator')

    gen_colon: () ->

        val = @val
        assert val == ':', val
        if @in_def_line:
            if @input_paren_level == 0:
                @in_def_line = False
                @op('->')
        elif @in_class_line:
            if @input_paren_level == 0:
                @in_class_line = False
        else:
            @op_blank(val)

    gen_comma: () ->

        val = @val
        assert val == ',', val
        if @after_self:
            @after_self = False
        else:
            # Pep 8: Avoid extraneous whitespace immediately before
            # comma, semicolon, or colon.
            @op_blank(val)

    gen_open_paren: () ->

        val = @val
        assert val == '(', val
        @input_paren_level += 1
        if @in_class_line:
            if not @extends_flag:
                @word('extends')
                @extends_flag = True
        else:
            # Generate a function call or a list.
            @lt(val)
        @after_self = False

    gen_close_paren: () ->

        val = @val
        assert val == ')', val
        @input_paren_level -= 1
        ### prev = self.code_list[-1]
        if @in_class_line:
            @in_class_line = False
        else:
            @rt(val)
        ###
        # elif prev.kind == 'lt' and prev.value == '(':
            # self.clean('lt')
            # self.output_paren_level -= 1
        # else:
            # self.rt(val)
        @after_self = False

    gen_period: () ->

        val = @val
        assert val == '.', val
        if @after_self:
            @after_self = False
        else:
            @op_no_blanks(val)

    do_string: () ->
        '''Handle a 'string' token.'''
        @add_token('string', @val)
        if @val.find('\\\n'):
            @backslash_seen = False
            # This *does* retain the string's spelling.
        @blank()

    add_token: (kind, value='') ->
        '''Add a token to the code list.'''
        # if kind in ('line-indent','line-start','line-end'):
            # g.trace(kind,repr(value),g.callers())
        tok = @OutputToken(kind, value)
        @code_list.append(tok)

    # def arg_end(self):
        # '''Add a token indicating the end of an argument list.'''
        # self.add_token('arg-end')

    # def arg_start(self):
        # '''Add a token indicating the start of an argument list.'''
        # self.add_token('arg-start')

    backslash: () ->
        '''Add a backslash token and clear .backslash_seen'''
        @add_token('backslash', '\\')
        @add_token('line-end', '\n')
        @line_indent()
        @backslash_seen = False

    blank: () ->
        '''Add a blank request on the code list.'''
        prev = @code_list[-1]
        if not prev.kind in (
            'blank', 'blank-lines', 'blank-op',
            'file-start',
            'line-end', 'line-indent',
            'lt', 'op-no-blanks', 'unary-op',
        ):
            @add_token('blank', ' ')

    blank_lines: (n) ->
        '''
        Add a request for n blank lines to the code list.
        Multiple blank-lines request yield at least the maximum of all requests.
        '''
        @clean_blank_lines()
        kind = @code_list[-1].kind
        if kind == 'file-start':
            @add_token('blank-lines', n)
        else:
            for i in range(0, n + 1):
                @add_token('line-end', '\n')
            # Retain the token (intention) for debugging.
            @add_token('blank-lines', n)
            @line_indent()

    clean: (kind) ->
        '''Remove the last item of token list if it has the given kind.'''
        prev = @code_list[-1]
        if prev.kind == kind:
            @code_list.pop()

    clean_blank_lines: () ->
        '''Remove all vestiges of previous lines.'''
        table = ('blank-lines', 'line-end', 'line-indent')
        while @code_list[-1].kind in table:
            @code_list.pop()

    file_end: () ->
        '''
        Add a file-end token to the code list.
        Retain exactly one line-end token.
        '''
        @clean_blank_lines()
        @add_token('line-end', '\n')
        @add_token('line-end', '\n')
        @add_token('file-end')

    file_start: () ->
        '''Add a file-start token to the code list and the state stack.'''
        @add_token('file-start')
        @stack.push('file-start')

    line_indent: (ws=None) ->
        '''Add a line-indent token if indentation is non-empty.'''
        @clean('line-indent')
        ws = ws or @lws
        if ws:
            @add_token('line-indent', ws)

    line_end: () ->
        '''Add a line-end request to the code list.'''
        prev = @code_list[-1]
        if prev.kind == 'file-start':
            return
        @clean('blank') # Important!
        if @delete_blank_lines:
            @clean_blank_lines()
        @clean('line-indent')
        if @backslash_seen:
            @backslash()
        @add_token('line-end', '\n')
        @line_indent()
            # Add the indentation for all lines
            # until the next indent or unindent token.

    line_start: () ->
        '''Add a line-start request to the code list.'''
        @line_indent()

    lt: (s) ->
        '''Add a left paren request to the code list.'''
        assert s in '([{', repr(s)
        @output_paren_level += 1
        @clean('blank')
        prev = @code_list[-1]
        ####
        # if prev.kind in ('op', 'word-op'):
            # self.blank()
            # self.add_token('lt', s)
        if @in_def_line:
            @blank()
            @add_token('lt', s)
        elif prev.kind in ('op', 'word-op'):
            @blank()
            ###
            # if s == '(':
                # s = '['
                # self.stack.push('tuple', self.output_paren_level)
                # g.trace('line', self.last_line_number, self.output_paren_level)
            @add_token('lt', s)
        elif prev.kind == 'word':
            # Only suppress blanks before '(' or '[' for non-keyworks.
            if s == '{' or prev.value in ('if', 'else', 'return'):
                @blank()
            @add_token('lt', s)
        elif prev.kind == 'op':
            @op(s)
        else:
            @op_no_blanks(s)

    rt: (s) ->
        '''Add a right paren request to the code list.'''
        assert s in ')]}', repr(s)
        @output_paren_level -= 1
        prev = @code_list[-1]
        if prev.kind == 'arg-end':
            # Remove a blank token preceding the arg-end token.
            prev = @code_list.pop()
            @clean('blank')
            @code_list.append(prev)
        else:
            @clean('blank')
        if @stack.has('tuple'):
            g.trace('line', @last_line_number, @output_paren_level)
            state = @stack.get('tuple')
            if state.value == @output_paren_level:
                @add_token('rt', ']')
                @stack.remove('tuple')
            else:
                @add_token('rt', s)
        else:
            @add_token('rt', s)

    op: (s) ->
        '''Add op token to code list.'''
        assert s and g.isString(s), repr(s)
        @blank()
        @add_token('op', s)
        @blank()

    op_blank: (s) ->
        '''Remove a preceding blank token, then add op and blank tokens.'''
        assert s and g.isString(s), repr(s)
        @clean('blank')
        @add_token('op', s)
        @blank()

    op_no_blanks: (s) ->
        '''Add an operator *not* surrounded by blanks.'''
        @clean('blank')
        @add_token('op-no-blanks', s)

    blank_op: (s) ->
        '''Add an operator possibly with a preceding blank.'''
        @blank()
        @add_token('blank-op', s)

    possible_unary_op: (s) ->
        '''Add a unary or binary op to the token list.'''
        @clean('blank')
        prev = @code_list[-1]
        if prev.kind in ('lt', 'op', 'op-no-blanks', 'word-op'):
            @unary_op(s)
        elif prev.kind == 'word' and prev.value in ('elif', 'if', 'return', 'while'):
            @unary_op(s)
        else:
            @op(s)

    unary_op: (s) ->
        '''Add an operator request to the code list.'''
        assert s and g.isString(s), repr(s)
        @blank()
        @add_token('unary-op', s)

    star_op: () ->
        '''Put a '*' op, with special cases for *args.'''
        val = '*'
        if @output_paren_level:
            i = len(@code_list) - 1
            if @code_list[i].kind == 'blank':
                i -= 1
            token = @code_list[i]
            if token.kind == 'lt':
                @op_no_blanks(val)
            elif token.value == ',':
                @blank()
                @add_token('op-no-blanks', val)
            else:
                @op(val)
        else:
            @op(val)

    star_star_op: () ->
        '''Put a ** operator, with a special case for **kwargs.'''
        val = '**'
        if @output_paren_level:
            i = len(@code_list) - 1
            if @code_list[i].kind == 'blank':
                i -= 1
            token = @code_list[i]
            if token.value == ',':
                @blank()
                @add_token('op-no-blanks', val)
            else:
                @op(val)
        else:
            @op(val)

    word: (s) ->
        '''Add a word request to the code list.'''
        assert s and g.isString(s), repr(s)
        @blank()
        @add_token('word', s)
        @blank()

    word_op: (s) ->
        '''Add a word-op request to the code list.'''
        assert s and g.isString(s), repr(s)
        @blank()
        @add_token('word-op', s)
        @blank()

class ParseState extends object:
    '''A class representing items parse state stack.'''

    constructor: (kind, value) ->
        @kind = kind
        @value = value

    __repr__: () ->
        return 'State: %10s %s' % (@kind, repr(@value))

    __str__ = __repr__

class LeoGlobals extends object:
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''

    class NullObject
        """
        An object that does nothing, and does it very well.
        From the Python cookbook, recipe 5.23
        """

        constructor: (*args, **keys) -> pass

        __call__: (*args, **keys) -> return @

        __repr__: () -> return "NullObject"

        __str__: () -> return "NullObject"

        __bool__: () -> return False

        __nonzero__: () -> return 0

        __delattr__: (attr) -> return @

        __getattr__: (attr) -> return @

        __setattr__: (attr, val) -> return @

    class ReadLinesClass
        """A class whose next method provides a readline method for Python's tokenize module."""

        constructor: (s) ->
            @lines = s.splitlines(True) if s else []
                # g.splitLines(s)
            @i = 0

        next: () ->
            if @i < len(@lines):
                line = @lines[@i]
                @i += 1
            else:
                line = ''
            # g.trace(repr(line))
            return line

        __next__ = next

    _callerName: (n=1, files=False) ->
        # print('_callerName: %s %s' % (n,files))
        try: # get the function name from the call stack.
            f1 = sys._getframe(n) # The stack frame, n levels up.
            code1 = f1.f_code # The code object
            name = code1.co_name
            if name == '__init__':
                name = '__init__(%s,line %s)' % (
                    @shortFileName(code1.co_filename), code1.co_firstlineno)
            if files:
                return '%s:%s' % (@shortFileName(code1.co_filename), name)
            else:
                return name # The code name
        except ValueError:
            # print('g._callerName: ValueError',n)
            return '' # The stack is not deep enough.
        except Exception:
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
        while 1:
            s = @_callerName(i, files=files)
            # print(i,s)
            if s:
                result.append(s)
            if not s or len(result) >= n: break
            i += 1
        result.reverse()
        if count > 0: result = result[: count]
        sep = '\n' if files else ','
        return sep.join(result)

    cls: () ->
        '''Clear the screen.'''
        if sys.platform.lower().startswith('win'):
            os.system('cls')

    computeLeadingWhitespace: (width, tab_width) ->
        '''Returns optimized whitespace corresponding to width with the indicated tab_width.'''
        if width <= 0:
            return ""
        elif tab_width > 1:
            tabs = int(width / tab_width)
            blanks = int(width % tab_width)
            return ('\t' * tabs) + (' ' * blanks)
        else: # Negative tab width always gets converted to blanks.
            return (' ' * width)

    computeLeadingWhitespaceWidth: (s, tab_width) ->
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

    isString: (s) ->
        '''Return True if s is any string, but not bytes.'''
        if isPython3:
            return type(s) == type('a')
        else:
            return type(s) in types.StringTypes

    isUnicode: (s) ->
        '''Return True if s is a unicode string.'''
        if isPython3:
            return type(s) == type('a')
        else:
            return type(s) == types.UnicodeType

    pdb: () ->
        try:
            pass # import leo.core.leoGlobals as leo_g
            leo_g.pdb()
        except ImportError:
            pass # import pdb
            pdb.set_trace()

    shortFileName: (fileName, n=None) ->
        if n is None or n < 1:
            return os.path.basename(fileName)
        else:
            return '/'.join(fileName.replace('\\', '/').split('/')[-n:])

    splitLines: (s) ->
        '''Split s into lines, preserving trailing newlines.'''
        return s.splitlines(True) if s else []

    toUnicode: (s, encoding='utf-8', reportErrors=False) ->
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

    trace: (*args, **keys) ->
        try:
            pass # import leo.core.leoGlobals as leo_g
            leo_g.trace(caller_level=2, *args, **keys)
        except ImportError:
            print(args, keys)

    if isPython3:

        u: (s) ->
            return s

        ue: (s, encoding) ->
            return s if g.isUnicode(s) else str(s, encoding)

    else:

        u: (s) ->
            return unicode(s)

        ue: (s, encoding) ->
            return unicode(s, encoding)

class MakeCoffeeScriptController extends object:
    '''The controller class for python_to_coffeescript.py.'''

    constructor: () ->
        '''Ctor for MakeCoffeeScriptController class.'''
        @options = {}
        # Ivars set on the command line...
        @config_fn = None
        @enable_unit_tests = False
        @files = [] # May also be set in the config file.
        @section_names = ('Global',)
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
        if not fn.endswith('.py'):
            print('not a python file', fn)
            return
        if not os.path.exists(fn):
            print('not found', fn)
            return
        base_fn = os.path.basename(fn)
        out_fn = os.path.join(@output_directory, base_fn)
        out_fn = os.path.normpath(out_fn)
        out_fn = out_fn[: -3] + '.coffee'
        dir_ = os.path.dirname(out_fn)
        if os.path.exists(out_fn) and not @overwrite:
            print('file exists: %s' % out_fn)
        elif not dir_ or os.path.exists(dir_):
            t1 = time.clock()
            s = open(fn).read()
            readlines = g.ReadLinesClass(s).next
            tokens = list(tokenize.generate_tokens(readlines))
            s = CoffeeScriptTokenizer(controller=@).format(tokens)
            f = open(out_fn, 'w')
            @output_time_stamp(f)
            f.write(s)
            f.close()
            print('wrote: %s' % out_fn)
        else:
            print('output directory not not found: %s' % dir_)

    output_time_stamp: (f) ->
        '''Put a time-stamp in the output file f.'''
        f.write('# python_to_coffeescript: %s\n' %
            time.strftime("%a %d %b %Y at %H:%M:%S"))

    run: () ->
        '''
        Make stub files for all files.
        Do nothing if the output directory does not exist.
        '''
        if @enable_unit_tests:
            @run_all_unit_tests()
        if @files:
            dir_ = @output_directory
            if dir_:
                if os.path.exists(dir_):
                    for fn in @files:
                        @make_coffeescript_file(fn)
                else:
                    print('output directory not found: %s' % dir_)
            else:
                print('no output directory')
        elif not @enable_unit_tests:
            print('no input files')

    run_all_unit_tests: () ->
        '''Run all unit tests in the python-to-coffeescript/test directory.'''
        pass # import unittest
        loader = unittest.TestLoader()
        suite = loader.discover(os.path.abspath('.'),
                                pattern='test*.py',
                                top_level_dir=None)
        unittest.TextTestRunner(verbosity=1).run(suite)

    scan_command_line: () ->
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
        options, args = parser.parse_args()
        # Handle the options...
        @enable_unit_tests = options.test
        @overwrite = options.overwrite
        if options.fn:
            @config_fn = options.fn
        if options.dir:
            dir_ = options.dir
            dir_ = @finalize(dir_)
            if os.path.exists(dir_):
                @output_directory = dir_
            else:
                print('--dir: directory does not exist: %s' % dir_)
                print('exiting')
                sys.exit(1)
        # If any files remain, set self.files.
        if args:
            args = [@finalize(z) for z in args]
            if args:
                @files = args

    scan_options: () ->
        '''Set all configuration-related ivars.'''
        trace = False
        if not @config_fn:
            return
        @parser = parser = @create_parser()
        s = @get_config_string()
        @init_parser(s)
        if @files:
            files_source = 'command-line'
            files = @files
        elif parser.has_section('Global'):
            files_source = 'config file'
            files = parser.get('Global', 'files')
            files = [z.strip() for z in files.split('\n') if z.strip()]
        else:
            return
        files2 = []
        for z in files:
            files2.extend(glob.glob(@finalize(z)))
        @files = [z for z in files2 if z and os.path.exists(z)]
        if trace:
            print('Files (from %s)...\n' % files_source)
            for z in @files:
                print(z)
            print('')
        if 'output_directory' in parser.options('Global'):
            s = parser.get('Global', 'output_directory')
            output_dir = @finalize(s)
            if os.path.exists(output_dir):
                @output_directory = output_dir
                if @verbose:
                    print('output directory: %s\n' % output_dir)
            else:
                print('output directory not found: %s\n' % output_dir)
                @output_directory = None # inhibit run().
        if 'prefix_lines' in parser.options('Global'):
            prefix = parser.get('Global', 'prefix_lines')
            @prefix_lines = prefix.split('\n')
                # The parser does not preserve leading whitespace.
            if trace:
                print('Prefix lines...\n')
                for z in @prefix_lines:
                    print(z)
                print('')
        #
        # self.def_patterns = self.scan_patterns('Def Name Patterns')
        # self.general_patterns = self.scan_patterns('General Patterns')
        # self.make_patterns_dict()

    create_parser: () ->
        '''Create a RawConfigParser and return it.'''
        parser = configparser.RawConfigParser(dict_type=OrderedDict)
            # Requires Python 2.7
        parser.optionxform = str
        return parser

    get_config_string: () ->
        fn = @finalize(@config_fn)
        if os.path.exists(fn):
            if @verbose:
                print('\nconfiguration file: %s\n' % fn)
            f = open(fn, 'r')
            s = f.read()
            f.close()
            return s
        else:
            print('\nconfiguration file not found: %s' % fn)
            return ''

    init_parser: (s) ->
        '''Add double back-slashes to all patterns starting with '['.'''
        trace = False
        if not s: return
        aList = []
        for s in s.split('\n'):
            if @is_section_name(s):
                aList.append(s)
            elif s.strip().startswith('['):
                aList.append(r'\\' + s[1:])
                if trace: g.trace('*** escaping:', s)
            else:
                aList.append(s)
        s = '\n'.join(aList) + '\n'
        if trace: g.trace(s)
        file_object = io.StringIO(s)
        @parser.readfp(file_object)

    is_section_name: (s) ->

        munge: (s) ->
            return s.strip().lower().replace(' ', '')

        s = s.strip()
        if s.startswith('[') and s.endswith(']'):
            s = munge(s[1: -1])
            for s2 in @section_names:
                if s == munge(s2):
                    return True
        return False

class TestClass extends object:
    '''
    A class containing constructs that have caused difficulties.
    This is in the make_stub_files directory, not the test directory.
    '''
    # pylint: disable=no-member
    # pylint: disable=undefined-variable
    # pylint: disable=no-self-argument
    # pylint: disable=no-method-argument

    parse_group: (group) ->
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

    return_all: () ->
        return all([is_known_type(z) for z in s3.split(',')])
        # return all(['abc'])

    return_array: () ->
        return f(s[1: -1])

    return_list: (a) ->
        return [a]

    return_two_lists: (s) ->
        if 1:
            return aList
        else:
            return list(@regex.finditer(s))

g = LeoGlobals() # For ekr.
if __name__ == "__main__":
    main()

