# -*- coding: utf-8 -*-
# https://bitbucket.org/plas/thonny/src/3b71fda7ac0b66d5c475f7a668ffbdc7ae48c2b5/thonny/ast_utils.py?at=master
import ast
import _ast
import io
import sys
import token
import tokenize
# from thonny.common import TextRange
import traceback
# pylint: disable=deprecated-lambda
isPython3 = sys.version_info >= (3, 0, 0)
# stuff together, naming each item of the bunch; a dictionary's OK for
# that, but a small do-nothing class is even handier, and prettier to
# use.
# 
# Create a Bunch whenever you want to group a few variables:
# 
#     point = Bunch(datum=y, squared=y*y, coord=x)
# 
# You can read/write the named attributes you just created, add others,
# del some of them, etc:
#     if point.squared > threshold:
#         point.isok = True

class Bunch(object):
    """A class that represents a colection of things.

    Especially useful for representing a collection of related variables."""

    def __init__(self, **keywords):
        self.__dict__.update(keywords)

    def __repr__(self):
        return self.toString()

    def ivars(self):
        return sorted(self.__dict__)

    def keys(self):
        return sorted(self.__dict__)

    def toString(self):
        tag = self.__dict__.get('tag')
        entries = ["%s: %s" % (key, str(self.__dict__.get(key)))
            for key in self.ivars() if key != 'tag']
        if tag:
            return "Bunch(tag=%s)...\n%s\n" % (tag, '\n'.join(entries))
        else:
            return "Bunch...\n%s\n" % '\n'.join(entries)
    # Used by new undo code.

    def __setitem__(self, key, value):
        '''Support aBunch[key] = val'''
        return operator.setitem(self.__dict__, key, value)

    def __getitem__(self, key):
        '''Support aBunch[key]'''
        return operator.getitem(self.__dict__, key)

    def get(self, key, theDefault=None):
        return self.__dict__.get(key, theDefault)

bunch = Bunch
def mark_text_ranges(node, source):
    """
    Node is an AST, source is corresponding source as string.
    Function adds recursively attributes end_lineno and end_col_offset to each node
    which has attributes lineno and col_offset.
    """

    def _extract_tokens(tokens, lineno, col_offset, end_lineno, end_col_offset):
        return list(filter((lambda tok: tok.start[0] >= lineno
                                   and (tok.start[1] >= col_offset or tok.start[0] > lineno)
                                   and tok.end[0] <= end_lineno
                                   and (tok.end[1] <= end_col_offset or tok.end[0] < end_lineno)
                                   and tok.string != ''),
                           tokens))


    def _mark_text_ranges_rec(node, tokens, prelim_end_lineno, prelim_end_col_offset):
        """
        Returns the earliest starting position found in given tree, 
        this is convenient for internal handling of the siblings
        """
        # set end markers to this node
        if "lineno" in node._attributes and "col_offset" in node._attributes:
            tokens = _extract_tokens(tokens, node.lineno, node.col_offset, prelim_end_lineno, prelim_end_col_offset)
            try:
                tokens = _mark_end_and_return_child_tokens(node, tokens, prelim_end_lineno, prelim_end_col_offset)
            except:
                traceback.print_exc() # TODO: log it somewhere
                # fallback to incorrect marking instead of exception
                node.end_lineno = node.lineno
                node.end_col_offset = node.col_offset + 1
        # mark its children, starting from last one
        # NB! need to sort children because eg. in dict literal all keys come first and then all values
        children = list(_get_ordered_child_nodes(node))
        for child in reversed(children):
            (prelim_end_lineno, prelim_end_col_offset) = \
            _mark_text_ranges_rec(child, tokens, prelim_end_lineno, prelim_end_col_offset)
        if "lineno" in node._attributes and "col_offset" in node._attributes:
            # new "front" is beginning of this node
            prelim_end_lineno = node.lineno
            prelim_end_col_offset = node.col_offset
        return (prelim_end_lineno, prelim_end_col_offset)

    def _strip_trailing_junk_from_expressions(tokens):
        # pylint: disable=no-member
        # the code below works if token.ELLIPSIS does not exist.
        while(tokens[-1].type not in (token.RBRACE, token.RPAR, token.RSQB,
                                      token.NAME, token.NUMBER, token.STRING)
                    and not (hasattr(token, "ELLIPSIS") and tokens[-1].type == token.ELLIPSIS)
                    and tokens[-1].string not in ")}]"
                    or tokens[-1].string in ['and', 'as', 'assert', 'class', 'def', 'del',
                                              'elif', 'else', 'except', 'exec', 'finally',
                                              'for', 'from', 'global', 'if', 'import', 'in',
                                              'is', 'lambda', 'not', 'or', 'try',
                                              'while', 'with', 'yield']):
            del tokens[-1]
    def _strip_trailing_extra_closers(tokens, remove_naked_comma):
        level = 0
        for i in range(len(tokens)):
            if tokens[i].string in "({[":
                level += 1
            elif tokens[i].string in ")}]":
                level -= 1
            if level == 0 and tokens[i].string == "," and remove_naked_comma:
                tokens[:] = tokens[0: i]
                return
            if level < 0:
                tokens[:] = tokens[0: i]
                return
    def _strip_unclosed_brackets(tokens):
        level = 0
        for i in range(len(tokens) - 1, -1, -1):
            if tokens[i].string in "({[":
                level -= 1
            elif tokens[i].string in ")}]":
                level += 1
            if level < 0:
                tokens[:] = tokens[0: i]
                level = 0 # keep going, there may be more unclosed brackets
    def _mark_end_and_return_child_tokens(node, tokens, prelim_end_lineno, prelim_end_col_offset):
        """
        # shortcut
        node.end_lineno = prelim_end_lineno
        node.end_col_offset = prelim_end_col_offset
        return tokens
        """
        # prelim_end_lineno and prelim_end_col_offset are the start of
        # next positioned node or end of source, ie. the suffix of given
        # range may contain keywords, commas and other stuff not belonging to current node
        # Function returns the list of tokens which cover all its children
        if isinstance(node, _ast.stmt):
            # remove empty trailing lines
            while(tokens[-1].type in (tokenize.NL, tokenize.COMMENT, token.NEWLINE, token.INDENT)
                   or tokens[-1].string in (":", "else", "elif", "finally", "except")):
                del tokens[-1]
        else:
            _strip_trailing_extra_closers(tokens, not isinstance(node, ast.Tuple))
            _strip_trailing_junk_from_expressions(tokens)
            _strip_unclosed_brackets(tokens)
        # set the end markers of this node
        node.end_lineno = tokens[-1].end[0]
        node.end_col_offset = tokens[-1].end[1]
        # Peel off some trailing tokens which can't be part any
        # positioned child node.
        # TODO: maybe cleaning from parent side is better than
        # _strip_trailing_junk_from_expressions
        # Remove trailing empty parens from no-arg call
        if (isinstance(node, ast.Call)
            and _tokens_text(tokens[-2:]) == "()"):
            del tokens[-2:]
        # Remove trailing full slice
        elif isinstance(node, ast.Subscript):
            if _tokens_text(tokens[-3:]) == "[:]":
                del tokens[-3:]
            elif _tokens_text(tokens[-4:]) == "[::]":
                del tokens[-4:]
        # Attribute name would confuse the "value" of Attribute
        elif isinstance(node, ast.Attribute):
            assert tokens[-1].type == token.NAME
            del tokens[-1]
            _strip_trailing_junk_from_expressions(tokens)
        return tokens
    ### all_tokens = list(tokenize.tokenize(io.BytesIO(source.encode('utf-8')).readline))
    readline = io.BytesIO(source.encode('utf-8')).readline
    if isPython3:
        all_tokens = list(tokenize.tokenize(readline))
    else:
        all_tokens = []
        def token_eater(t1, t2, t3, t4, t5):
            all_tokens.append(
                Bunch(type=t1, start=(t2, t3), end=(t3, t4), string=t5))
        tokenize.tokenize(readline, token_eater)
    source_lines = source.splitlines(True)
    fix_ast_problems(node, source_lines, all_tokens)
    prelim_end_lineno = len(source_lines)
    prelim_end_col_offset = len(source_lines[len(source_lines) - 1])
    _mark_text_ranges_rec(node, all_tokens, prelim_end_lineno, prelim_end_col_offset)
def _get_ordered_child_nodes(node):
    if isinstance(node, ast.Dict):
        children = []
        for i in range(len(node.keys)):
            children.append(node.keys[i])
            children.append(node.values[i])
        return children
    elif isinstance(node, ast.Call):
        children = [node.func] + node.args
        for kw in node.keywords:
            children.append(kw.value)
        # TODO: take care of Python 3.5 updates (eg. args=[Starred] and keywords)
        if hasattr(node, "starargs") and node.starargs is not None:
            children.append(node.starargs)
        if hasattr(node, "kwargs") and node.kwargs is not None:
            children.append(node.kwargs)
        children.sort(key=lambda x: (x.lineno, x.col_offset))
        return children
    else:
        return ast.iter_child_nodes(node)
def _tokens_text(tokens):
    return "".join([t.string for t in tokens])
def fix_ast_problems(tree, source_lines, tokens):

    # Problem 1:
    # Python parser gives col_offset as offset to its internal UTF-8 byte array
    # I need offsets to chars
    utf8_byte_lines = list(map(lambda line: line.encode("UTF-8"), source_lines))

    # Problem 2:
    # triple-quoted strings have just plain wrong positions: http://bugs.python.org/issue18370
    # Fortunately lexer gives them correct positions
    string_tokens = list(filter(lambda tok: tok.type == token.STRING, tokens))

    # Problem 3:
    # Binary operations have wrong positions: http://bugs.python.org/issue18374
    # Problem 4:
    # Function calls have wrong positions in Python 3.4: http://bugs.python.org/issue21295
    # similar problem is with Attributes and Subscripts

    def fix_node(node):
        for child in _get_ordered_child_nodes(node):
        #for child in ast.iter_child_nodes(node):
            fix_node(child)
        if isinstance(node, ast.Str):
            # fix triple-quote problem
            # get position from tokens
            token = string_tokens.pop(0)
            node.lineno, node.col_offset = token.start
        elif((isinstance(node, ast.Expr) or isinstance(node, ast.Attribute))
            and isinstance(node.value, ast.Str)):
            # they share the wrong offset of their triple-quoted child
            # get position from already fixed child
            # TODO: try whether this works when child is in parentheses
            node.lineno = node.value.lineno
            node.col_offset = node.value.col_offset
        elif(isinstance(node, ast.BinOp)
            and compare_node_positions(node, node.left) > 0):
            # fix binop problem
            # get position from an already fixed child
            node.lineno = node.left.lineno
            node.col_offset = node.left.col_offset
        elif(isinstance(node, ast.Call)
            and compare_node_positions(node, node.func) > 0):
            # Python 3.4 call problem
            # get position from an already fixed child
            node.lineno = node.func.lineno
            node.col_offset = node.func.col_offset
        elif(isinstance(node, ast.Attribute)
            and compare_node_positions(node, node.value) > 0):
            # Python 3.4 attribute problem ...
            node.lineno = node.value.lineno
            node.col_offset = node.value.col_offset
        elif(isinstance(node, ast.Subscript)
            and compare_node_positions(node, node.value) > 0):
            # Python 3.4 Subscript problem ...
            node.lineno = node.value.lineno
            node.col_offset = node.value.col_offset
        else:
            # Let's hope this node has correct lineno, and byte-based col_offset
            # Now compute char-based col_offset
            if hasattr(node, "lineno"):
                byte_line = utf8_byte_lines[node.lineno - 1]
                char_col_offset = len(byte_line[: node.col_offset].decode("UTF-8"))
                node.col_offset = char_col_offset

    fix_node(tree)
def compare_node_positions(n1, n2):
    if n1.lineno > n2.lineno:
        return 1
    elif n1.lineno < n2.lineno:
        return -1
    elif n1.col_offset > n2.col_offset:
        return 1
    elif n2.col_offset < n2.col_offset:
        return -1
    else:
        return 0
