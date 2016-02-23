'''
Test file illustrating difficulties of tokenizing.
At present, multi-line docstrings cause problems.
'''
# lineno: line number of source text (first line is line 1).
# col_offset: the UTF-8 byte offset of the first token that generated the node.
# http://joao.npimentel.net/2015/07/23/python-2-vs-python-3-ast-differences/

a = 1\
+2

def spam():
    b = 2
    
# Comment before TestClass.
class TestClass(object):
    
    # Comment before InnerClass.

    class InnerClass(object, str):
        # Comment.
        def __init__(self, a):
            '''Ctor for InnerClass'''
            self.a = a
        def inner1(self):
            """inner1 docstring"""
    def test1(a):
        # Comment1 before print statement.
        # Comment2 before print statement.
        print(a) # comment
    def test2():
        pass
        
def eggs():
    pass
