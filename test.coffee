# python_to_coffeescript: Mon 22 Feb 2016 at 14:08:26
'''Test file illustrating difficulties of tokenizing.'''
a=1+2

def spam():
    b=2
# Comment before TestClass.

class TestClass:
# Comment before InnerClass.

    class InnerClass:

        def __init__(self):
            '''Ctor for InnerClass'''
            pass

        def inner1(self):
            """inner1 docstring"""

    def test1():
        pass

    def test2():
        pass

def eggs():
    pass
