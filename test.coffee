# python_to_coffeescript: Mon 22 Feb 2016 at 04:15:10
'''Test file illustrating difficulties of tokenizing.'''
# lineno: line number of source text (first line is line 1).
# col_offset: the UTF-8 byte offset of the first token that generated the node.
# http://joao.npimentel.net/2015/07/23/python-2-vs-python-3-ast-differences/

a = 1

spam = ->
    b = 2

class TestClass

    class InnerClass

        constructor: ->
            pass

    test1: ->
        pass

eggs = ->
    pass

