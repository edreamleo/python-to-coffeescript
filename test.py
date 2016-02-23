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


class TestClass(object):
    
    def do_BinOp(self, node):
        return '%s%s%s' % (
            self.visit(node.left),
            self.op_name(node.op),
            self.visit(node.right))


    class InnerClass(object, str):
        # Comment 1.
        def __init__(self, a):
            '''Ctor for InnerClass'''
            if a: # after if
                self.a = a

            else: # after else
                pass

        def inner1(self):
            """inner1 docstring"""

    def test1(a):
        print(a) # trailing comment

    def test2():
        pass
        
def eggs():
    pass
