'''Test file illustrating difficulties of tokenizing.'''
# lineno: line number of source text (first line is line 1).
# col_offset: the UTF-8 byte offset of the first token that generated the node.
# http://joao.npimentel.net/2015/07/23/python-2-vs-python-3-ast-differences/

a = 1

def spam():
    b = 2
    
class TestClass:
    
    class InnerClass:
        
        def __init__(self):
            pass
            
    def test1():
        pass
        
def eggs():
    pass
