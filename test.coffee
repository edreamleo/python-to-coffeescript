# python_to_coffeescript: Tue 23 Feb 2016 at 05:21:24
'''
Test file illustrating difficulties of tokenizing.
At present, multi-line docstrings cause problems.
'''
# lineno: line number of source text (first line is line 1).
# col_offset: the UTF-8 byte offset of the first token that generated the node.
# http://joao.npimentel.net/2015/07/23/python-2-vs-python-3-ast-differences/

a=1+2

spam = ->
    b=2


class TestClass extends object

    do_BinOp: (node) ->
        return '%s%s%s'%(@visit(node.left), @op_name(node.op), @visit(node.right))


    class InnerClass extends object, str
        # Comment.
        __init__: (a) ->
            '''Ctor for InnerClass'''
            @a=a
        inner1: ->
            """inner1 docstring"""

    test1: (a) ->
        # Comment before print statement.
        # Should be a comment on the print line.
        print(a)

    test2: ->
        pass

eggs = ->
    pass
