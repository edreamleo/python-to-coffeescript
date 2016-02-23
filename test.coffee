# python_to_coffeescript: Tue 23 Feb 2016 at 10:11:04
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
        # Comment 1.
        __init__: (a) ->
            '''Ctor for InnerClass'''
            if a: # after if
                @a=a
            else: # after else
                pass

            for i in range(10): # after for.
                pass
            else: # after for-else.
                pass

        inner1: ->
            """inner1 docstring"""

    test1: (a) ->
        print(a) # trailing comment

    test2: ->
        pass

eggs = ->
    pass
