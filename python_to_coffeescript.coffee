# python_to_coffeescript: Sat 20 Feb 2016 at 10:02:07
'\nThis script makes a coffeescript file for every python source file listed\non the command line (wildcard file names are supported).\n\nFor full details, see README.md.\n\nReleased under the MIT Licence.\n\nWritten by Edward K. Ream.\n'
import ast
import ast_utils
from collections import OrderedDict
try:
    import ConfigParser as configparser
except ImportError:
    import configparser
import glob
import optparse
import os
import sys
import time
try:
    import StringIO as io
except ImportError:
    import io
isPython3=sys.version_info>=(3, 0, 0)

def main():
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    controller=MakeCoffeeScriptController()
    controller.scan_command_line()
    controller.scan_options()
    controller.run()
    print('done')

def dump(title,s=None):
    if s:
        print('===== %s...\n%s\n'%(title, s.rstrip()))
    else:
        print('===== %s...\n'%title)

def dump_dict(title,d):
    '''Dump a dictionary with a header.'''
    dump(title)
    for z in sorted(d):
        print('%30s %s'%(z, d.get(z)))
    print('')

def dump_list(title,aList):
    '''Dump a list with a header.'''
    dump(title)
    for z in aList:
        print(z)
    print('')

def pdb(self):
    '''Invoke a debugger during unit testing.'''
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()

def truncate(s,n):
    '''Return s truncated to n characters.'''
    return s if len(s)<=n else s[:n-3]+'...'


class CoffeeScriptFormatter(object):
    '''A class to convert python sources to coffeescript sources.'''

    def __init__(self,controller):
        '''Ctor for CoffeeScriptFormatter class.'''
        self.controller=controller
        self.first_statement=False
        self.trace_visitors=controller.trace_visitors

    def format(self,node):
        '''Format the node (or list of nodes) and its descendants.'''
        self.level=0
        val=self.visit(node)
        return val or ''

    def indent(self,s):
        '''Return s, properly indented.'''
        assert  not s.startswith('\n'), g.callers()
        return '%s%s'%(' '*4*self.level, s)

    def visit(self,node):
        '''Return the formatted version of an Ast node, or list of Ast nodes.'''
        if self.trace_visitors:
            g.trace(node.__class__.__name__)
        if isinstance(node,(list, tuple)):
            return ', '.join(self.visit(z) for z in node)
        else:
            if node is None:
                return 'None'
            else:
                assert isinstance(node,ast.AST), node.__class__.__name__
                method_name='do_'+node.__class__.__name__
                method=getattr(self,method_name)
                s=method(node)
                assert type(s)==type('abc'), (node, type(s))
                return s

    def do_ClassDef(self,node):
        result=[]
        name=node.name
        bases=self.visit(z) for z in node.bases if node.bases else [] 
        result.append('\n\n')
        if bases:
            result.append(self.indent('class %s(%s):\n'%(name, ', '.join(bases))))
        else:
            result.append(self.indent('class %s:\n'%name))
        for (i, z) in enumerate(node.body):
            self.level+=1
            self.first_statement=i==0
            result.append(self.visit(z))
            self.level-=1
        return ''.join(result)

    def do_FunctionDef(self,node):
        '''Format a FunctionDef node.'''
        result=[]
        if node.decorator_list:
            for z in node.decorator_list:
                result.append(self.indent('@%s\n'%self.visit(z)))
        name=node.name
        args=self.visit(node.args) if node.args else '' 
        result.append('\n')
        result.append(self.indent('def %s(%s):\n'%(name, args)))
        for (i, z) in enumerate(node.body):
            self.level+=1
            self.first_statement=i==0
            result.append(self.visit(z))
            self.level-=1
        return ''.join(result)

    def do_Interactive(self,node):
        for z in node.body:
            self.visit(z)

    def do_Module(self,node):
        return ''.join(self.visit(z) for z in node.body)

    def do_Lambda(self,node):
        return self.indent('lambda %s: %s'%(self.visit(node.args), self.visit(node.body)))

    def do_Expr(self,node):
        '''An outer expression: must be indented.'''
        return self.indent('%s\n'%self.visit(node.value))

    def do_Expression(self,node):
        '''An inner expression: do not indent.'''
        return '%s\n'%self.visit(node.body)

    def do_GeneratorExp(self,node):
        elt=self.visit(node.elt) or ''
        gens=self.visit(z) for z in node.generators
        gens=z if z else '<**None**>'  for z in gens
        return '<gen %s for %s>'%(elt, ','.join(gens))

    def do_AugLoad(self,node):
        return 'AugLoad'

    def do_Del(self,node):
        return 'Del'

    def do_Load(self,node):
        return 'Load'

    def do_Param(self,node):
        return 'Param'

    def do_Store(self,node):
        return 'Store'

    def do_arguments(self,node):
        '''Format the arguments node.'''
        assert isinstance(node,ast.arguments)
        args=self.visit(z) for z in node.args
        defaults=self.visit(z) for z in node.defaults
        args2=[]
        n_plain=len(args)-len(defaults)
        for i in range(len(args)):
            if i<n_plain:
                args2.append(args[i])
            else:
                args2.append('%s=%s'%(args[i], defaults[i-n_plain]))
        name=getattr(node,'vararg',None)
        if name:
            if isPython3 and isinstance(name,ast.arg):
                name=name.arg
            args2.append('*'+name)
        name=getattr(node,'kwarg',None)
        if name:
            if isPython3 and isinstance(name,ast.arg):
                name=name.arg
            args2.append('**'+name)
        return ','.join(args2)

    def do_arg(self,node):
        return node.arg

    def do_Attribute(self,node):
        return '%s.%s'%(self.visit(node.value), node.attr)

    def do_Bytes(self,node):
        return str(node.s)

    def do_Call(self,node):
        func=self.visit(node.func)
        args=self.visit(z) for z in node.args
        for z in node.keywords:
            args.append(self.visit(z))
        if getattr(node,'starargs',None):
            args.append('*%s'%self.visit(node.starargs))
        if getattr(node,'kwargs',None):
            args.append('**%s'%self.visit(node.kwargs))
        args=z for z in args if z
        return '%s(%s)'%(func, ','.join(args))

    def do_keyword(self,node):
        value=self.visit(node.value)
        return '%s=%s'%(node.arg, value)

    def do_comprehension(self,node):
        result=[]
        name=self.visit(node.target)
        it=self.visit(node.iter)
        result.append('%s in %s'%(name, it))
        ifs=self.visit(z) for z in node.ifs
        if ifs:
            result.append(' if %s'%''.join(ifs))
        return ''.join(result)

    def do_Dict(self,node):
        result=[]
        keys=self.visit(z) for z in node.keys
        values=self.visit(z) for z in node.values
        if len(keys)==len(values):
            result.append('{')
            items=[]
            for i in range(len(keys)):
                items.append('%s:%s'%(keys[i], values[i]))
            result.append(', '.join(items))
            result.append('}')
        else:
            print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s'%(repr(keys), repr(values)))
        return ''.join(result)

    def do_Ellipsis(self,node):
        return '...'

    def do_ExtSlice(self,node):
        return ':'.join(self.visit(z) for z in node.dims)

    def do_Index(self,node):
        return self.visit(node.value)

    def do_List(self,node):
        elts=self.visit(z) for z in node.elts
        elst=z for z in elts if z
        return '[%s]'%','.join(elts)

    def do_ListComp(self,node):
        elt=self.visit(node.elt)
        gens=self.visit(z) for z in node.generators
        gens=z if z else '<**None**>'  for z in gens
        return '%s for %s'%(elt, ''.join(gens))

    def do_Name(self,node):
        return node.id

    def do_NameConstant(self,node):
        s=repr(node.value)
        return 'bool' if s in ('True', 'False') else s

    def do_Num(self,node):
        return repr(node.n)

    def do_Repr(self,node):
        return 'repr(%s)'%self.visit(node.value)

    def do_Slice(self,node):
        (lower, upper, step)=('', '', '')
        if getattr(node,'lower',None) is not None:
            lower=self.visit(node.lower)
        if getattr(node,'upper',None) is not None:
            upper=self.visit(node.upper)
        if getattr(node,'step',None) is not None:
            step=self.visit(node.step)
        if step:
            return '%s:%s:%s'%(lower, upper, step)
        else:
            return '%s:%s'%(lower, upper)

    def do_Str(self,node):
        '''A string constant, including docstrings.'''
        docstring=False
        if self.first_statement:
            callers=''.join(z for z in g.callers(2).split(',') if z!='visit')
            docstring=callers.endswith('do_Expr')
        if docstring:
            s=repr(node.s).replace('\\n','\n')
            if s.startswith('"'):
                return '""%s""'%s
            else:
                return "''%s''"%s
        else:
            return repr(node.s)

    def do_Subscript(self,node):
        value=self.visit(node.value)
        the_slice=self.visit(node.slice)
        return '%s[%s]'%(value, the_slice)

    def do_Tuple(self,node):
        elts=self.visit(z) for z in node.elts
        return '(%s)'%', '.join(elts)

    def op_name(self,node,strict=True):
        '''Return the print name of an operator node.'''
        d={'Add':'+', 'BitAnd':'&', 'BitOr':'|', 'BitXor':'^', 'Div':'/', 'FloorDiv':'//', 'LShift':'<<', 'Mod':'%', 'Mult':'*', 'Pow':'**', 'RShift':'>>', 'Sub':'-', 'And':' and ', 'Or':' or ', 'Eq':'==', 'Gt':'>', 'GtE':'>=', 'In':' in ', 'Is':' is ', 'IsNot':' is not ', 'Lt':'<', 'LtE':'<=', 'NotEq':'!=', 'NotIn':' not in ', 'AugLoad':'<AugLoad>', 'AugStore':'<AugStore>', 'Del':'<Del>', 'Load':'<Load>', 'Param':'<Param>', 'Store':'<Store>', 'Invert':'~', 'Not':' not ', 'UAdd':'+', 'USub':'-'}
        kind=node.__class__.__name__
        name=d.get(kind,'<%s>'%kind)
        if strict:
            assert name, kind
        return name

    def do_BinOp(self,node):
        return '%s%s%s'%(self.visit(node.left), self.op_name(node.op), self.visit(node.right))

    def do_BoolOp(self,node):
        op_name=self.op_name(node.op)
        values=self.visit(z) for z in node.values
        return op_name.join(values)

    def do_Compare(self,node):
        result=[]
        lt=self.visit(node.left)
        ops=self.op_name(z) for z in node.ops
        comps=self.visit(z) for z in node.comparators
        result.append(lt)
        if len(ops)==len(comps):
            for i in range(len(ops)):
                result.append('%s%s'%(ops[i], comps[i]))
        else:
            print(('can not happen: ops', repr(ops), 'comparators', repr(comps)))
        return ''.join(result)

    def do_IfExp(self,node):
        return '%s if %s else %s '%(self.visit(node.body), self.visit(node.test), self.visit(node.orelse))

    def do_UnaryOp(self,node):
        return '%s%s'%(self.op_name(node.op), self.visit(node.operand))

    def do_Assert(self,node):
        test=self.visit(node.test)
        if getattr(node,'msg',None):
            message=self.visit(node.msg)
            return self.indent('assert %s, %s\n'%(test, message))
        else:
            return self.indent('assert %s\n'%test)

    def do_Assign(self,node):
        return self.indent('%s=%s\n'%('='.join(self.visit(z) for z in node.targets), self.visit(node.value)))

    def do_AugAssign(self,node):
        return self.indent('%s%s=%s\n'%(self.visit(node.target), self.op_name(node.op), self.visit(node.value)))

    def do_Break(self,node):
        return self.indent('break\n')

    def do_Continue(self,node):
        return self.indent('continue\n')

    def do_Delete(self,node):
        targets=self.visit(z) for z in node.targets
        return self.indent('del %s\n'%','.join(targets))

    def do_ExceptHandler(self,node):
        result=[]
        result.append(self.indent('except'))
        if getattr(node,'type',None):
            result.append(' %s'%self.visit(node.type))
        if getattr(node,'name',None):
            if isinstance(node.name,ast.AST):
                result.append(' as %s'%self.visit(node.name))
            else:
                result.append(' as %s'%node.name)
        result.append(':\n')
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        return ''.join(result)

    def do_Exec(self,node):
        body=self.visit(node.body)
        args=[]
        if getattr(node,'globals',None):
            args.append(self.visit(node.globals))
        if getattr(node,'locals',None):
            args.append(self.visit(node.locals))
        if args:
            return self.indent('exec %s in %s\n'%(body, ','.join(args)))
        else:
            return self.indent('exec %s\n'%body)

    def do_For(self,node):
        result=[]
        result.append(self.indent('for %s in %s:\n'%(self.visit(node.target), self.visit(node.iter))))
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level+=1
                result.append(self.visit(z))
                self.level-=1
        return ''.join(result)

    def do_Global(self,node):
        return self.indent('global %s\n'%','.join(node.names))

    def do_If(self,node):
        result=[]
        result.append(self.indent('if %s:\n'%self.visit(node.test)))
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level+=1
                result.append(self.visit(z))
                self.level-=1
        return ''.join(result)

    def do_Import(self,node):
        names=[]
        for (fn, asname) in self.get_import_names(node):
            if asname:
                names.append('%s as %s'%(fn, asname))
            else:
                names.append(fn)
        return self.indent('import %s\n'%','.join(names))

    def get_import_names(self,node):
        '''Return a list of the the full file names in the import statement.'''
        result=[]
        for ast2 in node.names:
            assert isinstance(ast2,ast.alias)
            data=(ast2.name, ast2.asname)
            result.append(data)
        return result

    def do_ImportFrom(self,node):
        names=[]
        for (fn, asname) in self.get_import_names(node):
            if asname:
                names.append('%s as %s'%(fn, asname))
            else:
                names.append(fn)
        return self.indent('from %s import %s\n'%(node.module, ','.join(names)))

    def do_Pass(self,node):
        return self.indent('pass\n')

    def do_Print(self,node):
        vals=[]
        for z in node.values:
            vals.append(self.visit(z))
        if getattr(node,'dest',None):
            vals.append('dest=%s'%self.visit(node.dest))
        if getattr(node,'nl',None):
            if node.nl=='False':
                vals.append('nl=%s'%node.nl)
        return self.indent('print(%s)\n'%','.join(vals))

    def do_Raise(self,node):
        args=[]
        for attr in ('type', 'inst', 'tback'):
            if getattr(node,attr,None) is not None:
                args.append(self.visit(getattr(node,attr)))
        if args:
            return self.indent('raise %s\n'%','.join(args))
        else:
            return self.indent('raise\n')

    def do_Return(self,node):
        if node.value:
            return self.indent('return %s\n'%self.visit(node.value).strip())
        else:
            return self.indent('return\n')

    def do_Try(self,node):
        result=[]
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        if node.handlers:
            for z in node.handlers:
                result.append(self.visit(z))
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level+=1
                result.append(self.visit(z))
                self.level-=1
        if node.finalbody:
            result.append(self.indent('finally:\n'))
            for z in node.finalbody:
                self.level+=1
                result.append(self.visit(z))
                self.level-=1
        return ''.join(result)

    def do_TryExcept(self,node):
        result=[]
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        if node.handlers:
            for z in node.handlers:
                result.append(self.visit(z))
        if node.orelse:
            result.append('else:\n')
            for z in node.orelse:
                self.level+=1
                result.append(self.visit(z))
                self.level-=1
        return ''.join(result)

    def do_TryFinally(self,node):
        result=[]
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        result.append(self.indent('finally:\n'))
        for z in node.finalbody:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        return ''.join(result)

    def do_While(self,node):
        result=[]
        result.append(self.indent('while %s:\n'%self.visit(node.test)))
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        if node.orelse:
            result.append('else:\n')
            for z in node.orelse:
                self.level+=1
                result.append(self.visit(z))
                self.level-=1
        return ''.join(result)

    def do_With(self,node):
        result=[]
        result.append(self.indent('with '))
        if hasattr(node,'context_expression'):
            result.append(self.visit(node.context_expresssion))
        vars_list=[]
        if hasattr(node,'optional_vars'):
            try:
                for z in node.optional_vars:
                    vars_list.append(self.visit(z))
            except TypeError:
                vars_list.append(self.visit(node.optional_vars))
        result.append(','.join(vars_list))
        result.append(':\n')
        for z in node.body:
            self.level+=1
            result.append(self.visit(z))
            self.level-=1
        result.append('\n')
        return ''.join(result)

    def do_Yield(self,node):
        if getattr(node,'value',None):
            return self.indent('yield %s\n'%self.visit(node.value))
        else:
            return self.indent('yield\n')


class LeoGlobals(object):
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''


    class NullObject:
        '''
        An object that does nothing, and does it very well.
        From the Python cookbook, recipe 5.23
        '''

        def __init__(self,*args,**keys):
            pass

        def __call__(self,*args,**keys):
            return self

        def __repr__(self):
            return 'NullObject'

        def __str__(self):
            return 'NullObject'

        def __bool__(self):
            return False

        def __nonzero__(self):
            return 0

        def __delattr__(self,attr):
            return self

        def __getattr__(self,attr):
            return self

        def __setattr__(self,attr,val):
            return self

    def _callerName(self,n=1,files=False):
        try:
            f1=sys._getframe(n)
            code1=f1.f_code
            name=code1.co_name
            if name=='__init__':
                name='__init__(%s,line %s)'%(self.shortFileName(code1.co_filename), code1.co_firstlineno)
            if files:
                return '%s:%s'%(self.shortFileName(code1.co_filename), name)
            else:
                return name
        except ValueError:
            return ''
        except Exception:
            return ''

    def callers(self,n=4,count=0,excludeCaller=True,files=False):
        '''Return a list containing the callers of the function that called g.callerList.

        If the excludeCaller keyword is True (the default), g.callers is not on the list.

        If the files keyword argument is True, filenames are included in the list.
        '''
        result=[]
        i=3 if excludeCaller else 2 
        while 1:
            s=self._callerName(i,files=files)
            if s:
                result.append(s)
            if  not s or len(result)>=n:
                break
            i+=1
        result.reverse()
        if count>0:
            result=result[:count]
        sep='\n' if files else ',' 
        return sep.join(result)

    def cls(self):
        '''Clear the screen.'''
        if sys.platform.lower().startswith('win'):
            os.system('cls')

    def pdb(self):
        try:
            import leo.core.leoGlobals as leo_g
            leo_g.pdb()
        except ImportError:
            import pdb
            pdb.set_trace()

    def shortFileName(self,fileName,n=None):
        if n is None or n<1:
            return os.path.basename(fileName)
        else:
            return '/'.join(fileName.replace('\\','/').split('/')[-n:])

    def splitLines(self,s):
        '''Split s into lines, preserving trailing newlines.'''
        return s.splitlines(True) if s else []

    def trace(self,*args,**keys):
        try:
            import leo.core.leoGlobals as leo_g
            leo_g.trace(caller_level=2,*args,**keys)
        except ImportError:
            print((args, keys))


class MakeCoffeeScriptController(object):
    '''The controller class for python_to_coffeescript.py.'''

    def __init__(self):
        '''Ctor for MakeCoffeeScriptController class.'''
        self.options={}
        self.config_fn=None
        self.enable_unit_tests=False
        self.files=[]
        self.section_names=('Global')
        self.output_directory=self.finalize('.')
        self.overwrite=False
        self.trace_visitors=False
        self.update_flag=False
        self.verbose=False

    def finalize(self,fn):
        '''Finalize and regularize a filename.'''
        fn=os.path.expanduser(fn)
        fn=os.path.abspath(fn)
        fn=os.path.normpath(fn)
        return fn

    def make_coffeescript_file(self,fn):
        '''
        Make a stub file in the output directory for all source files mentioned
        in the [Source Files] section of the configuration file.
        '''
        if  not fn.endswith('.py'):
            print(('not a python file', fn))
            return
        if  not os.path.exists(fn):
            print(('not found', fn))
            return
        base_fn=os.path.basename(fn)
        out_fn=os.path.join(self.output_directory,base_fn)
        out_fn=os.path.normpath(out_fn)
        out_fn=out_fn[:-3]+'.coffee'
        dir_=os.path.dirname(out_fn)
        if os.path.exists(out_fn) and  not self.overwrite:
            print('file exists: %s'%out_fn)
        else:
            if  not dir_ or os.path.exists(dir_):
                t1=time.clock()
                s=open(fn).read()
                node=ast.parse(s,filename=fn,mode='exec')
                s=CoffeeScriptFormatter(controller=self).format(node)
                f=open(out_fn,'w')
                self.output_time_stamp(f)
                f.write(s)
                f.close()
                print('wrote: %s'%out_fn)
            else:
                print('output directory not not found: %s'%dir_)

    def output_time_stamp(self,f):
        '''Put a time-stamp in the output file f.'''
        f.write('# python_to_coffeescript: %s\n'%time.strftime('%a %d %b %Y at %H:%M:%S'))

    def run(self):
        '''
        Make stub files for all files.
        Do nothing if the output directory does not exist.
        '''
        if self.enable_unit_tests:
            self.run_all_unit_tests()
        if self.files:
            dir_=self.output_directory
            if dir_:
                if os.path.exists(dir_):
                    for fn in self.files:
                        self.make_coffeescript_file(fn)
                else:
                    print('output directory not found: %s'%dir_)
            else:
                print('no output directory')
        else:
            if  not self.enable_unit_tests:
                print('no input files')

    def run_all_unit_tests(self):
        '''Run all unit tests in the python-to-coffeescript/test directory.'''
        import unittest
        loader=unittest.TestLoader()
        suite=loader.discover(os.path.abspath('.'),pattern='test*.py',top_level_dir=None)
        unittest.TextTestRunner(verbosity=1).run(suite)

    def scan_command_line(self):
        '''Set ivars from command-line arguments.'''
        usage='usage: python_to_coffeescript.py [options] file1, file2, ...'
        parser=optparse.OptionParser(usage=usage)
        add=parser.add_option
        add('-c','--config',dest='fn',help='full path to configuration file')
        add('-d','--dir',dest='dir',help='full path to the output directory')
        add('-o','--overwrite',action='store_true',default=False,help='overwrite existing .coffee files')
        add('-t','--test',action='store_true',default=False,help='run unit tests on startup')
        add('--trace-visitors',action='store_true',default=False,help='trace visitor methods')
        add('-v','--verbose',action='store_true',default=False,help='verbose output')
        (options, args)=parser.parse_args()
        self.enable_unit_tests=options.test
        self.overwrite=options.overwrite
        self.trace_visitors=options.trace_visitors
        if options.fn:
            self.config_fn=options.fn
        if options.dir:
            dir_=options.dir
            dir_=self.finalize(dir_)
            if os.path.exists(dir_):
                self.output_directory=dir_
            else:
                print('--dir: directory does not exist: %s'%dir_)
                print('exiting')
                sys.exit(1)
        if args:
            args=self.finalize(z) for z in args
            if args:
                self.files=args

    def scan_options(self):
        '''Set all configuration-related ivars.'''
        trace=False
        if  not self.config_fn:
            return
        self.parser=parser=self.create_parser()
        s=self.get_config_string()
        self.init_parser(s)
        if self.files:
            files_source='command-line'
            files=self.files
        else:
            if parser.has_section('Global'):
                files_source='config file'
                files=parser.get('Global','files')
                files=z.strip() for z in files.split('\n') if z.strip()
            else:
                return
        files2=[]
        for z in files:
            files2.extend(glob.glob(self.finalize(z)))
        self.files=z for z in files2 if z and os.path.exists(z)
        if trace:
            print('Files (from %s)...\n'%files_source)
            for z in self.files:
                print(z)
            print('')
        if 'output_directory' in parser.options('Global'):
            s=parser.get('Global','output_directory')
            output_dir=self.finalize(s)
            if os.path.exists(output_dir):
                self.output_directory=output_dir
                if self.verbose:
                    print('output directory: %s\n'%output_dir)
            else:
                print('output directory not found: %s\n'%output_dir)
                self.output_directory=None
        if 'prefix_lines' in parser.options('Global'):
            prefix=parser.get('Global','prefix_lines')
            self.prefix_lines=prefix.split('\n')
            if trace:
                print('Prefix lines...\n')
                for z in self.prefix_lines:
                    print(z)
                print('')

    def create_parser(self):
        '''Create a RawConfigParser and return it.'''
        parser=configparser.RawConfigParser(dict_type=OrderedDict)
        parser.optionxform=str
        return parser

    def get_config_string(self):
        fn=self.finalize(self.config_fn)
        if os.path.exists(fn):
            if self.verbose:
                print('\nconfiguration file: %s\n'%fn)
            f=open(fn,'r')
            s=f.read()
            f.close()
            return s
        else:
            print('\nconfiguration file not found: %s'%fn)
            return ''

    def init_parser(self,s):
        """Add double back-slashes to all patterns starting with '['."""
        trace=False
        if  not s:
            return
        aList=[]
        for s in s.split('\n'):
            if self.is_section_name(s):
                aList.append(s)
            else:
                if s.strip().startswith('['):
                    aList.append('\\\\'+s[1:])
                    if trace:
                        g.trace('*** escaping:',s)
                else:
                    aList.append(s)
        s='\n'.join(aList)+'\n'
        if trace:
            g.trace(s)
        file_object=io.StringIO(s)
        self.parser.readfp(file_object)

    def is_section_name(self,s):

        def munge(s):
            return s.strip().lower().replace(' ','')
        s=s.strip()
        if s.startswith('[') and s.endswith(']'):
            s=munge(s[1:-1])
            for s2 in self.section_names:
                if s==munge(s2):
                    return True
        return False


class TestClass(object):
    '''
    A class containing constructs that have caused difficulties.
    This is in the make_stub_files directory, not the test directory.
    '''

    def parse_group(group):
        if len(group)>=3 and group[-2]=='as':
            del group[-2:]
        ndots=0
        i=0
        while len(group)>i and group[i].startswith('.'):
            ndots+=len(group[i])
            i+=1
        assert ''.join(group[:i])=='.'*ndots, group
        del group[:i]
        assert all(<gen g=='.' for g in group[1::2]>), group
        return (ndots, os.sep.join(group[::2]))

    def return_all(self):
        return all(is_known_type(z) for z in s3.split(','))

    def return_array():
        return f(s[1:-1])

    def return_list(self,a):
        return [a]

    def return_two_lists(s):
        if 1:
            return aList
        else:
            return list(self.regex.finditer(s))
g=LeoGlobals()
if __name__=='__main__':
    main()
