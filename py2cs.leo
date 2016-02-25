<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<?xml-stylesheet ekr_test ?>
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20160220051058.1"><vh>Startup</vh>
<v t="ekr.20160220051359.1"><vh>@settings</vh>
<v t="ekr.20160220051359.2"><vh>@data history-list</vh></v>
<v t="ekr.20160220051359.4"><vh>@bool preload-find-pattern = False</vh></v>
</v>
<v t="ekr.20160220051417.1"><vh>Scripts</vh>
<v t="ekr.20160220051417.2"><vh>@button write-unit-tests</vh>
<v t="ekr.20160220051417.3"><vh>&lt;&lt; docstring &gt;&gt; (write-unit-tests)</vh></v>
<v t="ekr.20160220051417.4"><vh>class TestWriter</vh>
<v t="ekr.20160220051417.5"><vh>&lt;&lt; define file_template &gt;&gt;</vh></v>
<v t="ekr.20160220051417.6"><vh>&lt;&lt; define test_template &gt;&gt;</vh></v>
<v t="ekr.20160220051417.7"><vh> ctor</vh></v>
<v t="ekr.20160220051417.8"><vh>clean</vh></v>
<v t="ekr.20160220051417.9"><vh>get_body</vh></v>
<v t="ekr.20160220051417.10"><vh>run</vh></v>
<v t="ekr.20160220051417.11"><vh>plural</vh></v>
<v t="ekr.20160220051417.12"><vh>test</vh></v>
<v t="ekr.20160220051417.13"><vh>write_file</vh></v>
</v>
</v>
<v t="ekr.20160220051417.14"><vh>@button check-leading-lines</vh></v>
</v>
<v t="ekr.20160220051105.1"><vh>@ignore Unused</vh>
<v t="ekr.20160220103223.1"><vh>class CoffeeScriptTokenizer</vh>
<v t="ekr.20160220103223.2"><vh>class OutputToken</vh></v>
<v t="ekr.20160221024549.1"><vh>class StateStack</vh>
<v t="ekr.20160220175541.1"><vh>ss.get</vh></v>
<v t="ekr.20160220151109.1"><vh>ss.has</vh></v>
<v t="ekr.20160221025511.1"><vh>ss.pop</vh></v>
<v t="ekr.20160220103223.40"><vh>ss.push</vh></v>
<v t="ekr.20160220174952.1"><vh>ss.remove</vh></v>
</v>
<v t="ekr.20160220103223.4"><vh> ct.ctor</vh></v>
<v t="ekr.20160220103223.7"><vh> ct.format</vh></v>
<v t="ekr.20160220103223.8"><vh>ct.Input token Handlers</vh>
<v t="ekr.20160220103223.9"><vh>ct.do_comment</vh></v>
<v t="ekr.20160220103223.10"><vh>ct.do_endmarker</vh></v>
<v t="ekr.20160220103223.11"><vh>ct.do_errortoken</vh></v>
<v t="ekr.20160220103223.12"><vh>ct.do_indent &amp; do_dedent</vh></v>
<v t="ekr.20160220103223.13"><vh>ct.do_name</vh></v>
<v t="ekr.20160220103223.14"><vh>ct.do_newline</vh></v>
<v t="ekr.20160220103223.15"><vh>ct.do_nl</vh></v>
<v t="ekr.20160220103223.16"><vh>ct.do_number</vh></v>
<v t="ekr.20160220103223.17"><vh>ct.do_op</vh></v>
<v t="ekr.20160220103223.18"><vh>ct.do_string</vh></v>
</v>
<v t="ekr.20160220103223.19"><vh>ct.Output token generators</vh>
<v t="ekr.20160220103223.20"><vh>ct.add_token</vh></v>
<v t="ekr.20160220103223.25"><vh>ct.clean</vh></v>
<v t="ekr.20160220103223.26"><vh>ct.clean_blank_lines</vh></v>
<v t="ekr.20160220152030.1"><vh>ct.gen_at</vh></v>
<v t="ekr.20160220103223.22"><vh>ct.gen_backslash</vh></v>
<v t="ekr.20160220103223.23"><vh>ct.gen_blank</vh></v>
<v t="ekr.20160220103223.24"><vh>ct.gen_blank_lines</vh></v>
<v t="ekr.20160220143251.1"><vh>ct.gen_class_or_def</vh></v>
<v t="ekr.20160220143853.1"><vh>ct.gen_close_paren</vh></v>
<v t="ekr.20160220143629.1"><vh>ct.gen_colon</vh></v>
<v t="ekr.20160220160809.1"><vh>ct.gen_comma</vh></v>
<v t="ekr.20160220103223.27"><vh>ct.gen_file_start &amp; gen_file_end</vh></v>
<v t="ekr.20160220144848.1"><vh>ct.gen_import</vh></v>
<v t="ekr.20160220103223.28"><vh>ct.gen_line_indent</vh></v>
<v t="ekr.20160220103223.29"><vh>ct.gen_line_start &amp; gen_line_end</vh></v>
<v t="ekr.20160220103223.30"><vh>ct.gen_lt &amp; gen_rt</vh></v>
<v t="ekr.20160220103223.31"><vh>ct.gen_op*</vh></v>
<v t="ekr.20160220143842.1"><vh>ct.gen_open_paren</vh></v>
<v t="ekr.20160220151922.1"><vh>ct.gen_period</vh></v>
<v t="ekr.20160220103223.32"><vh>ct.gen_possible_unary_op &amp; gen_unary_op</vh></v>
<v t="ekr.20160220151729.1"><vh>ct.gen_self</vh></v>
<v t="ekr.20160220103223.33"><vh>ct.gen_star_op</vh></v>
<v t="ekr.20160220103223.34"><vh>ct.gen_star_star_op</vh></v>
<v t="ekr.20160220103223.35"><vh>ct.gen_word &amp; gen_word_op</vh></v>
</v>
</v>
<v t="ekr.20160224082000.1"><vh>old tokens_for_statement stuff</vh>
<v t="ekr.20160224082013.1"><vh>OLD cv.visit</vh></v>
<v t="ekr.20160224073722.1"><vh>OLD ts.tokens_for_statement &amp; helpers</vh>
<v t="ekr.20160224050441.16"><vh> ts.get_import_names</vh></v>
<v t="ekr.20160224065148.2"><vh>cv.ClassDef</vh></v>
<v t="ekr.20160224065148.3"><vh>cv.FunctionDef</vh></v>
<v t="ekr.20160224065148.6"><vh>cv.Lambda</vh></v>
<v t="ekr.20160224065148.5"><vh>cv.Module</vh></v>
<v t="ekr.20160224050441.3"><vh>ts.Assert</vh></v>
<v t="ekr.20160224050441.4"><vh>ts.Assign</vh></v>
<v t="ekr.20160224050441.5"><vh>ts.AugAssign</vh></v>
<v t="ekr.20160224050441.6"><vh>ts.Break</vh></v>
<v t="ekr.20160224050441.7"><vh>ts.Continue</vh></v>
<v t="ekr.20160224050441.8"><vh>ts.Delete</vh></v>
<v t="ekr.20160224050441.9"><vh>ts.ExceptHandler</vh></v>
<v t="ekr.20160224050441.10"><vh>ts.Exec</vh></v>
<v t="ekr.20160224050441.11"><vh>ts.Expr</vh></v>
<v t="ekr.20160224050441.12"><vh>ts.For</vh></v>
<v t="ekr.20160224050441.13"><vh>ts.Global</vh></v>
<v t="ekr.20160224050441.14"><vh>ts.If</vh></v>
<v t="ekr.20160224050441.15"><vh>ts.Import</vh></v>
<v t="ekr.20160224050441.17"><vh>ts.ImportFrom</vh></v>
<v t="ekr.20160224050441.18"><vh>ts.Pass</vh></v>
<v t="ekr.20160224050441.19"><vh>ts.Print</vh></v>
<v t="ekr.20160224050441.20"><vh>ts.Raise</vh></v>
<v t="ekr.20160224050441.21"><vh>ts.Return</vh></v>
<v t="ekr.20160224050441.22"><vh>ts.Try</vh></v>
<v t="ekr.20160224050441.23"><vh>ts.TryExcept</vh></v>
<v t="ekr.20160224050441.24"><vh>ts.TryFinally</vh></v>
<v t="ekr.20160224050441.25"><vh>ts.While</vh></v>
<v t="ekr.20160224050441.26"><vh>ts.With</vh></v>
<v t="ekr.20160224050441.27"><vh>ts.Yield</vh></v>
</v>
</v>
</v>
</v>
<v t="ekr.20160225122323.1"><vh>Testing</vh>
<v t="ekr.20160220050433.188"><vh>class TestClass</vh>
<v t="ekr.20160220050433.189"><vh>parse_group (Guido)</vh></v>
<v t="ekr.20160220050433.190"><vh>return_all</vh></v>
<v t="ekr.20160220050433.191"><vh>return_array</vh></v>
<v t="ekr.20160220050433.192"><vh>return_list</vh></v>
<v t="ekr.20160220050433.193"><vh>return_two_lists (fails)</vh></v>
</v>
<v t="ekr.20160223132554.1"><vh>deleted test</vh></v>
<v t="ekr.20160223132520.1"><vh>@@clean test.py</vh></v>
<v t="ekr.20160222023117.1"><vh>@clean test.py</vh></v>
</v>
<v t="ekr.20160220050321.1"><vh>@clean py2cs.py</vh>
<v t="ekr.20160220050745.1"><vh>  &lt;&lt; license &gt;&gt; (python_to_coffeescript.py)</vh></v>
<v t="ekr.20160220050433.2"><vh>  &lt;&lt; imports &gt;&gt; (python_to_coffeescript.py)</vh></v>
<v t="ekr.20160220050433.11"><vh>  main</vh></v>
<v t="ekr.20160220050433.7"><vh>  utility functions</vh>
<v t="ekr.20160220050433.8"><vh>dump</vh></v>
<v t="ekr.20160220050433.9"><vh>dump_dict</vh></v>
<v t="ekr.20160220050433.10"><vh>dump_list</vh></v>
<v t="ekr.20160224052722.1"><vh>op_name</vh></v>
<v t="ekr.20160220050433.12"><vh>pdb</vh></v>
<v t="ekr.20160220050433.13"><vh>truncate</vh></v>
</v>
<v t="ekr.20160220050433.14"><vh>class CoffeeScriptTraverser</vh>
<v t="ekr.20160222091458.1"><vh> cv.ctor</vh></v>
<v t="ekr.20160220050433.16"><vh> cv.format</vh></v>
<v t="ekr.20160220050433.82"><vh> cv.indent</vh></v>
<v t="ekr.20160220050433.17"><vh> cv.visit</vh></v>
<v t="ekr.20160220050433.18"><vh>cv.Contexts</vh>
<v t="ekr.20160220050433.19"><vh>cv.ClassDef</vh></v>
<v t="ekr.20160220050433.20"><vh>cv.FunctionDef</vh></v>
<v t="ekr.20160220050433.21"><vh>cv.Interactive</vh></v>
<v t="ekr.20160220050433.22"><vh>cv.Module</vh></v>
<v t="ekr.20160220050433.23"><vh>cv.Lambda</vh></v>
</v>
<v t="ekr.20160220050433.24"><vh>cv.Expressions</vh>
<v t="ekr.20160220050433.26"><vh>cv.Expression</vh></v>
<v t="ekr.20160220050433.27"><vh>cv.GeneratorExp</vh></v>
</v>
<v t="ekr.20160220050433.29"><vh>cv.Operands</vh>
<v t="ekr.20160220050433.30"><vh>cv.arguments</vh></v>
<v t="ekr.20160220050433.31"><vh>cv.arg (Python3 only)</vh></v>
<v t="ekr.20160220050433.32"><vh>cv.Attribute</vh></v>
<v t="ekr.20160220050433.33"><vh>cv.Bytes</vh></v>
<v t="ekr.20160220050433.34"><vh>cv.Call &amp; cv.keyword</vh>
<v t="ekr.20160220050433.35"><vh>cv.keyword</vh></v>
</v>
<v t="ekr.20160220050433.36"><vh>cv.comprehension</vh></v>
<v t="ekr.20160220050433.37"><vh>cv.Dict</vh></v>
<v t="ekr.20160220050433.38"><vh>cv.Ellipsis</vh></v>
<v t="ekr.20160220050433.39"><vh>cv.ExtSlice</vh></v>
<v t="ekr.20160220050433.40"><vh>cv.Index</vh></v>
<v t="ekr.20160220050433.41"><vh>cv.List</vh></v>
<v t="ekr.20160220050433.42"><vh>cv.ListComp</vh></v>
<v t="ekr.20160220050433.43"><vh>cv.Name &amp; cv.NameConstant</vh></v>
<v t="ekr.20160220050433.44"><vh>cv.Num</vh></v>
<v t="ekr.20160220050433.45"><vh>cv.Repr</vh></v>
<v t="ekr.20160220050433.46"><vh>cv.Slice</vh></v>
<v t="ekr.20160220050433.47"><vh>cv.Str</vh></v>
<v t="ekr.20160220050433.48"><vh>cv.Subscript</vh></v>
<v t="ekr.20160220050433.49"><vh>cv.Tuple</vh></v>
</v>
<v t="ekr.20160220050433.50"><vh>cv.Operators</vh>
<v t="ekr.20160220050433.51"><vh>cv.BinOp</vh></v>
<v t="ekr.20160220050433.52"><vh>cv.BoolOp</vh></v>
<v t="ekr.20160220050433.53"><vh>cv.Compare</vh></v>
<v t="ekr.20160220050433.55"><vh>cv.ifExp (ternary operator)</vh></v>
<v t="ekr.20160220050433.54"><vh>cv.UnaryOp</vh></v>
</v>
<v t="ekr.20160220050433.56"><vh>cv.Statements</vh>
<v t="ekr.20160223095542.1"><vh> cv.tail_after_body</vh></v>
<v t="ekr.20160220050433.57"><vh>cv.Assert</vh></v>
<v t="ekr.20160220050433.58"><vh>cv.Assign</vh></v>
<v t="ekr.20160220050433.59"><vh>cv.AugAssign</vh></v>
<v t="ekr.20160220050433.60"><vh>cv.Break</vh></v>
<v t="ekr.20160220050433.61"><vh>cv.Continue</vh></v>
<v t="ekr.20160220050433.62"><vh>cv.Delete</vh></v>
<v t="ekr.20160220050433.63"><vh>cv.ExceptHandler</vh></v>
<v t="ekr.20160220050433.64"><vh>cv.Exec</vh></v>
<v t="ekr.20160220050433.25"><vh>cv.Expr (outer statement)</vh></v>
<v t="ekr.20160220050433.65"><vh>cv.For</vh></v>
<v t="ekr.20160220050433.66"><vh>cv.Global</vh></v>
<v t="ekr.20160220050433.67"><vh>cv.If</vh></v>
<v t="ekr.20160220050433.68"><vh>cv.Import &amp; helper</vh>
<v t="ekr.20160220050433.69"><vh>cv.get_import_names</vh></v>
</v>
<v t="ekr.20160220050433.70"><vh>cv.ImportFrom</vh></v>
<v t="ekr.20160220050433.71"><vh>cv.Pass</vh></v>
<v t="ekr.20160220050433.72"><vh>cv.Print</vh></v>
<v t="ekr.20160220050433.73"><vh>cv.Raise</vh></v>
<v t="ekr.20160220050433.74"><vh>cv.Return</vh></v>
<v t="ekr.20160220094909.1"><vh>cv.Try</vh></v>
<v t="ekr.20160220050433.75"><vh>cv.TryExcept</vh></v>
<v t="ekr.20160220050433.76"><vh>cv.TryFinally</vh></v>
<v t="ekr.20160220050433.77"><vh>cv.While</vh></v>
<v t="ekr.20160220050433.78"><vh>cv.With</vh></v>
<v t="ekr.20160220050433.79"><vh>cv.Yield</vh></v>
</v>
</v>
<v t="ekr.20160220050433.86"><vh>class LeoGlobals</vh>
<v t="ekr.20160220050433.87"><vh>class NullObject (Python Cookbook)</vh></v>
<v t="ekr.20160220110252.1"><vh>class ReadLinesClass</vh></v>
<v t="ekr.20160220050433.88"><vh>g._callerName</vh></v>
<v t="ekr.20160220050433.89"><vh>g.callers</vh></v>
<v t="ekr.20160220050433.90"><vh>g.cls</vh></v>
<v t="ekr.20160220104316.1"><vh>g.computeLeadingWhitespace</vh></v>
<v t="ekr.20160220105138.1"><vh>g.computeLeadingWhitespaceWidth</vh></v>
<v t="ekr.20160220104209.1"><vh>g.isString &amp; isUnicode</vh></v>
<v t="ekr.20160220050433.91"><vh>g.pdb</vh></v>
<v t="ekr.20160220050433.92"><vh>g.shortFileName</vh></v>
<v t="ekr.20160220050433.93"><vh>g.splitLines</vh></v>
<v t="ekr.20160220104523.1"><vh>g.toUnicode</vh></v>
<v t="ekr.20160220050433.94"><vh>g.trace</vh></v>
<v t="ekr.20160220104732.1"><vh>g.u &amp; g.ue</vh></v>
</v>
<v t="ekr.20160220050433.118"><vh>class MakeCoffeeScriptController</vh>
<v t="ekr.20160220050433.119"><vh>mcs.ctor</vh></v>
<v t="ekr.20160220050433.120"><vh>mcs.finalize</vh></v>
<v t="ekr.20160220050433.121"><vh>mcs.make_coffeescript_file</vh></v>
<v t="ekr.20160220055816.3"><vh>mcs.output_time_stamp</vh></v>
<v t="ekr.20160220050433.122"><vh>mcs.run</vh></v>
<v t="ekr.20160220050433.123"><vh>mcs.run_all_unit_tests</vh></v>
<v t="ekr.20160220050433.124"><vh>mcs.scan_command_line</vh></v>
<v t="ekr.20160220050433.125"><vh>mcs.scan_options &amp; helpers</vh>
<v t="ekr.20160220050433.127"><vh>mcs.create_parser</vh></v>
<v t="ekr.20160220050433.129"><vh>mcs.get_config_string</vh></v>
<v t="ekr.20160220050433.130"><vh>mcs.init_parser</vh></v>
<v t="ekr.20160220050433.131"><vh>mcs.is_section_name</vh></v>
</v>
</v>
<v t="ekr.20160220103223.3"><vh>class ParseState</vh></v>
<v t="ekr.20160221143000.1"><vh>class TokenSync</vh>
<v t="ekr.20160221143402.1"><vh> ts.ctor &amp; helpers</vh>
<v t="ekr.20160223023354.1"><vh>ts.make_blank_lines</vh></v>
<v t="ekr.20160222130449.1"><vh>ts.make_ignored_lines</vh></v>
<v t="ekr.20160222084258.1"><vh>ts.make_line_tokens (trace tokens)</vh></v>
<v t="ekr.20160223031552.1"><vh>ts.make_nl_token</vh></v>
<v t="ekr.20160222084401.1"><vh>ts.make_string_tokens</vh></v>
</v>
<v t="ekr.20160225071548.1"><vh>ts.check_strings</vh></v>
<v t="ekr.20160223013055.1"><vh>ts.dump_token</vh></v>
<v t="ekr.20160223022613.1"><vh>ts.is_line_comment</vh></v>
<v t="ekr.20160224053149.1"><vh>ts.join</vh></v>
<v t="ekr.20160223093155.1"><vh>ts.last_node</vh></v>
<v t="ekr.20160222132448.1"><vh>ts.leading_lines</vh></v>
<v t="ekr.20160223043329.1"><vh>ts.leading_string</vh></v>
<v t="ekr.20160222081027.1"><vh>ts.line_at</vh></v>
<v t="ekr.20160222091644.1"><vh>ts.sync_string</vh></v>
<v t="ekr.20160222124401.1"><vh>ts.token_kind/raw_val/val</vh></v>
<v t="ekr.20160224044823.1"><vh>ts.tokens_for_statement</vh></v>
<v t="ekr.20160223042247.1"><vh>ts.trailing_comment</vh></v>
<v t="ekr.20160223061445.1"><vh>ts.trailing_comment_at_lineno</vh></v>
<v t="ekr.20160223102112.1"><vh>ts.trailing_lines</vh></v>
</v>
</v>
<v t="ekr.20160220050053.2"><vh>@clean README.md</vh>
<v t="ekr.20160221071334.1"><vh>Overview</vh></v>
<v t="ekr.20160221071354.1"><vh>Rationale</vh></v>
<v t="ekr.20160221070924.1"><vh>Quick start</vh></v>
<v t="ekr.20160221071222.1"><vh>Command-line arguments</vh></v>
<v t="ekr.20160221071735.1"><vh>Summary</vh></v>
</v>
<v t="ekr.20160222040422.1"><vh>@clean theory.md</vh>
<v t="ekr.20160225103140.1"><vh>The problem</vh></v>
<v t="ekr.20160225104246.1"><vh>The design</vh></v>
<v t="ekr.20160225103047.1"><vh>Using TokenSync class</vh></v>
<v t="ekr.20160225103215.1"><vh>Summary</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20160220050053.2" markdown-import="7d7100550e756e6465726c696e655f6469637471017d7102581700000020707974686f6e2d746f2d636f666665657363726970747103550123710473732e">@language rest
@wrap

This is the readme file for py2cs.py. It explains what the script does, why I created it, and how to use the script. A last section explains why the code is as it is and how it may evolve. Full source code for the script is in its [github repository](https://github.com/edreamleo/python-to-coffeescript). This script is offered under the terms of [Leo's MIT License](http://leoeditor.com/license.html).

@others</t>
<t tx="ekr.20160220050321.1">#!/usr/bin/env python
'''
This script makes a coffeescript file for every python source file listed
on the command line (wildcard file names are supported).

For full details, see README.md.

Released under the MIT License.

Written by Edward K. Ream.
'''
&lt;&lt; license &gt;&gt;
&lt;&lt; imports &gt;&gt;
isPython3 = sys.version_info &gt;= (3, 0, 0)
@others

g = LeoGlobals() # For ekr.
if __name__ == "__main__":
    main()
# A final comment for testing.
</t>
<t tx="ekr.20160220050433.10">
def dump_list(title, aList):
    '''Dump a list with a header.'''
    dump(title)
    for z in aList:
        print(z)
    print('')
</t>
<t tx="ekr.20160220050433.11">
def main():
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    # g.cls()
    controller = MakeCoffeeScriptController()
    controller.scan_command_line()
    controller.scan_options()
    controller.run()
    print('done')
</t>
<t tx="ekr.20160220050433.118">

class MakeCoffeeScriptController(object):
    '''The controller class for python_to_coffeescript.py.'''

    @others
</t>
<t tx="ekr.20160220050433.119">
def __init__(self):
    '''Ctor for MakeCoffeeScriptController class.'''
    self.options = {}
    # Ivars set on the command line...
    self.config_fn = None
    self.enable_unit_tests = False
    self.files = [] # May also be set in the config file.
    self.section_names = ('Global',)
    # Ivars set in the config file...
    self.output_directory = self.finalize('.')
    self.overwrite = False
    self.verbose = False # Trace config arguments.
</t>
<t tx="ekr.20160220050433.12">
def pdb(self):
    '''Invoke a debugger during unit testing.'''
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()
</t>
<t tx="ekr.20160220050433.120">
def finalize(self, fn):
    '''Finalize and regularize a filename.'''
    fn = os.path.expanduser(fn)
    fn = os.path.abspath(fn)
    fn = os.path.normpath(fn)
    return fn
</t>
<t tx="ekr.20160220050433.121">
def make_coffeescript_file(self, fn):
    '''
    Make a stub file in the output directory for all source files mentioned
    in the [Source Files] section of the configuration file.
    '''
    if not fn.endswith('.py'):
        print('not a python file', fn)
        return
    if not os.path.exists(fn):
        print('not found', fn)
        return
    base_fn = os.path.basename(fn)
    out_fn = os.path.join(self.output_directory, base_fn)
    out_fn = os.path.normpath(out_fn)
    out_fn = out_fn[: -3] + '.coffee'
    dir_ = os.path.dirname(out_fn)
    if os.path.exists(out_fn) and not self.overwrite:
        print('file exists: %s' % out_fn)
    elif not dir_ or os.path.exists(dir_):
        t1 = time.clock()
        s = open(fn).read()
        readlines = g.ReadLinesClass(s).next
        tokens = list(tokenize.generate_tokens(readlines))
        # s = CoffeeScriptTokenizer(controller=self).format(tokens)
        node = ast.parse(s, filename=fn, mode='exec')
        s = CoffeeScriptTraverser(controller=self).format(node, s, tokens)
        f = open(out_fn, 'w')
        self.output_time_stamp(f)
        f.write(s)
        f.close()
        print('wrote: %s' % out_fn)
    else:
        print('output directory not not found: %s' % dir_)
</t>
<t tx="ekr.20160220050433.122">
def run(self):
    '''
    Make stub files for all files.
    Do nothing if the output directory does not exist.
    '''
    if self.enable_unit_tests:
        self.run_all_unit_tests()
    if self.files:
        dir_ = self.output_directory
        if dir_:
            if os.path.exists(dir_):
                for fn in self.files:
                    self.make_coffeescript_file(fn)
            else:
                print('output directory not found: %s' % dir_)
        else:
            print('no output directory')
    elif not self.enable_unit_tests:
        print('no input files')
</t>
<t tx="ekr.20160220050433.123">
def run_all_unit_tests(self):
    '''Run all unit tests in the python-to-coffeescript/test directory.'''
    import unittest
    loader = unittest.TestLoader()
    suite = loader.discover(os.path.abspath('.'),
                            pattern='test*.py',
                            top_level_dir=None)
    unittest.TextTestRunner(verbosity=1).run(suite)
</t>
<t tx="ekr.20160220050433.124">
def scan_command_line(self):
    '''Set ivars from command-line arguments.'''
    # This automatically implements the --help option.
    usage = "usage: python_to_coffeescript.py [options] file1, file2, ..."
    parser = optparse.OptionParser(usage=usage)
    add = parser.add_option
    add('-c', '--config', dest='fn',
        help='full path to configuration file')
    add('-d', '--dir', dest='dir',
        help='full path to the output directory')
    add('-o', '--overwrite', action='store_true', default=False,
        help='overwrite existing .coffee files')
    # add('-t', '--test', action='store_true', default=False,
        # help='run unit tests on startup')
    add('-v', '--verbose', action='store_true', default=False,
        help='verbose output')
    # Parse the options
    options, args = parser.parse_args()
    # Handle the options...
    # self.enable_unit_tests = options.test
    self.overwrite = options.overwrite
    if options.fn:
        self.config_fn = options.fn
    if options.dir:
        dir_ = options.dir
        dir_ = self.finalize(dir_)
        if os.path.exists(dir_):
            self.output_directory = dir_
        else:
            print('--dir: directory does not exist: %s' % dir_)
            print('exiting')
            sys.exit(1)
    # If any files remain, set self.files.
    if args:
        args = [self.finalize(z) for z in args]
        if args:
            self.files = args
</t>
<t tx="ekr.20160220050433.125">
def scan_options(self):
    '''Set all configuration-related ivars.'''
    trace = False
    if not self.config_fn:
        return
    self.parser = parser = self.create_parser()
    s = self.get_config_string()
    self.init_parser(s)
    if self.files:
        files_source = 'command-line'
        files = self.files
    elif parser.has_section('Global'):
        files_source = 'config file'
        files = parser.get('Global', 'files')
        files = [z.strip() for z in files.split('\n') if z.strip()]
    else:
        return
    files2 = []
    for z in files:
        files2.extend(glob.glob(self.finalize(z)))
    self.files = [z for z in files2 if z and os.path.exists(z)]
    if trace:
        print('Files (from %s)...\n' % files_source)
        for z in self.files:
            print(z)
        print('')
    if 'output_directory' in parser.options('Global'):
        s = parser.get('Global', 'output_directory')
        output_dir = self.finalize(s)
        if os.path.exists(output_dir):
            self.output_directory = output_dir
            if self.verbose:
                print('output directory: %s\n' % output_dir)
        else:
            print('output directory not found: %s\n' % output_dir)
            self.output_directory = None # inhibit run().
    if 'prefix_lines' in parser.options('Global'):
        prefix = parser.get('Global', 'prefix_lines')
        self.prefix_lines = prefix.split('\n')
            # The parser does not preserve leading whitespace.
        if trace:
            print('Prefix lines...\n')
            for z in self.prefix_lines:
                print(z)
            print('')
    #
    # self.def_patterns = self.scan_patterns('Def Name Patterns')
    # self.general_patterns = self.scan_patterns('General Patterns')
    # self.make_patterns_dict()
</t>
<t tx="ekr.20160220050433.127">
def create_parser(self):
    '''Create a RawConfigParser and return it.'''
    parser = configparser.RawConfigParser()
    parser.optionxform = str
    return parser
</t>
<t tx="ekr.20160220050433.129">
def get_config_string(self):
    fn = self.finalize(self.config_fn)
    if os.path.exists(fn):
        if self.verbose:
            print('\nconfiguration file: %s\n' % fn)
        f = open(fn, 'r')
        s = f.read()
        f.close()
        return s
    else:
        print('\nconfiguration file not found: %s' % fn)
        return ''
</t>
<t tx="ekr.20160220050433.13">
def truncate(s, n):
    '''Return s truncated to n characters.'''
    return s if len(s) &lt;= n else s[:n-3] + '...'
</t>
<t tx="ekr.20160220050433.130">
def init_parser(self, s):
    '''Add double back-slashes to all patterns starting with '['.'''
    trace = False
    if not s: return
    aList = []
    for s in s.split('\n'):
        if self.is_section_name(s):
            aList.append(s)
        elif s.strip().startswith('['):
            aList.append(r'\\' + s[1:])
            if trace: g.trace('*** escaping:', s)
        else:
            aList.append(s)
    s = '\n'.join(aList) + '\n'
    if trace: g.trace(s)
    file_object = io.StringIO(s)
    self.parser.readfp(file_object)
</t>
<t tx="ekr.20160220050433.131">
def is_section_name(self, s):

    def munge(s):
        return s.strip().lower().replace(' ', '')

    s = s.strip()
    if s.startswith('[') and s.endswith(']'):
        s = munge(s[1: -1])
        for s2 in self.section_names:
            if s == munge(s2):
                return True
    return False
</t>
<t tx="ekr.20160220050433.14">

class CoffeeScriptTraverser(object):
    '''A class to convert python sources to coffeescript sources.'''
    # pylint: disable=consider-using-enumerate
    @others
</t>
<t tx="ekr.20160220050433.16">
def format(self, node, s, tokens):
    '''Format the node (or list of nodes) and its descendants.'''
    self.level = 0
    self.sync = sync = TokenSync(s, tokens)
    # Create aliases here for convenience.
    self.sync_string = sync.sync_string
    self.last_node = sync.last_node
    self.leading_lines = sync.leading_lines
    self.leading_string = sync.leading_string
    self.tokens_for_statment = sync.tokens_for_statement
    self.trailing_comment = sync.trailing_comment
    self.trailing_comment_at_lineno = sync.trailing_comment_at_lineno
    # Compute the result.
    val = self.visit(node)
    sync.check_strings()
    # if isinstance(val, list): # testing:
        # val = ' '.join(val)
    val += ''.join(sync.trailing_lines())
    return val or ''
</t>
<t tx="ekr.20160220050433.17">
def visit(self, node):
    '''Return the formatted version of an Ast node, or list of Ast nodes.'''
    name = node.__class__.__name__
    if isinstance(node, (list, tuple)):
        return ', '.join([self.visit(z) for z in node])
    elif node is None:
        return 'None'
    else:
        assert isinstance(node, ast.AST), name
        method = getattr(self, 'do_' + name)
        s = method(node)
        if isPython3:
            assert isinstance(s, str)
        else:
            assert isinstance(s, (str, unicode))
        return s
</t>
<t tx="ekr.20160220050433.18">
#
# CoffeeScriptTraverser contexts...
#</t>
<t tx="ekr.20160220050433.188">

class TestClass(object):
    '''A class containing constructs that have caused difficulties.'''
    # pylint: disable=no-member
    # pylint: disable=undefined-variable
    # pylint: disable=no-self-argument
    # pylint: disable=no-method-argument

    @others
</t>
<t tx="ekr.20160220050433.189">
def parse_group(group):
    if len(group) &gt;= 3 and group[-2] == 'as':
        del group[-2:]
    ndots = 0
    i = 0
    while len(group) &gt; i and group[i].startswith('.'):
        ndots += len(group[i])
        i += 1
    assert ''.join(group[: i]) == '.' * ndots, group
    del group[: i]
    assert all(g == '.' for g in group[1:: 2]), group
    return ndots, os.sep.join(group[:: 2])
</t>
<t tx="ekr.20160220050433.19">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def do_ClassDef(self, node):

    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    name = node.name # Only a plain string is valid.
    bases = [self.visit(z) for z in node.bases] if node.bases else []
    if bases:
        s = 'class %s extends %s' % (name, ', '.join(bases))
    else:
        s = 'class %s' % name
    result.append(self.indent(s + tail))
    self.class_stack.append(name)
    for i, z in enumerate(node.body):
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    self.class_stack.pop()
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.190">
def return_all(self):
    return all([is_known_type(z) for z in s3.split(',')])
    # return all(['abc'])
</t>
<t tx="ekr.20160220050433.191">
def return_array():
    return f(s[1: -1])
</t>
<t tx="ekr.20160220050433.192">
def return_list(self, a):
    return [a]
</t>
<t tx="ekr.20160220050433.193">
def return_two_lists(s):
    if 1:
        return aList
    else:
        return list(self.regex.finditer(s))
</t>
<t tx="ekr.20160220050433.2">import ast
import glob
import optparse
import os
import sys
import time
import token as token_module
import tokenize
import types
try:
    import ConfigParser as configparser # Python 2
except ImportError:
    import configparser # Python 3
try:
    import StringIO as io # Python 2
except ImportError:
    import io # Python 3
</t>
<t tx="ekr.20160220050433.20">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def do_FunctionDef(self, node):
    '''Format a FunctionDef node.'''
    result = self.leading_lines(node)
    if node.decorator_list:
        for z in node.decorator_list:
            tail = self.trailing_comment(z)
            s = '@%s' % self.visit(z)
            result.append(self.indent(s + tail))
    name = node.name # Only a plain string is valid.
    args = self.visit(node.args) if node.args else ''
    args = [z.strip() for z in args.split(',')]
    if self.class_stack and args and args[0] == '@':
        args = args[1:]
    args = ', '.join(args)
    args = '(%s) ' % args if args else ''
    # result.append('\n')
    tail = self.trailing_comment(node)
    sep = ': ' if self.class_stack else ' = '
    s = '%s%s%s-&gt;%s' % (name, sep, args, tail)
    result.append(self.indent(s))
    for i, z in enumerate(node.body):
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.21">
def do_Interactive(self, node):
    for z in node.body:
        self.visit(z)
</t>
<t tx="ekr.20160220050433.22">
def do_Module(self, node):

    return ''.join([self.visit(z) for z in node.body])
</t>
<t tx="ekr.20160220050433.23">
def do_Lambda(self, node):
    return self.indent('lambda %s: %s' % (
        self.visit(node.args),
        self.visit(node.body)))
</t>
<t tx="ekr.20160220050433.24">
#
# CoffeeScriptTraverser expressions...
#
</t>
<t tx="ekr.20160220050433.25">
def do_Expr(self, node):
    '''An outer expression: must be indented.'''
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    s = '%s' % self.visit(node.value)
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.26">
def do_Expression(self, node):
    '''An inner expression: do not indent.'''
    return '%s\n' % self.visit(node.body)
</t>
<t tx="ekr.20160220050433.27">
def do_GeneratorExp(self, node):
    elt = self.visit(node.elt) or ''
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '&lt;gen %s for %s&gt;' % (elt, ','.join(gens))
</t>
<t tx="ekr.20160220050433.29">
#
# CoffeeScriptTraverser operands...
#</t>
<t tx="ekr.20160220050433.30">
# arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

def do_arguments(self, node):
    '''Format the arguments node.'''
    assert isinstance(node, ast.arguments)
    args = [self.visit(z) for z in node.args]
    defaults = [self.visit(z) for z in node.defaults]
    # Assign default values to the last args.
    args2 = []
    n_plain = len(args) - len(defaults)
    for i in range(len(args)):
        if i &lt; n_plain:
            args2.append(args[i])
        else:
            args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
    # Now add the vararg and kwarg args.
    name = getattr(node, 'vararg', None)
    if name:
        # pylint: disable=no-member
        if isPython3 and isinstance(name, ast.arg):
            name = name.arg
        args2.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name:
        # pylint: disable=no-member
        if isPython3 and isinstance(name, ast.arg):
            name = name.arg
        args2.append('**' + name)
    return ','.join(args2)
</t>
<t tx="ekr.20160220050433.31">
# Python 3:
# arg = (identifier arg, expr? annotation)

def do_arg(self, node):
    return node.arg
</t>
<t tx="ekr.20160220050433.32">
# Attribute(expr value, identifier attr, expr_context ctx)

def do_Attribute(self, node):
    
    # Don't visit node.attr: it is always a string.
    val = self.visit(node.value)
    val = '@' if val == '@' else val + '.'
    return val + node.attr
</t>
<t tx="ekr.20160220050433.33">
def do_Bytes(self, node): # Python 3.x only.
    return str(node.s)
</t>
<t tx="ekr.20160220050433.34">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    if getattr(node, 'starargs', None):
        args.append('*%s' % (self.visit(node.starargs)))
    if getattr(node, 'kwargs', None):
        args.append('**%s' % (self.visit(node.kwargs)))
    args = [z for z in args if z] # Kludge: Defensive coding.
    s = '%s(%s)' % (func, ','.join(args))
    return s
</t>
<t tx="ekr.20160220050433.35">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)
</t>
<t tx="ekr.20160220050433.36">
def do_comprehension(self, node):
    result = []
    name = self.visit(node.target) # A name.
    it = self.visit(node.iter) # An attribute.
    result.append('%s in %s' % (name, it))
    ifs = [self.visit(z) for z in node.ifs]
    if ifs:
        result.append(' if %s' % (''.join(ifs)))
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.37">
def do_Dict(self, node):
    assert len(node.keys) == len(node.values)
    items, result = [], []
    result.append('{')
    self.level += 1
    for i, key in enumerate(node.keys):
        head = self.leading_lines(key)
            # Prevents leading lines from being handled again.
        head = [z for z in head if z.strip()]
            # Ignore blank lines.
        if head:
            items.extend('\n'+''.join(head))
        tail = self.trailing_comment(node.values[i])
        key = self.visit(node.keys[i])
        value = self.visit(node.values[i])
        s = '%s:%s%s' % (key, value, tail)
        items.append(self.indent(s))
    self.level -= 1
    result.extend(items)
    if items:
        result.append(self.indent('}'))
    else:
        result.append('}')
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.38">
def do_Ellipsis(self, node):
    return '...'
</t>
<t tx="ekr.20160220050433.39">
def do_ExtSlice(self, node):
    return ':'.join([self.visit(z) for z in node.dims])
</t>
<t tx="ekr.20160220050433.40">
def do_Index(self, node):
    return self.visit(node.value)
</t>
<t tx="ekr.20160220050433.41">
def do_List(self, node):
    # Not used: list context.
    # self.visit(node.ctx)
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    return '[%s]' % ','.join(elts)
</t>
<t tx="ekr.20160220050433.42">
def do_ListComp(self, node):
    elt = self.visit(node.elt)
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '%s for %s' % (elt, ''.join(gens))
</t>
<t tx="ekr.20160220050433.43">
def do_Name(self, node):
    return '@' if node.id == 'self' else node.id

def do_NameConstant(self, node): # Python 3 only.
    s = repr(node.value)
    return 'bool' if s in ('True', 'False') else s
</t>
<t tx="ekr.20160220050433.44">
def do_Num(self, node):
    return repr(node.n)
</t>
<t tx="ekr.20160220050433.45">
# Python 2.x only

def do_Repr(self, node):
    return 'repr(%s)' % self.visit(node.value)
</t>
<t tx="ekr.20160220050433.46">
def do_Slice(self, node):
    lower, upper, step = '', '', ''
    if getattr(node, 'lower', None) is not None:
        lower = self.visit(node.lower)
    if getattr(node, 'upper', None) is not None:
        upper = self.visit(node.upper)
    if getattr(node, 'step', None) is not None:
        step = self.visit(node.step)
    if step:
        return '%s:%s:%s' % (lower, upper, step)
    else:
        return '%s:%s' % (lower, upper)
</t>
<t tx="ekr.20160220050433.47">
def do_Str(self, node):
    '''A string constant, including docstrings.'''
    if hasattr(node, 'lineno'):
        # Do *not* handle leading lines here.
        # leading = self.leading_string(node)
        return self.sync_string(node)
    else:
        g.trace('==== no lineno', node.s)
        return node.s
</t>
<t tx="ekr.20160220050433.48">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    value = self.visit(node.value)
    the_slice = self.visit(node.slice)
    return '%s[%s]' % (value, the_slice)
</t>
<t tx="ekr.20160220050433.49">
def do_Tuple(self, node):
    elts = [self.visit(z) for z in node.elts]
    return '(%s)' % ', '.join(elts)
</t>
<t tx="ekr.20160220050433.50">
#
# CoffeeScriptTraverser operators...
#</t>
<t tx="ekr.20160220050433.51">
def do_BinOp(self, node):
    return '%s%s%s' % (
        self.visit(node.left),
        op_name(node.op),
        self.visit(node.right))
</t>
<t tx="ekr.20160220050433.52">
def do_BoolOp(self, node):
    values = [self.visit(z) for z in node.values]
    return op_name(node.op).join(values)
</t>
<t tx="ekr.20160220050433.53">
def do_Compare(self, node):
    result = []
    lt = self.visit(node.left)
    ops = [op_name(z) for z in node.ops]
    comps = [self.visit(z) for z in node.comparators]
    result.append(lt)
    if len(ops) == len(comps):
        for i in range(len(ops)):
            result.append('%s%s' % (ops[i], comps[i]))
    else:
        print('can not happen: ops', repr(ops), 'comparators', repr(comps))
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.54">
def do_UnaryOp(self, node):
    return '%s%s' % (
        op_name(node.op),
        self.visit(node.operand))
</t>
<t tx="ekr.20160220050433.55">
def do_IfExp(self, node):
    return '%s if %s else %s ' % (
        self.visit(node.body),
        self.visit(node.test),
        self.visit(node.orelse))
</t>
<t tx="ekr.20160220050433.56">
#
# CoffeeScriptTraverser statements...
#</t>
<t tx="ekr.20160220050433.57">
def do_Assert(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    test = self.visit(node.test)
    if getattr(node, 'msg', None) is not None:
        s = 'assert %s, %s' % (test, self.visit(node.msg))
    else:
        s = 'assert %s' % test
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.58">
def do_Assign(self, node):

    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    s = '%s=%s' % (
        '='.join([self.visit(z) for z in node.targets]),
        self.visit(node.value))
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.59">
def do_AugAssign(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    s = '%s%s=%s' % (
        self.visit(node.target),
        op_name(node.op),
        self.visit(node.value))
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.60">
def do_Break(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    return head + self.indent('break') + tail
</t>
<t tx="ekr.20160220050433.61">
def do_Continue(self, node):
    
    head = self.leading_lines(node)
    tail = self.trailing_comment(node)
    return head + self.indent('continue') + tail
</t>
<t tx="ekr.20160220050433.62">
def do_Delete(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    targets = [self.visit(z) for z in node.targets]
    s = 'del %s' % ','.join(targets)
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.63">
def do_ExceptHandler(self, node):

    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    result.append(self.indent('except'))
    if getattr(node, 'type', None):
        result.append(' %s' % self.visit(node.type))
    if getattr(node, 'name', None):
        if isinstance(node.name, ast.AST):
            result.append(' as %s' % self.visit(node.name))
        else:
            result.append(' as %s' % node.name) # Python 3.x.
    result.append(':' + tail)
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.64">
# Python 2.x only

def do_Exec(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    body = self.visit(node.body)
    args = [] # Globals before locals.
    if getattr(node, 'globals', None):
        args.append(self.visit(node.globals))
    if getattr(node, 'locals', None):
        args.append(self.visit(node.locals))
    if args:
        s = 'exec %s in %s' % (body, ','.join(args))
    else:
        s = 'exec %s' % body
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.65">
def do_For(self, node):

    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    s = 'for %s in %s:' % (
        self.visit(node.target),
        self.visit(node.iter))
    result.append(self.indent(s + tail))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        tail = self.tail_after_body(node.body, node.orelse, result)
        result.append(self.indent('else:' + tail))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.66">
def do_Global(self, node):
    
    head = self.leading_lines(node)
    tail = self.trailing_comment(node)
    s = 'global %s' % ','.join(node.names)
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.67">
def do_If(self, node):

    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    s = 'if %s:%s' % (self.visit(node.test), tail)
    result.append(self.indent(s))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        tail = self.tail_after_body(node.body, node.orelse, result)
        result.append(self.indent('else:' + tail))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.68">
def do_Import(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    s = 'pass # import %s' % ','.join(names)
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.69">
def get_import_names(self, node):
    '''Return a list of the the full file names in the import statement.'''
    result = []
    for ast2 in node.names:
        assert isinstance(ast2, ast.alias)
        data = ast2.name, ast2.asname
        result.append(data)
    return result
</t>
<t tx="ekr.20160220050433.7">
#
# Utility functions...
#</t>
<t tx="ekr.20160220050433.70">
def do_ImportFrom(self, node):

    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    s = 'pass # from %s import %s' % (node.module, ','.join(names))
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.71">
def do_Pass(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    return head + self.indent('pass') + tail
</t>
<t tx="ekr.20160220050433.72">
# Python 2.x only

def do_Print(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    vals = []
    for z in node.values:
        vals.append(self.visit(z))
    if getattr(node, 'dest', None) is not None:
        vals.append('dest=%s' % self.visit(node.dest))
    if getattr(node, 'nl', None) is not None:
        if node.nl == 'False':
            vals.append('nl=%s' % node.nl)
    s = 'print(%s)' % ','.join(vals)
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.73">
def do_Raise(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    args = []
    for attr in ('type', 'inst', 'tback'):
        if getattr(node, attr, None) is not None:
            args.append(self.visit(getattr(node, attr)))
    s = 'raise %s' % ', '.join(args) if args else 'raise'
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.74">
def do_Return(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    if node.value:
        s = 'return %s' % self.visit(node.value).strip()
    else:
        s = 'return'
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.75">
def do_TryExcept(self, node):

    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    s = 'try:' + tail
    result.append(self.indent(s))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.handlers:
        for z in node.handlers:
            result.append(self.visit(z))
    if node.orelse:
        tail = self.trailing_comment(node.orelse)
        s = 'else:' + tail
        result.append(self.indent(s))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.76">
def do_TryFinally(self, node):
    
    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    result.append(self.indent('try:' + tail))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    tail = self.tail_after_body(node.body, node.finalbody, result)
    result.append(self.indent('finally:' + tail))
    for z in node.finalbody:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.77">
def do_While(self, node):
    
    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    s = 'while %s:' % self.visit(node.test)
    result.append(self.indent(s + tail))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        tail = self.trailing_comment(node)
        result.append(self.indent('else:' + tail))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.78">
def do_With(self, node):

    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    result.append(self.indent('with '))
    if hasattr(node, 'context_expression'):
        result.append(self.visit(node.context_expresssion))
    vars_list = []
    if hasattr(node, 'optional_vars'):
        try:
            for z in node.optional_vars:
                vars_list.append(self.visit(z))
        except TypeError: # Not iterable.
            vars_list.append(self.visit(node.optional_vars))
    result.append(','.join(vars_list))
    result.append(':' + tail)
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result) + tail
</t>
<t tx="ekr.20160220050433.79">
def do_Yield(self, node):
    
    head = self.leading_string(node)
    tail = self.trailing_comment(node)
    if getattr(node, 'value', None) is not None:
        s = 'yield %s' % self.visit(node.value)
    else:
        s ='yield'
    return head + self.indent(s) + tail
</t>
<t tx="ekr.20160220050433.8">
def dump(title, s=None):
    if s:
        print('===== %s...\n%s\n' % (title, s.rstrip()))
    else:
        print('===== %s...\n' % title)
</t>
<t tx="ekr.20160220050433.82">
def indent(self, s):
    '''Return s, properly indented.'''
    # assert not s.startswith('\n'), (g.callers(), repr(s))
    n = 0
    while s and s.startswith('\n'):
        n += 1
        s = s[1:]
    return '%s%s%s' % ('\n' * n, ' ' * 4 * self.level, s)
</t>
<t tx="ekr.20160220050433.86">

class LeoGlobals(object):
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''
    @others
</t>
<t tx="ekr.20160220050433.87">

class NullObject:
    """
    An object that does nothing, and does it very well.
    From the Python cookbook, recipe 5.23
    """
    def __init__(self, *args, **keys): pass
    def __call__(self, *args, **keys): return self
    def __repr__(self): return "NullObject"
    def __str__(self): return "NullObject"
    def __bool__(self): return False
    def __nonzero__(self): return 0
    def __delattr__(self, attr): return self
    def __getattr__(self, attr): return self
    def __setattr__(self, attr, val): return self
</t>
<t tx="ekr.20160220050433.88">
def _callerName(self, n=1, files=False):
    # print('_callerName: %s %s' % (n,files))
    try: # get the function name from the call stack.
        f1 = sys._getframe(n) # The stack frame, n levels up.
        code1 = f1.f_code # The code object
        name = code1.co_name
        if name == '__init__':
            name = '__init__(%s,line %s)' % (
                self.shortFileName(code1.co_filename), code1.co_firstlineno)
        if files:
            return '%s:%s' % (self.shortFileName(code1.co_filename), name)
        else:
            return name # The code name
    except ValueError:
        # print('g._callerName: ValueError',n)
        return '' # The stack is not deep enough.
    except Exception:
        # es_exception()
        return '' # "&lt;no caller name&gt;"
</t>
<t tx="ekr.20160220050433.89">
def callers(self, n=4, count=0, excludeCaller=True, files=False):
    '''Return a list containing the callers of the function that called g.callerList.

    If the excludeCaller keyword is True (the default), g.callers is not on the list.

    If the files keyword argument is True, filenames are included in the list.
    '''
    # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
    # The jython stack often has less than 8 entries,
    # so we must be careful to call g._callerName with smaller values of i first.
    result = []
    i = 3 if excludeCaller else 2
    while 1:
        s = self._callerName(i, files=files)
        # print(i,s)
        if s:
            result.append(s)
        if not s or len(result) &gt;= n: break
        i += 1
    result.reverse()
    if count &gt; 0: result = result[: count]
    sep = '\n' if files else ','
    return sep.join(result)
</t>
<t tx="ekr.20160220050433.9">
def dump_dict(title, d):
    '''Dump a dictionary with a header.'''
    dump(title)
    for z in sorted(d):
        print('%30s %s' % (z, d.get(z)))
    print('')
</t>
<t tx="ekr.20160220050433.90">
def cls(self):
    '''Clear the screen.'''
    if sys.platform.lower().startswith('win'):
        os.system('cls')
</t>
<t tx="ekr.20160220050433.91">
def pdb(self):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()
</t>
<t tx="ekr.20160220050433.92">
def shortFileName(self, fileName, n=None):
    if n is None or n &lt; 1:
        return os.path.basename(fileName)
    else:
        return '/'.join(fileName.replace('\\', '/').split('/')[-n:])
</t>
<t tx="ekr.20160220050433.93">
def splitLines(self, s):
    '''Split s into lines, preserving trailing newlines.'''
    return s.splitlines(True) if s else []
</t>
<t tx="ekr.20160220050433.94">
def trace(self, *args, **keys):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.trace(caller_level=2, *args, **keys)
    except ImportError:
        print(args, keys)
</t>
<t tx="ekr.20160220050745.1">@nocolor-node
@
All parts of this script are distributed under the following copyright. This is intended to be the same as the MIT license, namely that this script is absolutely free, even for commercial use, including resale. There is no GNU-like "copyleft" restriction. This license is compatible with the GPL.

**Copyright 2016 by Edward K. Ream. All Rights Reserved.**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

**THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.**
</t>
<t tx="ekr.20160220051058.1"></t>
<t tx="ekr.20160220051105.1">@nocolor-node

The problem with an ast-based approach is that it is extremely hard to
reconstruct comments and the spelling of strings. ast_utils.py is an
attempt that looks more completx than the entire CoffeeScriptTokenizer
class! For this reason, I am going to put the CoffeeScriptFormatter class
in the attic.</t>
<t tx="ekr.20160220051359.1"></t>
<t tx="ekr.20160220051359.2">pylint
beautify-tree
sort-lines
# clone-to-at-spot
</t>
<t tx="ekr.20160220051359.4"></t>
<t tx="ekr.20160220051417.1"></t>
<t tx="ekr.20160220051417.10">
def run(self,fn=None):
    
    n, p = 0, c.rootPosition()
    while p:
        if p.h.startswith('@ignore '):
            p.moveToNodeAfterTree()
        elif p.h.startswith('@test '):
            self.nodes.append(p.copy())
            if not fn:
                fn2 = self.clean(p.h)+'.py'
                self.write_file(fn2)
                self.test(fn2)
                self.nodes=[]
            n += 1
            p.moveToThreadNext()
        else:
            p.moveToThreadNext()
    if n == 0:
        print('no @file or @suite nodes found.')
    else:
        if fn:
            self.write_file(fn)
            self.test(fn)
        dest = g.os_path_join(self.path, fn) if fn else self.path
        print('wrote %s test%s to %s' % (n,self.plural(n), dest))
</t>
<t tx="ekr.20160220051417.11">
def plural(self, n):
    return 's' if n &gt; 1 else ''
</t>
<t tx="ekr.20160220051417.12">
def test(self,fn):
    '''Test the newly created file.'''
    import imp
    import sys

    if self.path not in sys.path:
        sys.path.append(self.path)
    assert fn.endswith('.py')
    name = fn[:-3]
    try:
        f,path,desc = imp.find_module(name,[self.path])
        imp.load_module(name,f,path,desc)
        # print('imported %s' % (name))
    except Exception:
        print('can not import: %s' % (name))
        g.es_print_exception()
</t>
<t tx="ekr.20160220051417.13">
def write_file(self,fn):

    assert g.os_path_exists(self.path),self.path
    fn = g.os_path_finalize_join(self.path,fn)
    f = open(fn,'w')
    f.write(self.file_template)
    # g.trace(''.join([z.h for z in self.nodes]))
    for p in self.nodes:
        f.write(self.test_template % (self.clean(p.h),self.get_body(p)))
    f.close()
    g.trace('wrote', fn)
</t>
<t tx="ekr.20160220051417.14">for p1 in c.all_unique_positions():
    if p1.h.startswith('@clean'):
        for p in p1.subtree():
            if (not p.h.strip().startswith('&lt;&lt;') and
                p.b.strip() and not p.b.startswith('\n')
            ):
                g.es_print(repr(p.b[:3]), p.h)
g.es_print('done')
</t>
<t tx="ekr.20160220051417.2">&lt;&lt; docstring &gt;&gt;
# **Note**: this is a Leo script.
# It **does** have access to c, g and p.
import os
import re
@others
test_dir = os.path.dirname(c.fileName())+os.sep+'test'
assert os.path.exists(test_dir), test_dir
assert os.path.isdir(test_dir), test_dir

if 1:
    # Writes each test to a separate file in the test directory.
    TestWriter(c,path=test_dir).run(fn=None)    
if 0:
    # Writes all tests to a single file: test/unit_tests.py
    TestWriter(c,path=test_dir).run(fn='unit_tests.py')
</t>
<t tx="ekr.20160220051417.3">@
@language rest
'''
This script transliterates @test nodes into .py file. The two main ways of
using this script are as follows::

    TestWriter(c,path='test').run(fn='unit_tests.py') # writes one file
    TestWriter(c,path='test').run(fn=None)            # writes separate files.
     
The first writes all tests to test/unit_tests.py; the second writes each
unit test to a separate .py file in the test directory.

The script imports each written file and reports any syntax errors.

This is a straightforward script; it should be easy to modify it to suit
individual needs.

The &lt;\&lt; file_template &gt;&gt; and &lt;\&lt; test_template &gt;&gt; sections in the TestWriter
class determines exactly what this script writes.
'''
</t>
<t tx="ekr.20160220051417.4">

class TestWriter:
    
    &lt;&lt; define file_template &gt;&gt;
    &lt;&lt; define test_template &gt;&gt;

    @others
</t>
<t tx="ekr.20160220051417.5"># Add any other common imports here.

file_template = '''\
import unittest
from make_stub_files import *
'''

file_template = g.adjustTripleString(file_template,c.tab_width)
</t>
<t tx="ekr.20160220051417.6">test_template = '''
class %s (unittest.TestCase):
    def runTest(self):
%s
'''

test_template = g.adjustTripleString(test_template,c.tab_width)
</t>
<t tx="ekr.20160220051417.7">
def __init__(self,c,path=''):
    '''TestWriter ctor.'''
    self.c = c
    load_dir = g.os_path_dirname(c.fileName())
    self.path = g.os_path_finalize_join(load_dir,path)
    self.nodes = []
    assert g.os_path_exists(self.path),self.path
</t>
<t tx="ekr.20160220051417.8">
def clean(self,s):
    '''Munge s so that it can be used as a file name.'''
    result,tag = [],'@test'
    if s.startswith(tag):
        s = s[len(tag):]
    for ch in s.strip():
        if ch.isalnum():
            result.append(ch)
        else:
            result.append('_')
        # elif ch.isspace():
            # result.append('_')
    s = ''.join(result)
    if s.endswith('.py'):
        s = s[:-3]
    if not s.startswith('test'):
        s = 'test_' + s
    return s.replace('__','_').strip()
</t>
<t tx="ekr.20160220051417.9">
def get_body(self, p):
    '''Convert p.b to a valid script.'''
    s_old = p.b
    # Suppress @others but not section references.
    p.b = p.b.replace('@others', '')
    assert p.b.find('@others') == -1
    s = g.getScript(c, p,
                    useSelectedText=False,
                    forcePythonSentinels=True,
                    useSentinels=False)
    p.b = s_old
    s = ''.join([' '*8+z for z in g.splitLines(s) if z.strip()])
            # Add leading indentation needed by test_template.
    return s.rstrip()+'\n'
</t>
<t tx="ekr.20160220055816.3">
def output_time_stamp(self, f):
    '''Put a time-stamp in the output file f.'''
    f.write('# python_to_coffeescript: %s\n' %
        time.strftime("%a %d %b %Y at %H:%M:%S"))
</t>
<t tx="ekr.20160220094909.1">
# Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

def do_Try(self, node): # Python 3

    result = self.leading_lines(node)
    tail = self.trailing_comment(node)
    s = 'try' + tail
    result.append(self.indent(s))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.handlers:
        for z in node.handlers:
            result.append(self.visit(z))
    if node.orelse:
        tail = self.trailing_comment(node.orelse)
        result.append(self.indent('else:' + tail))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    if node.finalbody:
        tail = self.trailing_comment(node.finalbody)
        s = 'finally:' + tail
        result.append(self.indent(s))
        for z in node.finalbody:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220103223.1">

class CoffeeScriptTokenizer:
    '''A token-based Python beautifier.'''
    @others
</t>
<t tx="ekr.20160220103223.10">
def do_endmarker(self):
    '''Handle an endmarker token.'''
    pass
</t>
<t tx="ekr.20160220103223.11">
def do_errortoken(self):
    '''Handle an errortoken token.'''
    # This code is executed for versions of Python earlier than 2.4
    if self.val == '@':
        self.gen_op(self.val)
</t>
<t tx="ekr.20160220103223.12">
def do_dedent(self):
    '''Handle dedent token.'''
    self.level -= 1
    self.lws = self.level * self.tab_width * ' '
    self.gen_line_start()
    # End all classes &amp; defs.
    for state in self.stack.stack:
        if state.kind in ('class', 'def'):
            if state.value &gt;= self.level:
                # g.trace(self.level, 'end', state.kind)
                self.stack.remove(state.kind)
            else:
                break

def do_indent(self):
    '''Handle indent token.'''
    self.level += 1
    self.lws = self.val
    self.gen_line_start()
</t>
<t tx="ekr.20160220103223.13">
def do_name(self):
    '''Handle a name token.'''
    name = self.val
    if name in ('class', 'def'):
        self.gen_class_or_def(name)
    elif name in ('from', 'import'):
        self.gen_import(name)
    elif name == 'self':
        self.gen_self()
    elif self.in_def_line and not self.def_name_seen:
        if name == '__init__':
            name = 'constructor'
        self.gen_word(name)
        if self.stack.has('class'):
            self.gen_op_blank(':')
        else:
            self.gen_op('=')
        self.def_name_seen = True
    elif name in ('and', 'in', 'not', 'not in', 'or'):
        self.gen_word_op(name)
    elif name == 'default':
        # Hard to know where to put a warning comment.
        self.gen_word(name+'_')
    else:
        self.gen_word(name)
</t>
<t tx="ekr.20160220103223.14">
def do_newline(self):
    '''Handle a regular newline.'''
    self.gen_line_end()
</t>
<t tx="ekr.20160220103223.15">
def do_nl(self):
    '''Handle a continuation line.'''
    self.gen_line_end()
</t>
<t tx="ekr.20160220103223.16">
def do_number(self):
    '''Handle a number token.'''
    self.add_token('number', self.val)
</t>
<t tx="ekr.20160220103223.17">
def do_op(self):
    '''Handle an op token.'''
    val = self.val
    if val == '.':
        self.gen_period()
    elif val == '@':
        self.gen_at()
    elif val == ':':
        self.gen_colon()
    elif val == '(':
        self.gen_open_paren()
    elif val == ')':
        self.gen_close_paren()
    elif val == ',':
        self.gen_comma()
    elif val == ';':
        # Pep 8: Avoid extraneous whitespace immediately before
        # comma, semicolon, or colon.
        self.gen_op_blank(val)
    elif val in '[{':
        # Pep 8: Avoid extraneous whitespace immediately inside
        # parentheses, brackets or braces.
        self.gen_lt(val)
    elif val in ']}':
        self.gen_rt(val)
    elif val == '=':
        # Pep 8: Don't use spaces around the = sign when used to indicate
        # a keyword argument or a default parameter value.
        if self.output_paren_level:
            self.gen_op_no_blanks(val)
        else:
            self.gen_op(val)
    elif val in '~+-':
        self.gen_possible_unary_op(val)
    elif val == '*':
        self.gen_star_op()
    elif val == '**':
        self.gen_star_star_op()
    else:
        # Pep 8: always surround binary operators with a single space.
        # '==','+=','-=','*=','**=','/=','//=','%=','!=','&lt;=','&gt;=','&lt;','&gt;',
        # '^','~','*','**','&amp;','|','/','//',
        # Pep 8: If operators with different priorities are used,
        # consider adding whitespace around the operators with the lowest priority(ies).
        self.gen_op(val)
</t>
<t tx="ekr.20160220103223.18">
def do_string(self):
    '''Handle a 'string' token.'''
    self.add_token('string', self.val)
    if self.val.find('\\\n'):
        self.backslash_seen = False
        # This *does* retain the string's spelling.
    self.gen_blank()
</t>
<t tx="ekr.20160220103223.19">
#
# Output token generators and helpers...
#</t>
<t tx="ekr.20160220103223.2">

class OutputToken(object):
    '''A class representing Output Tokens'''

    def __init__(self, kind, value):
        self.kind = kind
        self.value = value

    def __repr__(self):
        if self.kind == 'line-indent':
            assert not self.value.strip(' ')
            return '%15s %s' % (self.kind, len(self.value))
        else:
            return '%15s %r' % (self.kind, self.value)

    __str__ = __repr__

    def to_string(self):
        '''Convert an output token to a string.'''
        return self.value if g.isString(self.value) else ''
</t>
<t tx="ekr.20160220103223.20">
def add_token(self, kind, value=''):
    '''Add a token to the code list.'''
    token = self.OutputToken(kind, value)
    self.code_list.append(token)
    if kind not in (
        'backslash',
        'blank', 'blank-lines',
        'file-start',
        'line-end', 'line-indent'
    ):
        # g.trace(token,g.callers())
        self.prev_sig_token = token
</t>
<t tx="ekr.20160220103223.22">
def gen_backslash(self):
    '''Add a backslash token and clear .backslash_seen'''
    self.add_token('backslash', '\\')
    self.add_token('line-end', '\n')
    self.gen_line_indent()
    self.backslash_seen = False
</t>
<t tx="ekr.20160220103223.23">
def gen_blank(self):
    '''Add a blank request on the code list.'''
    prev = self.code_list[-1]
    if not prev.kind in (
        'blank', 'blank-lines', 'blank-op',
        'file-start',
        'line-end', 'line-indent',
        'lt', 'op-no-blanks', 'unary-op',
    ):
        self.add_token('blank', ' ')
</t>
<t tx="ekr.20160220103223.24">
def gen_blank_lines(self, n):
    '''
    Add a request for n blank lines to the code list.
    Multiple blank-lines request yield at least the maximum of all requests.
    '''
    self.clean_blank_lines()
    kind = self.code_list[-1].kind
    if kind == 'file-start':
        self.add_token('blank-lines', n)
    else:
        for i in range(0, n + 1):
            self.add_token('line-end', '\n')
        # Retain the token (intention) for debugging.
        self.add_token('blank-lines', n)
        self.gen_line_indent()
</t>
<t tx="ekr.20160220103223.25">
def clean(self, kind):
    '''Remove the last item of token list if it has the given kind.'''
    prev = self.code_list[-1]
    if prev.kind == kind:
        self.code_list.pop()
</t>
<t tx="ekr.20160220103223.26">
def clean_blank_lines(self):
    '''Remove all vestiges of previous lines.'''
    table = ('blank-lines', 'line-end', 'line-indent')
    while self.code_list[-1].kind in table:
        self.code_list.pop()
</t>
<t tx="ekr.20160220103223.27">
def gen_file_end(self):
    '''
    Add a file-end token to the code list.
    Retain exactly one line-end token.
    '''
    self.clean_blank_lines()
    self.add_token('line-end', '\n')
    self.add_token('line-end', '\n')
    self.add_token('file-end')

def gen_file_start(self):
    '''Add a file-start token to the code list and the state stack.'''
    self.add_token('file-start')
    self.stack.push('file-start')
</t>
<t tx="ekr.20160220103223.28">
def gen_line_indent(self, ws=None):
    '''Add a line-indent token if indentation is non-empty.'''
    self.clean('line-indent')
    ws = ws or self.lws
    if ws:
        self.add_token('line-indent', ws)
</t>
<t tx="ekr.20160220103223.29">
def gen_line_end(self):
    '''Add a line-end request to the code list.'''
    prev = self.code_list[-1]
    if prev.kind == 'file-start':
        return
    self.clean('blank') # Important!
    if self.delete_blank_lines:
        self.clean_blank_lines()
    self.clean('line-indent')
    if self.backslash_seen:
        self.gen_backslash()
    self.add_token('line-end', '\n')
    self.gen_line_indent()
        # Add the indentation for all lines
        # until the next indent or unindent token.

def gen_line_start(self):
    '''Add a line-start request to the code list.'''
    self.gen_line_indent()
</t>
<t tx="ekr.20160220103223.3">

class ParseState(object):
    '''A class representing items parse state stack.'''

    def __init__(self, kind, value):
        self.kind = kind
        self.value = value

    def __repr__(self):
        return 'State: %10s %s' % (self.kind, repr(self.value))

    __str__ = __repr__
</t>
<t tx="ekr.20160220103223.30">
def gen_lt(self, s):
    '''Add a left paren to the code list.'''
    assert s in '([{', repr(s)
    self.output_paren_level += 1
    self.clean('blank')
    prev = self.code_list[-1]
    if self.in_def_line:
        self.gen_blank()
        self.add_token('lt', s)
    elif prev.kind in ('op', 'word-op'):
        self.gen_blank()
        if s == '(':
            # g.trace(self.prev_sig_token)
            s = '['
            self.stack.push('tuple', self.output_paren_level)
        self.add_token('lt', s)
    elif prev.kind == 'word':
        # Only suppress blanks before '(' or '[' for non-keyworks.
        if s == '{' or prev.value in ('if', 'else', 'return'):
            self.gen_blank()
        self.add_token('lt', s)
    elif prev.kind == 'op':
        self.gen_op(s)
    else:
        self.gen_op_no_blanks(s)

def gen_rt(self, s):
    '''Add a right paren to the code list.'''
    assert s in ')]}', repr(s)
    self.output_paren_level -= 1
    prev = self.code_list[-1]
    if prev.kind == 'arg-end':
        # Remove a blank token preceding the arg-end token.
        prev = self.code_list.pop()
        self.clean('blank')
        self.code_list.append(prev)
    else:
        self.clean('blank')
        prev = self.code_list[-1]
    if self.stack.has('tuple'):
        # g.trace('line', self.last_line_number, self.output_paren_level + 1)
        state = self.stack.get('tuple')
        if state.value == self.output_paren_level + 1:
            self.add_token('rt', ']')
            self.stack.remove('tuple')
        else:
            self.add_token('rt', s)
    elif s == ')' and prev and prev.kind == 'lt' and prev.value == '(':
        # Remove ()
        self.code_list.pop()
    else:
        self.add_token('rt', s)
</t>
<t tx="ekr.20160220103223.31">
def gen_op(self, s):
    '''Add op token to code list.'''
    assert s and g.isString(s), repr(s)
    self.gen_blank()
    self.add_token('op', s)
    self.gen_blank()

def gen_op_blank(self, s):
    '''Remove a preceding blank token, then add op and blank tokens.'''
    assert s and g.isString(s), repr(s)
    self.clean('blank')
    self.add_token('op', s)
    self.gen_blank()

def gen_op_no_blanks(self, s):
    '''Add an operator *not* surrounded by blanks.'''
    self.clean('blank')
    self.add_token('op-no-blanks', s)
    
def gen_blank_op(self, s):
    '''Add an operator possibly with a preceding blank.'''
    self.gen_blank()
    self.add_token('blank-op', s)
</t>
<t tx="ekr.20160220103223.32">
def gen_possible_unary_op(self, s):
    '''Add a unary or binary op to the token list.'''
    self.clean('blank')
    prev = self.code_list[-1]
    if prev.kind in ('lt', 'op', 'op-no-blanks', 'word-op'):
        self.gen_unary_op(s)
    elif prev.kind == 'word' and prev.value in ('elif', 'if', 'return', 'while'):
        self.gen_unary_op(s)
    else:
        self.gen_op(s)

def gen_unary_op(self, s):
    '''Add an operator request to the code list.'''
    assert s and g.isString(s), repr(s)
    self.gen_blank()
    self.add_token('unary-op', s)
</t>
<t tx="ekr.20160220103223.33">
def gen_star_op(self):
    '''Put a '*' op, with special cases for *args.'''
    val = '*'
    if self.output_paren_level:
        i = len(self.code_list) - 1
        if self.code_list[i].kind == 'blank':
            i -= 1
        token = self.code_list[i]
        if token.kind == 'lt':
            self.gen_op_no_blanks(val)
        elif token.value == ',':
            self.gen_blank()
            self.add_token('op-no-blanks', val)
        else:
            self.gen_op(val)
    else:
        self.gen_op(val)
</t>
<t tx="ekr.20160220103223.34">
def gen_star_star_op(self):
    '''Put a ** operator, with a special case for **kwargs.'''
    val = '**'
    if self.output_paren_level:
        i = len(self.code_list) - 1
        if self.code_list[i].kind == 'blank':
            i -= 1
        token = self.code_list[i]
        if token.value == ',':
            self.gen_blank()
            self.add_token('op-no-blanks', val)
        else:
            self.gen_op(val)
    else:
        self.gen_op(val)
</t>
<t tx="ekr.20160220103223.35">
def gen_word(self, s):
    '''Add a word request to the code list.'''
    assert s and g.isString(s), repr(s)
    self.gen_blank()
    self.add_token('word', s)
    self.gen_blank()

def gen_word_op(self, s):
    '''Add a word-op request to the code list.'''
    assert s and g.isString(s), repr(s)
    self.gen_blank()
    self.add_token('word-op', s)
    self.gen_blank()
</t>
<t tx="ekr.20160220103223.4">
def __init__(self, controller):
    '''Ctor for CoffeeScriptTokenizer class.'''
    self.controller = controller
    # Globals...
    self.code_list = [] # The list of output tokens.
    # The present line and token...
    self.last_line_number = 0
    self.raw_val = None # Raw value for strings, comments.
    self.s = None # The string containing the line.
    self.val = None
    # State vars...
    self.after_self = False
    self.backslash_seen = False
    self.decorator_seen = False
    self.extends_flag = False
    self.in_class_line = False
    self.in_def_line = False
    self.in_import = False
    self.in_list = False
    self.input_paren_level = 0
    self.def_name_seen = False
    self.level = 0 # indentation level.
    self.lws = '' # Leading whitespace.
        # Typically ' '*self.tab_width*self.level,
        # but may be changed for continued lines.
    self.output_paren_level = 0 # Number of unmatched left parens in output.
    self.prev_sig_token = None # Previous non-whitespace token.
    self.stack = None # Stack of ParseState objects, set in format.
    # Settings...
    self.delete_blank_lines = False
    self.tab_width = 4
</t>
<t tx="ekr.20160220103223.40">
def push(self, kind, value=None):
    '''Append a state to the state stack.'''
    trace = False
    self.stack.append(ParseState(kind, value))
    if trace and kind == 'tuple':
        g.trace(kind, value, g.callers(2))
</t>
<t tx="ekr.20160220103223.7">
def format(self, tokens):
    '''The main line of CoffeeScriptTokenizer class.'''
    trace = False
    self.code_list = []
    self.stack = self.StateStack()
    self.gen_file_start()
    for token5tuple in tokens:
        t1, t2, t3, t4, t5 = token5tuple
        srow, scol = t3
        self.kind = token_module.tok_name[t1].lower()
        self.val = g.toUnicode(t2)
        self.raw_val = g.toUnicode(t5)
        if srow != self.last_line_number:
            # Handle a previous backslash.
            if self.backslash_seen:
                self.gen_backslash()
            # Start a new row.
            raw_val = self.raw_val.rstrip()
            self.backslash_seen = raw_val.endswith('\\')
            # g.trace('backslash_seen',self.backslash_seen)
            if self.output_paren_level &gt; 0:
                s = self.raw_val.rstrip()
                n = g.computeLeadingWhitespaceWidth(s, self.tab_width)
                # This n will be one-too-many if formatting has
                # changed: foo (
                # to:      foo(
                self.gen_line_indent(ws=' ' * n)
                    # Do not set self.lws here!
            self.last_line_number = srow
        if trace: g.trace('%10s %r'% (self.kind,self.val))
        func = getattr(self, 'do_' + self.kind, None)
        if func: func()
    self.gen_file_end()
    return ''.join([z.to_string() for z in self.code_list])
</t>
<t tx="ekr.20160220103223.8">
#
# Input token handlers...
#</t>
<t tx="ekr.20160220103223.9">
def do_comment(self):
    '''Handle a comment token.'''
    raw_val = self.raw_val.rstrip()
    val = self.val.rstrip()
    entire_line = raw_val.lstrip().startswith('#')
    self.backslash_seen = False
        # Putting the comment will put the backslash.
    if entire_line:
        self.clean('line-indent')
        self.add_token('comment', raw_val)
    else:
        self.gen_blank()
        self.add_token('comment', val)
</t>
<t tx="ekr.20160220104209.1">
def isString(self, s):
    '''Return True if s is any string, but not bytes.'''
    if isPython3:
        return type(s) == type('a')
    else:
        return type(s) in types.StringTypes

def isUnicode(self, s):
    '''Return True if s is a unicode string.'''
    if isPython3:
        return type(s) == type('a')
    else:
        return type(s) == types.UnicodeType
</t>
<t tx="ekr.20160220104316.1">
def computeLeadingWhitespace(self, width, tab_width):
    '''Returns optimized whitespace corresponding to width with the indicated tab_width.'''
    if width &lt;= 0:
        return ""
    elif tab_width &gt; 1:
        tabs = int(width / tab_width)
        blanks = int(width % tab_width)
        return ('\t' * tabs) + (' ' * blanks)
    else: # Negative tab width always gets converted to blanks.
        return (' ' * width)
</t>
<t tx="ekr.20160220104523.1">
def toUnicode(self, s, encoding='utf-8', reportErrors=False):
    '''Connvert a non-unicode string with the given encoding to unicode.'''
    trace = False
    if g.isUnicode(s):
        return s
    if not encoding:
        encoding = 'utf-8'
    # These are the only significant calls to s.decode in Leo.
    # Tracing these calls directly yields thousands of calls.
    # Never call g.trace here!
    try:
        s = s.decode(encoding, 'strict')
    except UnicodeError:
        s = s.decode(encoding, 'replace')
        if trace or reportErrors:
            g.trace(g.callers())
            print("toUnicode: Error converting %s... from %s encoding to unicode" % (
                s[: 200], encoding))
    except AttributeError:
        if trace:
            print('toUnicode: AttributeError!: %s' % s)
        # May be a QString.
        s = g.u(s)
    if trace and encoding == 'cp1252':
        print('toUnicode: returns %s' % s)
    return s
</t>
<t tx="ekr.20160220104732.1">
if isPython3:

    def u(self, s):
        return s

    def ue(self, s, encoding):
        return s if g.isUnicode(s) else str(s, encoding)

else:

    def u(self, s):
        return unicode(s)

    def ue(self, s, encoding):
        return unicode(s, encoding)
</t>
<t tx="ekr.20160220105138.1">
def computeLeadingWhitespaceWidth(self, s, tab_width):
    '''Returns optimized whitespace corresponding to width with the indicated tab_width.'''
    w = 0
    for ch in s:
        if ch == ' ':
            w += 1
        elif ch == '\t':
            w += (abs(tab_width) - (w % abs(tab_width)))
        else:
            break
    return w
</t>
<t tx="ekr.20160220110252.1">

class ReadLinesClass:
    """A class whose next method provides a readline method for Python's tokenize module."""

    def __init__(self, s):
        self.lines = s.splitlines(True) if s else []
            # g.splitLines(s)
        self.i = 0

    def next(self):
        if self.i &lt; len(self.lines):
            line = self.lines[self.i]
            self.i += 1
        else:
            line = ''
        # g.trace(repr(line))
        return line

    __next__ = next
</t>
<t tx="ekr.20160220143251.1">
def gen_class_or_def(self, name):
    
    # g.trace(self.level, name)
    self.decorator_seen = False
    if self.stack.has('decorator'):
        self.stack.remove('decorator')
        self.clean_blank_lines()
        self.gen_line_end()
    else:
        self.gen_blank_lines(1)
    self.stack.push(name, self.level)
        # name is 'class' or 'def'
        # do_dedent pops these entries.
    if name == 'def':
        self.in_def_line = True
        self.in_class_line = False
        self.def_name_seen = False
    else:
        self.extends_flag = False
        self.in_class_line = True
        self.gen_word(name)</t>
<t tx="ekr.20160220143629.1">
def gen_colon(self):
    
    val = self.val
    assert val == ':', val
    if self.in_def_line:
        if self.input_paren_level == 0:
            self.in_def_line = False
            self.gen_op('-&gt;')
    elif self.in_class_line:
        if self.input_paren_level == 0:
            self.in_class_line = False
    else:
        pass
        # TODO
        # Some colons are correct.
        # self.gen_op_blank(val)
</t>
<t tx="ekr.20160220143842.1">
def gen_open_paren(self):
    
    val = self.val
    assert val == '(', val
    self.input_paren_level += 1
    if self.in_class_line:
        if not self.extends_flag:
            self.gen_word('extends')
            self.extends_flag = True
    else:
        # Generate a function call or a list.
        self.gen_lt(val)
    self.after_self = False
</t>
<t tx="ekr.20160220143853.1">
def gen_close_paren(self):
    
    val = self.val
    assert val == ')', val
    self.input_paren_level -= 1
    if self.in_class_line:
        self.in_class_line = False
    else:
        self.gen_rt(val)
    self.after_self = False
</t>
<t tx="ekr.20160220144848.1">
def gen_import(self, name):
    '''Convert an import to something that looks like a call.'''
    self.gen_word('pass')
    self.add_token('comment', '# ' + name)
</t>
<t tx="ekr.20160220151109.1">
def has(self, kind):
    '''Return True if state.kind == kind for some ParseState on the stack.'''
    return any([z.kind == kind for z in self.stack])</t>
<t tx="ekr.20160220151729.1">
def gen_self(self):
    if self.in_def_line:
        self.after_self = True
    else:
        self.gen_blank_op('@')
        self.after_self = True
</t>
<t tx="ekr.20160220151922.1">
def gen_period(self):
    
    val = self.val
    assert val == '.', val
    if self.after_self:
        self.after_self = False
    else:
        self.gen_op_no_blanks(val)
</t>
<t tx="ekr.20160220152030.1">
def gen_at(self):
    
    val = self.val
    assert val == '@', val
    if not self.decorator_seen:
        self.gen_blank_lines(1)
        self.decorator_seen = True
    self.gen_op_no_blanks(val)
    self.stack.push('decorator')</t>
<t tx="ekr.20160220160809.1">
def gen_comma(self):
    
    val = self.val
    assert val == ',', val
    if self.after_self:
        self.after_self = False
    else:
        # Pep 8: Avoid extraneous whitespace immediately before
        # comma, semicolon, or colon.
        self.gen_op_blank(val)
</t>
<t tx="ekr.20160220174952.1">
def remove(self, kind):
    '''Remove the last state on the stack of the given kind.'''
    trace = False
    n = len(self.stack)
    i = n - 1
    found = None
    while 0 &lt;= i:
        state = self.stack[i]
        if state.kind == kind:
            found = state
            self.stack = self.stack[:i] + self.stack[i+1:]
            assert len(self.stack) == n-1, (len(self.stack), n-1)
            break
        i -= 1
    if trace and kind == 'tuple':
        kind = found and found.kind or 'fail'
        value = found and found.value or 'fail'
        g.trace(kind, value, g.callers(2))
</t>
<t tx="ekr.20160220175541.1">
def get(self, kind):
    '''Return the last state of the given kind, leaving the stack unchanged.'''
    n = len(self.stack)
    i = n - 1
    while 0 &lt;= i:
        state = self.stack[i]
        if state.kind == kind:
            return state
        i -= 1
    return None
</t>
<t tx="ekr.20160221024549.1">

class StateStack(object):
    '''
    A class representing a stack of ParseStates and encapsulating various
    operations on same.
    '''
    
    def __init__(self):
        '''Ctor for ParseStack class.'''
        self.stack = []
    @others</t>
<t tx="ekr.20160221025511.1">
def pop(self):
    '''Pop the state on the stack and return it.'''
    return self.stack.pop()</t>
<t tx="ekr.20160221070924.1">
### Quick Start

1. Put `py2cs.py` on your path.

2. Enter a directory containing .py files:

        cd myDirectory
    
3. Generate foo.coffee from foo.py:

        py2cs foo.py

4. Look at foo.coffee to see the generated coffeescript code:

        edit foo.coffee

5. (Optional) Run coffeescript itself on the code:

        coffee foo.coffee

6. Regenerate foo.coffee, overwriting the previous .coffee file:

        py2cs.py foo.py -o
   
7. (Optional) Specify a configuration file containing defaults:

        py2cs.py -c myConfigFile.cfg -o
</t>
<t tx="ekr.20160221071222.1">
### Command-line arguments

    Usage: py2cs.py [options] file1, file2, ...
    
    Options:
      -h, --help          show this help message and exit
      -c FN, --config=FN  full path to configuration file
      -d DIR, --dir=DIR   full path to the output directory
      -o, --overwrite     overwrite existing .coffee files
      -v, --verbose       verbose output

*Note*: glob.glob wildcards can be used in file1, file2, ...
</t>
<t tx="ekr.20160221071334.1">
### Overview

This script makes a [coffeescript](http://coffeescript.org/) (.coffee) file in the output directory for each source file listed on the command line (wildcard file names are supported). This script never creates directories automatically, nor does it overwrite .coffee files unless the --overwrite command-line option is in effect.

This script merely converts python syntax to the roughly equivalent coffeescript syntax. It knows nothing about coffeescript semantics. It is intended *only* to help start creating coffeescript code from an existing python code base.

This script already does much of the grunt work of converting python to coffeescript. The script processes itself without error, but coffeescript itself complains about some results.
</t>
<t tx="ekr.20160221071354.1">
### Rationale

The proximate cause for this script were the notes from a [DropBox sprint](https://blogs.dropbox.com/tech/2012/09/dropbox-dives-into-coffeescript/). Coffeescript is obviously successful. Numerous python-to-javascript systems seem unlikely ever to gain traction. Googling 'python to javascript' or 'python to coffeescript' yields no similar tools, despite many similar searches. This script will be useful to me.
</t>
<t tx="ekr.20160221071735.1">
### Summary

py2cs.py could be improved, but it is useful as is. 

Edward K. Ream  
February 21 to 25, 2016
</t>
<t tx="ekr.20160221143000.1">

class TokenSync(object):
    '''A class to sync and remember tokens.'''
    # To do: handle comments, line breaks...
    @others
</t>
<t tx="ekr.20160221143402.1">
def __init__(self, s, tokens):
    '''Ctor for TokenSync class.'''
    assert isinstance(tokens, list) # Not a generator.
    self.s = s
    self.first_leading_line = None
    self.lines = [z.rstrip() for z in g.splitLines(s)]
    # Order is important from here on...
    self.nl_token = self.make_nl_token()
    self.line_tokens = self.make_line_tokens(tokens)
    self.blank_lines = self.make_blank_lines()
    self.string_tokens = self.make_string_tokens()
    self.ignored_lines = self.make_ignored_lines()
</t>
<t tx="ekr.20160222023117.1">
def spam():
    b = 2


class TestClass(object):
    
    def do_BinOp(self, node):
        return '%s%s%s' % (
            self.visit(node.left),
            self.op_name(node.op),
            self.visit(node.right))


</t>
<t tx="ekr.20160222040422.1">@language rest
@wrap

This is the theory of operation document for py2cs.py.

@others



</t>
<t tx="ekr.20160222081027.1">
def line_at(self, node, continued_lines=True):
    '''Return the lines at the node, possibly including continuation lines.'''
    n = getattr(node, 'lineno', None)
    if n is None:
        return '&lt;no line&gt; for %s' % node.__class__.__name__
    elif continued_lines:
        aList, n = [], n-1
        while n &lt; len(self.lines):
            s = self.lines[n]
            if s.endswith('\\'):
                aList.append(s[:-1])
                n += 1
            else:
                aList.append(s)
                break
        return ''.join(aList)
    else:
        return self.lines[n-1]
</t>
<t tx="ekr.20160222084258.1">
def make_line_tokens(self, tokens):
    '''
    Return a list of lists of tokens for each list in self.lines.
    The strings in self.lines may end in a backslash, so care is needed.
    '''
    trace = False
    n, result = len(self.lines), []
    for i in range(0, n+1):
        result.append([])
    for token in tokens:
        t1, t2, t3, t4, t5 = token
        kind = token_module.tok_name[t1].lower()
        srow, scol = t3
        erow, ecol = t4
        line = erow-1 if kind == 'string' else srow-1 
        result[line].append(token)
        if trace: g.trace('%3s %s' % (line, self.dump_token(token)))
    assert len(self.lines) + 1 == len(result), len(result)
    return result
</t>
<t tx="ekr.20160222084401.1">
def make_string_tokens(self):
    '''Return a copy of line_tokens containing only string tokens.'''
    result = []
    for aList in self.line_tokens:
        result.append([z for z in aList if self.token_kind(z) == 'string'])
    assert len(result) == len(self.line_tokens)
    return result
</t>
<t tx="ekr.20160222091458.1">
def __init__(self, controller):
    '''Ctor for CoffeeScriptFormatter class.'''
    self.controller = controller
    self.class_stack = []
    # Redirection. Set in format.
    self.sync_string = None
    self.last_node = None
    self.leading_lines = None
    self.leading_string = None
    self.tokens_for_statement = None
    self.trailing_comment = None
    self.trailing_comment_at_lineno = None
    </t>
<t tx="ekr.20160222091644.1">
def sync_string(self, node):
    '''Return the spelling of the string at the given node.'''
    # g.trace('%-10s %2s: %s' % (' ', node.lineno, self.line_at(node)))
    n = node.lineno
    tokens = self.string_tokens[n-1]
    if tokens:
        token = tokens.pop(0)
        self.string_tokens[n-1] = tokens
        return self.token_val(token)
    else:
        g.trace('===== underflow', n, node.s)
        return node.s
</t>
<t tx="ekr.20160222124401.1">
def token_kind(self, token):
    '''Return the token's type.'''
    t1, t2, t3, t4, t5 = token
    return g.toUnicode(token_module.tok_name[t1].lower())

def token_raw_val(self, token):
    '''Return the value of the token.'''
    t1, t2, t3, t4, t5 = token
    return g.toUnicode(t5)
    
def token_val(self, token):
    '''Return the raw value of the token.'''
    t1, t2, t3, t4, t5 = token
    return g.toUnicode(t2)
</t>
<t tx="ekr.20160222130449.1">
def make_ignored_lines(self):
    '''
    Return a copy of line_tokens containing ignored lines,
    that is, full-line comments or blank lines.
    These are the lines returned by leading_lines().
    '''
    result = []
    for i, aList in enumerate(self.line_tokens):
        for z in aList:
            if self.is_line_comment(z):
                result.append(z)
                break
        else:
            if i in self.blank_lines:
                result.append(self.nl_token)
            else:
                result.append(None)
    assert len(result) == len(self.line_tokens)
    for i, aList in enumerate(result):
        if aList:
            self.first_leading_line = i
            break
    else:
        self.first_leading_line = len(result)
    return result
</t>
<t tx="ekr.20160222132448.1">
def leading_lines(self, node):
    '''Return a list of the preceding comment and blank lines'''
    # This can be called on arbitrary nodes.
    trace = False
    leading = []
    if hasattr(node, 'lineno'):
        i, n = self.first_leading_line, node.lineno
        while i &lt; n:
            token = self.ignored_lines[i]
            if token:
                s = self.token_raw_val(token).rstrip()+'\n'
                leading.append(s)
                if trace: g.trace('%11s: %s' % (i, s.rstrip()))
            i += 1
        self.first_leading_line = i
    return leading
</t>
<t tx="ekr.20160223013055.1">
def dump_token(self, token, verbose=False):
    '''Dump the token. It is either a string or a 5-tuple.'''
    if g.isString(token):
        return token
    else:
        t1, t2, t3, t4, t5 = token
        kind = g.toUnicode(token_module.tok_name[t1].lower())
        raw_val = g.toUnicode(t5)
        val = g.toUnicode(t2)
        if verbose:
            return 'token: %10s %r' % (kind, val)
        else:
            return val
</t>
<t tx="ekr.20160223022613.1">
def is_line_comment(self, token):
    '''Return True if the token represents a full-line comment.'''
    t1, t2, t3, t4, t5 = token
    kind = token_module.tok_name[t1].lower()
    raw_val = t5
    return kind == 'comment' and raw_val.lstrip().startswith('#')
</t>
<t tx="ekr.20160223023354.1">
def make_blank_lines(self):
    '''Return of list of line numbers of blank lines.'''
    result = []
    for i, aList in enumerate(self.line_tokens):
        # if any([self.token_kind(z) == 'nl' for z in aList]):
        if len(aList) == 1 and self.token_kind(aList[0]) == 'nl':
            result.append(i)
    return result
</t>
<t tx="ekr.20160223031552.1">
def make_nl_token(self):
    '''Return a newline token with '\n' as both val and raw_val.'''
    t1 = token_module.NEWLINE
    t2 = '\n'
    t3 = (0, 0) # Not used.
    t4 = (0, 0) # Not used.
    t5 = '\n'
    return t1, t2, t3, t4, t5
</t>
<t tx="ekr.20160223042247.1">
def trailing_comment(self, node):
    '''
    Return a string containing the trailing comment for the node, if any.
    The string always ends with a newline.
    '''
    if hasattr(node, 'lineno'):
        return self.trailing_comment_at_lineno(node.lineno)
    else:
        g.trace('no lineno', node.__class__.__name__, g.callers())
        return '\n'
</t>
<t tx="ekr.20160223043329.1">
def leading_string(self, node):
    '''Return a string containing all lines preceding node.'''
    return ''.join(self.leading_lines(node))</t>
<t tx="ekr.20160223061445.1">
def trailing_comment_at_lineno(self, lineno):
    '''Return any trailing comment at the given node.lineno.'''
    trace = False
    tokens = self.line_tokens[lineno-1]
    for token in tokens:
        if self.token_kind(token) == 'comment':
            raw_val = self.token_raw_val(token).rstrip()
            if not raw_val.strip().startswith('#'):
                val = self.token_val(token).rstrip()
                s = ' %s\n' % val
                if trace: g.trace(lineno, s.rstrip(), g.callers())
                return s
    return '\n'</t>
<t tx="ekr.20160223093155.1">
def last_node(self, node):
    '''Return the node of node's tree with the largest lineno field.'''

    class LineWalker(ast.NodeVisitor):
        
        def __init__ (self):
            '''Ctor for LineWalker class.'''
            self.node = None
            self.lineno = -1
            
        def visit(self, node):
            '''LineWalker.visit.'''
            if hasattr(node, 'lineno'):
                if node.lineno &gt; self.lineno:
                    self.lineno = node.lineno
                    self.node = node
            if isinstance(node, list):
                for z in node:
                    self.visit(z)
            else:
                self.generic_visit(node)
 
    w = LineWalker()
    w.visit(node)
    return w.node
            </t>
<t tx="ekr.20160223095542.1">
def tail_after_body(self, body, aList, result):
    '''
    Return the tail of the 'else' or 'finally' statement following the given body.
    aList is the node.orelse or node.finalbody list.
    '''
    node = self.last_node(body)
    if node:
        max_n = node.lineno
        leading = self.leading_lines(aList[0])
        if leading:
            result.extend(leading)
            max_n += len(leading)
        tail = self.trailing_comment_at_lineno(max_n + 1)
    else:
        tail = '\n'
    return tail
</t>
<t tx="ekr.20160223102112.1">
def trailing_lines(self):
    '''return any remaining ignored lines.'''
    trace = False
    trailing = []
    i = self.first_leading_line
    while i &lt; len(self.ignored_lines):
        token = self.ignored_lines[i]
        if token:
            s = self.token_raw_val(token).rstrip()+'\n'
            trailing.append(s)
            if trace: g.trace('%11s: %s' % (i, s.rstrip()))
        i += 1
    self.first_leading_line = i
    return trailing
</t>
<t tx="ekr.20160223132520.1">'''
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
                
            for i in range(10): # after for.
                pass
            else: # after for-else.
                pass

        def inner1(self):
            """inner1 docstring"""

    def test1(a):
        print(a) # trailing comment

    def test2():
        pass
        
def eggs():
    pass</t>
<t tx="ekr.20160223132554.1">    # class InnerClass(object, str):
        # # Comment 1.
        # def __init__(self, a):
            # '''Ctor for InnerClass'''
            # if a: # after if
                # self.a = a
            # else: # after else
                # pass
                
            # for i in range(10): # after for.
                # pass
            # else: # after for-else.
                # pass

        # def inner1(self):
            # """inner1 docstring"""

    # def test1(a):
        # print(a) # trailing comment

    # def test2():
        # pass
        
# def eggs():
    # pass
</t>
<t tx="ekr.20160224044823.1">
def tokens_for_statement(self, node):
    
    assert isinstance(node, ast.AST), node
    name = node.__class__.__name__
    if hasattr(node, 'lineno'):
        tokens = self.line_tokens[node.lineno-1]
        g.trace(' '.join([self.dump_token(z) for z in tokens]))
    else:
        g.trace('no lineno', name)

    
    
</t>
<t tx="ekr.20160224050441.10">
# Python 2.x only

def Exec(self, node):
    
    tokens = ['exec']
    globals_ = hasattr(node, 'globals') and self.visit(node.globals)
    locals_ = hasattr(node, 'locals') and self.visit(node.locals)
    if globals_:
        tokens.extend(globals_)
    if globals_ and locals_:
        tokens.append(',')
    if locals_:
        tokens.extend(locals_)
    return tokens</t>
<t tx="ekr.20160224050441.11">
def Expr(self, node):
    '''An outer expression.'''
    return self.visit(node.value)
</t>
<t tx="ekr.20160224050441.12">
def For(self, node):
    
    tokens = ['for']
    tokens.extend(self.visit(node.target))
    tokens.append('in')
    tokens.extend(self.visit(node.iter))
    for z in node.body:
        tokens.extend(self.visit(z))
    if node.orelse:
        tokens.append('else')
        for z in node.orelse:
            tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224050441.13">
def Global(self, node):

    return ['global'] + self.join(node.names)
</t>
<t tx="ekr.20160224050441.14">
def If(self, node):

    tokens = ['if']
    tokens.extend(self.visit(node.test))
    for z in node.body:
        tokens.extend(self.visit(z))
    if node.orelse:
        tokens.append('else:')
        for z in node.orelse:
            tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224050441.15">
def Import(self, node):

    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append(fn + 'as' + asname)
        else:
            names.append(fn)
    return ['import'] + self.join(names)
</t>
<t tx="ekr.20160224050441.16">
def get_import_names(self, node):
    '''Return a list of the the full file names in the import statement.'''
    # This is a helper: it does not return tokens.
    result = []
    for ast2 in node.names:
        assert isinstance(ast2, ast.alias)
        data = ast2.name, ast2.asname
        result.append(data)
    return result
</t>
<t tx="ekr.20160224050441.17">
def ImportFrom(self, node):

    tokens = ['from', node.module, 'import']
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append(fn + 'as' + asname)
        else:
            names.append(fn)
    return tokens + self.join(names)
</t>
<t tx="ekr.20160224050441.18">
def Pass(self, node):
    
    return ['pass']
</t>
<t tx="ekr.20160224050441.19">
# Python 2.x only

def Print(self, node):
    
    tokens, vals = [], []
    for z in node.values:
        vals.extend(self.visit(z))
    if getattr(node, 'dest', None) is not None:
        vals.extend('dest', '=')
        vals.extend(self.visit(node.dest))
    if hasattr(node, 'nl') and node.nl == 'False':
        vals.extend(['nl', '=', 'False'])
    if vals:
        tokens.extend(self.join(vals))
    return tokens
</t>
<t tx="ekr.20160224050441.20">
def Raise(self, node):
    
    args = []
    for attr in ('type', 'inst', 'tback'):
        if hasattr(node, attr, None) is not None:
            args.extend(self.visit(getattr(node, attr)))
    return ['raise'] + self.join(args)
</t>
<t tx="ekr.20160224050441.21">
def Return(self, node):

    return ['return'] + self.visit(node.value)
</t>
<t tx="ekr.20160224050441.22">
# Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

def Try(self, node): # Python 3

    tokens = ['try']
    for z in node.body:
        tokens.extend(self.visit(z))
    for z in node.handlers or []:
        tokens.extend(self.visit(z))
    if node.orelse:
        tokens.append('else:')
        for z in node.orelse:
            tokens.extend(self.visit(z))
    if node.finalbody:
        tokens.append('finally')
        for z in node.finalbody:
            tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224050441.23">
def TryExcept(self, node):

    tokens = ['try:']
    for z in node.body:
        tokens.extend(self.visit(z))
    for z in node.handlers or []:
        tokens.extend(self.visit(z))
    if node.orelse:
        tokens.append('else:')
        for z in node.orelse:
            tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224050441.24">
def TryFinally(self, node):
    
    tokens = ['try:']
    for z in node.body:
        tokens.extend(self.visit(z))
    tokens.append('finally:')
    for z in node.finalbody:
        tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224050441.25">
def While(self, node):

    tokens = ['while']
    tokens.extend(self.visit(node.test))
    for z in node.body:
        tokens.extend(self.visit(z))
    if node.orelse:
        tokens.append('else:')
        for z in node.orelse:
            tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224050441.26">
def With(self, node):

    tokens = ['with']
    if getattr(node, 'context_expression', None) is not None:
        tokens.extend(self.visit(node.context_expresssion))
    vars_list = []
    if getattr(node, 'optional_vars', None) is not None:
        try:
            for z in node.optional_vars:
                vars_list.append(self.visit(z))
        except TypeError: # Not iterable.
            vars_list.append(self.visit(node.optional_vars))
    tokens.extend(self.join(vars_list))
    tokens.append(':' )
    for z in node.body:
        tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224050441.27">
def Yield(self, node):
    
    if getattr(node, 'value', None) is not None:
        return ['yield'] + self.visit(node.value)
    else:
        return ['yield']
</t>
<t tx="ekr.20160224050441.3">
def Assert(self, node):

    tokens = ['assign']
    tokens.extend(self.visit(node.test))
    if getattr(node, 'msg', None) is not None:
        tokens.append(',')
        tokens.extend(self.visit(node.msg))
    return tokens
</t>
<t tx="ekr.20160224050441.4">
def Assign(self, node):

    targets = []
    for z in targets:
        targets.extend(self.visit(z))
    tokens = self.join(targets, '=')
    tokens.append('=')
    tokens.extend(self.visit(node.value))
    return tokens
</t>
<t tx="ekr.20160224050441.5">
def AugAssign(self, node):

    tokens = [self.visit(node.target)]
    tokens.append(op_name(node.op)+'=')
    tokens.extend(self.visit(node.value))
    return tokens
</t>
<t tx="ekr.20160224050441.6">
def Break(self, node):

    return ['break']
    </t>
<t tx="ekr.20160224050441.7">
def Continue(self, node):

    return ['continue']
</t>
<t tx="ekr.20160224050441.8">
def Delete(self, node):
    
    targets = []
    for z in node.targets:
        targets.extend(self.visit(z))
    return ['del'] + self.join(targets)
</t>
<t tx="ekr.20160224050441.9">
def ExceptHandler(self, node):
    
    tokens = ['except']
    if getattr(node, 'type', None) is not None:
        tokens.extend(self.visit(node.type))
    if getattr(node, 'name', None) is not None:
        tokens.append('as')
        if isinstance(node.name, ast.AST):
            tokens.extend(self.visit(node.name))
        else:
            tokens.append(node.name) # Python 3.x.
    tokens.append(':')
    for z in node.body:
        tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224052722.1">
def op_name(node,strict=True):
    '''Return the print name of an operator node.'''
    d = {
        # Binary operators. 
        'Add':       '+',
        'BitAnd':    '&amp;',
        'BitOr':     '|',
        'BitXor':    '^',
        'Div':       '/',
        'FloorDiv':  '//',
        'LShift':    '&lt;&lt;',
        'Mod':       '%',
        'Mult':      '*',
        'Pow':       '**',
        'RShift':    '&gt;&gt;',
        'Sub':       '-',
        # Boolean operators.
        'And':   ' and ',
        'Or':    ' or ',
        # Comparison operators
        'Eq':    '==',
        'Gt':    '&gt;',
        'GtE':   '&gt;=',
        'In':    ' in ',
        'Is':    ' is ',
        'IsNot': ' is not ',
        'Lt':    '&lt;',
        'LtE':   '&lt;=',
        'NotEq': '!=',
        'NotIn': ' not in ',
        # Context operators.
        'AugLoad':  '&lt;AugLoad&gt;',
        'AugStore': '&lt;AugStore&gt;',
        'Del':      '&lt;Del&gt;',
        'Load':     '&lt;Load&gt;',
        'Param':    '&lt;Param&gt;',
        'Store':    '&lt;Store&gt;',
        # Unary operators.
        'Invert':   '~',
        'Not':      ' not ',
        'UAdd':     '+',
        'USub':     '-',
    }
    kind = node.__class__.__name__
    name = d.get(kind,'&lt;%s&gt;' % kind)
    if strict: assert name, kind
    return name
</t>
<t tx="ekr.20160224053149.1">
def join(self, aList, sep=','):
    '''return the items of the list joined by sep string.'''
    tokens = []
    for i, token in enumerate(aList or []):
        tokens.append(token)
        if i &lt; len(aList) -1:
            tokens.append(sep)
    return tokens
</t>
<t tx="ekr.20160224065148.2">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def ClassDef(self, node, include_body=True):

    tokens = ['class', node.name]
    if node.bases:
        tokens.append('(')
        for z in node.bases:
            tokens.extend(self.visit(z))
        tokens.append(')')
    tokens.append('\n')
    if include_body:
        for z in node.body:
            tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224065148.3">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def FunctionDef(self, node, include_body=True):
    '''Format a FunctionDef node.'''
    tokens = []
    for z in node.decorator_list or []:
        tokens.extend(['@'] + self.visit(z) + ['\n'])
    tokens.extend(['def', node.name, '('])
    if node.args:
        tokens.extend(self.join(self.visit(node.args)))
    tokens.extend([':', '\n'])
    if include_body:
        for z in node.body:
            tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224065148.5">
def Module(self, node):
    
    tokens = []
    for z in node.body:
        tokens.extend(self.visit(z))
    return tokens
</t>
<t tx="ekr.20160224065148.6">
# def Lambda(self, node):
    # return self.indent('lambda %s: %s' % (
        # self.visit(node.args),
        # self.visit(node.body)))
</t>
<t tx="ekr.20160224073722.1">
def tokens_for_statement(self, node):
    
    if node is None:
        return []
    else:
        assert isinstance(node, ast.AST), node
        name = node.__class__.__name__
        func = getattr(self, name, None)
        g.trace('%12s' % (name))
        tokens = func(node) if func else []
        g.trace('%12s %s' % (name,
            ' '.join([self.dump_token(z) for z in tokens])))
        return tokens
        
visit = tokens_for_statement


</t>
<t tx="ekr.20160224082000.1"></t>
<t tx="ekr.20160224082013.1">
def visit(self, node):
    '''Return the formatted version of an Ast node, or list of Ast nodes.'''
    testing = False
    name = node.__class__.__name__
    if testing:
        if isinstance(node, (list, tuple)):
            tokens = []
            for z in node:
                tokens.extend(self.sync.tokens_for_statement(z))
            return tokens
        elif node is None:
            return []
        else:
            assert isinstance(node, ast.AST), name
            tokens = self.sync.tokens_for_statement(node)
            return tokens
    else: # Normal.
        if isinstance(node, (list, tuple)):
            return ', '.join([self.visit(z) for z in node])
        elif node is None:
            return 'None'
        else:
            assert isinstance(node, ast.AST), name
            method = getattr(self, 'do_' + name)
            s = method(node)
            if isPython3:
                assert isinstance(s, str)
            else:
                assert isinstance(s, (str, unicode))
            return s
</t>
<t tx="ekr.20160225071548.1">
def check_strings(self):
    '''Check that all strings have been consumed.'''
    # g.trace(len(self.string_tokens))
    for i, aList in enumerate(self.string_tokens):
        if aList:
            g.trace('warning: line %s. unused strings: %s' % (i, aList))</t>
<t tx="ekr.20160225103047.1">
### Using the TokenSync class

The present code is driven by ast trees, but each visitor of the CoffeeScriptTraverser class takes care to preserve **otherwise-ignored tokens**. These are tokens that would otherwise be ignored: namely blank lines and comments, both entire-line comments and trailing comments.

The visitor for each statement intersperses otherwise ignored tokens using calls to the TokenSync class.  The simplest cases are like this:

    def do_Break(self, node):
        head = self.leading_string(node)
        tail = self.trailing_comment(node)
        return head + self.indent('break') + tail

The leading_string and trailing_comment methods simply redirect to the corresponding methods in the TokenSync class.  Saves a bit of typing. Compound statements are a bit more bother, but not overly so. For example:

    def do_If(self, node):
   
        result = self.leading_lines(node)
        tail = self.trailing_comment(node)
        s = 'if %s:%s' % (self.visit(node.test), tail)
        result.append(self.indent(s))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.orelse:
            tail = self.tail_after_body(node.body, node.orelse, result)
            result.append(self.indent('else:' + tail))
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

The line:

        tail = self.tail_after_body(node.body, node.orelse, result)

is a hack needed to compensate for the lack of an actual ast.Else node.
</t>
<t tx="ekr.20160225103140.1">
### The problem

The initial version of py2cs.py (the script) used only tokens. This solved all token-related problems, but made parsing difficult. Alas, it is [difficult](http://stackoverflow.com/questions/16748029/how-to-get-source-corresponding-to-a-python-ast-node) to associate tokens with ast nodes.

The script needs the following token-related data:

- The **ignored lines** (comment lines and blank lines) that precede any statement.

- The **trailing comment** strings that might follow any line.

- Optionally, the **line breaks** occurring within lines. At present, this script does not preserve such breaks, and it's probably not worth doing. Indeed, automatically breaking long lines seems more useful, especially considering that coffeescript lines may be substantially shorter than the corresponding python lines.

- The **exact spelling** of all strings.

The [ast_utils module](
https://bitbucket.org/plas/thonny/src/3b71fda7ac0b66d5c475f7a668ffbdc7ae48c2b5/thonny/ast_utils.py?at=master) purports to solve this problem with convoluted adjustments to the col_offset field. This approach is subject to subtle Python bugs, and subtle differences between Python 2 and Python 3. There is a better way...
</t>
<t tx="ekr.20160225103215.1">
### Summary

The TokenSync class is, a new, elegant, unexpected and happy development. It is a relatively easy-to-use helper that allows parser-based code to preserve data that is not easily accessible in parse trees.

The TokenSync class avoids [problems with the col_offset field](
http://stackoverflow.com/questions/16748029/how-to-get-source-corresponding-to-a-python-ast-node) in ast nodes. The TokenSync class depends only on the ast.lineno field and the tokenize module. We can expect it to be rock solid.

Edward K. Ream  
February 20 to 25, 2016
</t>
<t tx="ekr.20160225104246.1">
### Design

The main idea is to use *only* the ast.lineno fields and the tokenizer module to recreate token data. The design assumes only that both the ast.lineno field and Python's tokenizer module are solid. This is a much more reasonable assumption than assuming that the col_offset field always tells the truth. In short, this design *ignores* the ast.col_offset field.

At startup, the TokenSync ctor assigns all the incoming tokens to various lists.  These lists are indexed by lineno:

    ts.line_tokens[i]: all the tokens on line i
    ts.string_tokens[i]: all string tokens on line i
    st.ignored_lines: the blank or comment line on line i
    
It is very easy to create these lists. The code does not depend on any arcane details.

#### Recovering the exact spelling of stings.

ts.synch_string returns the *next* string on the line. Here it is, stripped of defensive code:

    def sync_string(self, node):
        '''Return the spelling of the string at the given node.'''
        tokens = self.string_tokens[node.lineno-1]
        token = tokens.pop(0)
        self.string_tokens[node.lineno-1] = tokens
        return self.token_val(token)
       
Stripped of defensive code, the do_Str visitor is just:

    def do_Str(self, node):
        '''A string constant, including docstrings.'''
        return self.sync_string(node)
        
#### Recovering otherwise ignored nodes

**ts.leading_lines(node)** returns a list of otherwise ignored lines that
precede the node's line that have not already been returned.
**ts.leading_string(node)** is a convenience method that returns ''.join(ts.leading_lines(node)). The visitors of the CoffeeScriptTraverser class show how to use these methods.
</t>
<t tx="ekr.20160225122323.1"></t>
</tnodes>
</leo_file>
