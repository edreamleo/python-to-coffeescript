# python_to_coffeescript: Mon 22 Feb 2016 at 17:30:04
'''Test file illustrating difficulties of tokenizing.'''
a=1+2

spam = ->
    b=2
# Comment before TestClass.


class TestClass extends object
    # Comment before InnerClass.


    class InnerClass extends object, str
        # Comment.

        __init__: (a) ->
            '''Ctor for InnerClass'''
            @a=a

        inner1: ->
            """inner1 docstring"""

    test1: (a) ->
        # Comment1 before print statement.
        # Comment2 before print statement.
        print(a)

    test2: ->
        pass

eggs = ->
    pass
