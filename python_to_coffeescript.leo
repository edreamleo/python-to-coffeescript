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
<v t="ekr.20160220051359.3"><vh>@button cfa-code</vh></v>
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
<v t="ekr.20160220051105.1"><vh>Unused</vh>
<v t="ekr.20160220050433.3"><vh> type functions</vh>
<v t="ekr.20160220050433.4"><vh>is_known_type</vh></v>
<v t="ekr.20160220050433.5"><vh>merge_types (not used)</vh></v>
<v t="ekr.20160220050433.6"><vh>reduce_types</vh></v>
</v>
<v t="ekr.20160220050433.84"><vh>class AstArgFormatter (AstFormatter)</vh>
<v t="ekr.20160220050433.85"><vh>sf.Constants &amp; Name</vh></v>
</v>
<v t="ekr.20160220050433.109"><vh>class ReduceTypes</vh>
<v t="ekr.20160220050433.110"><vh>rt.ctor</vh></v>
<v t="ekr.20160220050433.111"><vh>rt.is_known_type</vh></v>
<v t="ekr.20160220050433.112"><vh>rt.reduce_collection</vh></v>
<v t="ekr.20160220050433.113"><vh>rt.reduce_numbers</vh></v>
<v t="ekr.20160220050433.114"><vh>rt.reduce_types</vh></v>
<v t="ekr.20160220050433.115"><vh>rt.reduce_unknowns</vh></v>
<v t="ekr.20160220050433.116"><vh>rt.show</vh></v>
<v t="ekr.20160220050433.117"><vh>rt.split_types</vh></v>
</v>
<v t="ekr.20160220050433.134"><vh>class Stub(object)</vh>
<v t="ekr.20160220050433.135"><vh>stub.ctor</vh></v>
<v t="ekr.20160220050433.136"><vh>stub.__eq__ and __ne__</vh></v>
<v t="ekr.20160220050433.137"><vh>stub.__hash__</vh></v>
<v t="ekr.20160220050433.138"><vh>stub.__repr__and __str__</vh></v>
<v t="ekr.20160220050433.139"><vh>stub.parents and level</vh></v>
</v>
<v t="ekr.20160220050433.140"><vh>class StubFormatter (AstFormatter)</vh>
<v t="ekr.20160220050433.141"><vh>sf.ctor</vh></v>
<v t="ekr.20160220050433.142"><vh>sf.match_all</vh></v>
<v t="ekr.20160220050433.143"><vh>sf.visit</vh></v>
<v t="ekr.20160220050433.144"><vh>sf.trace_visitor</vh></v>
<v t="ekr.20160220050433.145"><vh>sf.Operands</vh>
<v t="ekr.20160220050433.146"><vh>sf.Attribute</vh></v>
<v t="ekr.20160220050433.147"><vh>sf.Constants: Bytes, Num, Str</vh></v>
<v t="ekr.20160220050433.148"><vh>sf.Dict</vh></v>
<v t="ekr.20160220050433.149"><vh>sf.List</vh></v>
<v t="ekr.20160220050433.150"><vh>sf.Name</vh></v>
<v t="ekr.20160220050433.151"><vh>sf.Tuple</vh></v>
</v>
<v t="ekr.20160220050433.152"><vh>sf.Operators</vh>
<v t="ekr.20160220050433.153"><vh>sf.BinOp</vh></v>
<v t="ekr.20160220050433.154"><vh>sf.BoolOp</vh></v>
<v t="ekr.20160220050433.155"><vh>sf.Call &amp; sf.keyword</vh>
<v t="ekr.20160220050433.156"><vh>sf.keyword</vh></v>
</v>
<v t="ekr.20160220050433.157"><vh>sf.Compare</vh></v>
<v t="ekr.20160220050433.158"><vh>sf.IfExp</vh></v>
<v t="ekr.20160220050433.159"><vh>sf.Subscript</vh></v>
<v t="ekr.20160220050433.160"><vh>sf.UnaryOp</vh></v>
</v>
<v t="ekr.20160220050433.161"><vh>sf.Return</vh></v>
</v>
<v t="ekr.20160220050433.162"><vh>class StubTraverser (ast.NodeVisitor)</vh>
<v t="ekr.20160220050433.163"><vh>st.ctor</vh></v>
<v t="ekr.20160220050433.164"><vh>st.add_stub</vh></v>
<v t="ekr.20160220050433.165"><vh>st.indent &amp; out</vh></v>
<v t="ekr.20160220050433.166"><vh>st.run (main line) &amp; helpers</vh>
<v t="ekr.20160220050433.167"><vh>st.output_stubs</vh></v>
<v t="ekr.20160220050433.168"><vh>st.output_time_stamp</vh></v>
<v t="ekr.20160220050433.169"><vh>st.update &amp; helpers</vh>
<v t="ekr.20160220050433.170"><vh>st.get_stub_file</vh></v>
<v t="ekr.20160220050433.171"><vh>st.parse_stub_file</vh></v>
<v t="ekr.20160220050433.172"><vh>st.merge_stubs &amp; helpers</vh>
<v t="ekr.20160220050433.173"><vh>st.check_delete</vh></v>
<v t="ekr.20160220050433.174"><vh>st.flatten_stubs</vh></v>
<v t="ekr.20160220050433.175"><vh>st.find_parent_stub</vh></v>
<v t="ekr.20160220050433.176"><vh>st.find_stub</vh></v>
<v t="ekr.20160220050433.177"><vh>st.sort_stubs_by_hierarchy</vh></v>
</v>
<v t="ekr.20160220050433.178"><vh>st.trace_stubs</vh></v>
</v>
</v>
<v t="ekr.20160220050433.179"><vh>st.visit_ClassDef</vh></v>
<v t="ekr.20160220050433.180"><vh>st.visit_FunctionDef &amp; helpers</vh>
<v t="ekr.20160220050433.181"><vh>st.format_arguments &amp; helper</vh>
<v t="ekr.20160220050433.182"><vh>st.munge_arg</vh></v>
</v>
<v t="ekr.20160220050433.183"><vh>st.format_returns &amp; helpers</vh>
<v t="ekr.20160220050433.184"><vh>st.format_return_expressions</vh></v>
<v t="ekr.20160220050433.185"><vh>st.get_def_name</vh></v>
<v t="ekr.20160220050433.186"><vh>st.remove_recursive_calls</vh></v>
</v>
</v>
<v t="ekr.20160220050433.187"><vh>st.visit_Return</vh></v>
</v>
<v t="ekr.20160220050433.95"><vh>class Pattern</vh>
<v t="ekr.20160220050433.96"><vh>pattern.ctor</vh></v>
<v t="ekr.20160220050433.97"><vh>pattern.__eq__, __ne__, __hash__</vh></v>
<v t="ekr.20160220050433.98"><vh>pattern.str &amp; repr</vh></v>
<v t="ekr.20160220050433.99"><vh>pattern.is_balanced</vh></v>
<v t="ekr.20160220050433.100"><vh>pattern.is_regex</vh></v>
<v t="ekr.20160220050433.101"><vh>pattern.all_matches &amp; helpers</vh>
<v t="ekr.20160220050433.102"><vh>pattern.full_balanced_match</vh></v>
<v t="ekr.20160220050433.103"><vh>pattern.match_balanced</vh></v>
</v>
<v t="ekr.20160220050433.104"><vh>pattern.match (trace-matches)</vh></v>
<v t="ekr.20160220050433.105"><vh>pattern.match_entire_string</vh></v>
<v t="ekr.20160220050433.106"><vh>pattern.replace &amp; helpers</vh>
<v t="ekr.20160220050433.107"><vh>pattern.replace_balanced</vh></v>
<v t="ekr.20160220050433.108"><vh>pattern.replace_regex</vh></v>
</v>
</v>
<v t="ekr.20160220054807.1"><vh>Unused helpers of mcf.scan_options</vh>
<v t="ekr.20160220050433.126"><vh>msf.make_op_name_dict</vh></v>
<v t="ekr.20160220050433.128"><vh>msf.find_pattern_ops</vh></v>
<v t="ekr.20160220050433.132"><vh>msf.make_patterns_dict</vh></v>
<v t="ekr.20160220050433.133"><vh>msf.scan_patterns</vh></v>
</v>
<v t="ekr.20160220050433.81"><vh>cf.kind</vh></v>
<v t="ekr.20160220082951.1"><vh>from ast_utils</vh>
<v t="ekr.20160220081959.2"><vh>extract_text_range</vh></v>
<v t="ekr.20160220081959.3"><vh>find_closest_containing_node</vh></v>
<v t="ekr.20160220081959.4"><vh>find_expression</vh></v>
<v t="ekr.20160220081959.5"><vh>contains_node</vh></v>
<v t="ekr.20160220081959.6"><vh>has_parent_with_class</vh></v>
<v t="ekr.20160220081959.7"><vh>parse_source</vh></v>
<v t="ekr.20160220081959.8"><vh>get_last_child</vh></v>
<v t="ekr.20160220081959.10"><vh>value_to_literal</vh></v>
<v t="ekr.20160220081959.13"><vh>pretty</vh></v>
<v t="ekr.20160220081959.16"><vh>_tokenize_with_char_offsets</vh></v>
<v t="ekr.20160220082219.1"><vh>class TextRange</vh>
<v t="ekr.20160220082219.2"><vh>__init__</vh></v>
<v t="ekr.20160220082219.3"><vh>contains_smaller</vh></v>
<v t="ekr.20160220082219.4"><vh>contains_smaller_eq</vh></v>
<v t="ekr.20160220082219.5"><vh>not_smaller_in</vh></v>
<v t="ekr.20160220082219.6"><vh>is_smaller_in</vh></v>
<v t="ekr.20160220082219.7"><vh>not_smaller_eq_in</vh></v>
<v t="ekr.20160220082219.8"><vh>is_smaller_eq_in</vh></v>
<v t="ekr.20160220082219.9"><vh>get_start_index</vh></v>
<v t="ekr.20160220082219.10"><vh>get_end_index</vh></v>
<v t="ekr.20160220082219.11"><vh>__str__</vh></v>
</v>
</v>
<v t="ekr.20160220085158.1"><vh>class ReadLinesClass</vh></v>
</v>
</v>
<v t="ekr.20160220050053.2"><vh>@clean README.md</vh></v>
<v t="ekr.20160220050321.1"><vh>@clean python_to_coffeescript.py</vh>
<v t="ekr.20160220050433.2"><vh>  &lt;&lt; imports &gt;&gt; (python_to_coffeescript.py)</vh></v>
<v t="ekr.20160220050745.1"><vh>  &lt;&lt; license &gt;&gt; (python_to_coffeescript.py)</vh></v>
<v t="ekr.20160220050433.11"><vh>  main</vh></v>
<v t="ekr.20160220050433.7"><vh>  utility functions</vh>
<v t="ekr.20160220050433.8"><vh>dump</vh></v>
<v t="ekr.20160220050433.9"><vh>dump_dict</vh></v>
<v t="ekr.20160220050433.10"><vh>dump_list</vh></v>
<v t="ekr.20160220050433.12"><vh>pdb</vh></v>
<v t="ekr.20160220050433.13"><vh>truncate</vh></v>
</v>
<v t="ekr.20160220050433.14"><vh>class CoffeeScriptFormatter</vh>
<v t="ekr.20160220050433.16"><vh> cf.format</vh></v>
<v t="ekr.20160220050433.82"><vh> cf.indent</vh></v>
<v t="ekr.20160220050433.17"><vh> cf.visit</vh></v>
<v t="ekr.20160220050433.18"><vh>cf.Contexts</vh>
<v t="ekr.20160220050433.19"><vh>cf.ClassDef</vh></v>
<v t="ekr.20160220050433.20"><vh>cf.FunctionDef</vh></v>
<v t="ekr.20160220050433.21"><vh>cf.Interactive</vh></v>
<v t="ekr.20160220050433.22"><vh>cf.Module</vh></v>
<v t="ekr.20160220050433.23"><vh>cf.Lambda</vh></v>
</v>
<v t="ekr.20160220050433.24"><vh>cf.Expressions</vh>
<v t="ekr.20160220050433.25"><vh>cf.Expr</vh></v>
<v t="ekr.20160220050433.26"><vh>cf.Expression</vh></v>
<v t="ekr.20160220050433.27"><vh>cf.GeneratorExp</vh></v>
<v t="ekr.20160220050433.28"><vh>cf.ctx nodes</vh></v>
</v>
<v t="ekr.20160220050433.29"><vh>cf.Operands</vh>
<v t="ekr.20160220050433.30"><vh>cf.arguments</vh></v>
<v t="ekr.20160220050433.31"><vh>cf.arg (Python3 only)</vh></v>
<v t="ekr.20160220050433.32"><vh>cf.Attribute</vh></v>
<v t="ekr.20160220050433.33"><vh>cf.Bytes</vh></v>
<v t="ekr.20160220050433.34"><vh>cf.Call &amp; cf.keyword</vh>
<v t="ekr.20160220050433.35"><vh>cf.keyword</vh></v>
</v>
<v t="ekr.20160220050433.36"><vh>cf.comprehension</vh></v>
<v t="ekr.20160220050433.37"><vh>cf.Dict</vh></v>
<v t="ekr.20160220050433.38"><vh>cf.Ellipsis</vh></v>
<v t="ekr.20160220050433.39"><vh>cf.ExtSlice</vh></v>
<v t="ekr.20160220050433.40"><vh>cf.Index</vh></v>
<v t="ekr.20160220050433.41"><vh>cf.List</vh></v>
<v t="ekr.20160220050433.42"><vh>cf.ListComp</vh></v>
<v t="ekr.20160220050433.43"><vh>cf.Name &amp; cf.NameConstant</vh></v>
<v t="ekr.20160220050433.44"><vh>cf.Num</vh></v>
<v t="ekr.20160220050433.45"><vh>cf.Repr</vh></v>
<v t="ekr.20160220050433.46"><vh>cf.Slice</vh></v>
<v t="ekr.20160220050433.47"><vh>cf.Str</vh></v>
<v t="ekr.20160220050433.48"><vh>cf.Subscript</vh></v>
<v t="ekr.20160220050433.49"><vh>cf.Tuple</vh></v>
</v>
<v t="ekr.20160220050433.50"><vh>cf.Operators</vh>
<v t="ekr.20160220050433.83"><vh> cf.op_name</vh></v>
<v t="ekr.20160220050433.51"><vh>cf.BinOp</vh></v>
<v t="ekr.20160220050433.52"><vh>cf.BoolOp</vh></v>
<v t="ekr.20160220050433.53"><vh>cf.Compare</vh></v>
<v t="ekr.20160220050433.55"><vh>cf.ifExp (ternary operator)</vh></v>
<v t="ekr.20160220050433.54"><vh>cf.UnaryOp</vh></v>
</v>
<v t="ekr.20160220050433.56"><vh>cf.Statements</vh>
<v t="ekr.20160220050433.57"><vh>cf.Assert</vh></v>
<v t="ekr.20160220050433.58"><vh>cf.Assign</vh></v>
<v t="ekr.20160220050433.59"><vh>cf.AugAssign</vh></v>
<v t="ekr.20160220050433.60"><vh>cf.Break</vh></v>
<v t="ekr.20160220050433.61"><vh>cf.Continue</vh></v>
<v t="ekr.20160220050433.62"><vh>cf.Delete</vh></v>
<v t="ekr.20160220050433.63"><vh>cf.ExceptHandler</vh></v>
<v t="ekr.20160220050433.64"><vh>cf.Exec</vh></v>
<v t="ekr.20160220050433.65"><vh>cf.For</vh></v>
<v t="ekr.20160220050433.66"><vh>cf.Global</vh></v>
<v t="ekr.20160220050433.67"><vh>cf.If</vh></v>
<v t="ekr.20160220050433.68"><vh>cf.Import &amp; helper</vh>
<v t="ekr.20160220050433.69"><vh>cf.get_import_names</vh></v>
</v>
<v t="ekr.20160220050433.70"><vh>cf.ImportFrom</vh></v>
<v t="ekr.20160220050433.71"><vh>cf.Pass</vh></v>
<v t="ekr.20160220050433.72"><vh>cf.Print</vh></v>
<v t="ekr.20160220050433.73"><vh>cf.Raise</vh></v>
<v t="ekr.20160220050433.74"><vh>cf.Return</vh></v>
<v t="ekr.20160220094909.1"><vh>cf.Try</vh></v>
<v t="ekr.20160220050433.75"><vh>cf.TryExcept</vh></v>
<v t="ekr.20160220050433.76"><vh>cf.TryFinally</vh></v>
<v t="ekr.20160220050433.77"><vh>cf.While</vh></v>
<v t="ekr.20160220050433.78"><vh>cf.With</vh></v>
<v t="ekr.20160220050433.79"><vh>cf.Yield</vh></v>
</v>
</v>
<v t="ekr.20160220050433.86"><vh>class LeoGlobals</vh>
<v t="ekr.20160220050433.87"><vh>class NullObject (Python Cookbook)</vh></v>
<v t="ekr.20160220050433.88"><vh>g._callerName</vh></v>
<v t="ekr.20160220050433.89"><vh>g.callers</vh></v>
<v t="ekr.20160220050433.90"><vh>g.cls</vh></v>
<v t="ekr.20160220050433.91"><vh>g.pdb</vh></v>
<v t="ekr.20160220050433.92"><vh>g.shortFileName</vh></v>
<v t="ekr.20160220050433.93"><vh>g.splitLines</vh></v>
<v t="ekr.20160220050433.94"><vh>g.trace</vh></v>
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
<v t="ekr.20160220050433.188"><vh>class TestClass</vh>
<v t="ekr.20160220050433.189"><vh>parse_group (Guido)</vh></v>
<v t="ekr.20160220050433.190"><vh>return_all</vh></v>
<v t="ekr.20160220050433.191"><vh>return_array</vh></v>
<v t="ekr.20160220050433.192"><vh>return_list</vh></v>
<v t="ekr.20160220050433.193"><vh>return_two_lists (fails)</vh></v>
</v>
</v>
<v t="ekr.20160220081725.1"><vh>@clean ast_utils.py</vh>
<v t="ekr.20160220081959.1"><vh>&lt;&lt; imports &gt;&gt;</vh></v>
<v t="ekr.20160220093908.1"><vh>class Bunch (Python Cookbook)</vh></v>
<v t="ekr.20160220081959.9"><vh>mark_text_ranges &amp; helpers</vh>
<v t="ekr.20160220084232.1"><vh>&lt;&lt; mark_text_ranges helpers &gt;&gt;</vh>
<v t="ekr.20160220084252.1"><vh>_extract_tokens</vh></v>
<v t="ekr.20160220084252.2"><vh>_mark_text_ranges_rec</vh></v>
<v t="ekr.20160220084252.3"><vh>_strip_trailing_junk_from_expressions</vh></v>
<v t="ekr.20160220084252.4"><vh>_strip_trailing_extra_closers</vh></v>
<v t="ekr.20160220084252.5"><vh>_strip_unclosed_brackets</vh></v>
<v t="ekr.20160220084252.6"><vh>_mark_end_and_return_child_tokens</vh></v>
</v>
<v t="ekr.20160220081959.14"><vh>_get_ordered_child_nodes</vh></v>
<v t="ekr.20160220081959.15"><vh>_tokens_text</vh></v>
<v t="ekr.20160220081959.11"><vh>fix_ast_problems</vh></v>
<v t="ekr.20160220081959.12"><vh>compare_node_positions</vh></v>
</v>
</v>
<v t="ekr.20160220073633.1"><vh>recent</vh>
<v t="ekr.20160220050433.25"></v>
<v t="ekr.20160220050433.47"></v>
<v t="ekr.20160220050433.19"></v>
<v t="ekr.20160220050433.20"></v>
</v>
<v t="ekr.20160220050433.14"></v>
<v t="ekr.20160220081959.9"></v>
<v t="ekr.20160220050433.121"></v>
</vnodes>
<tnodes>
<t tx="ekr.20160220050053.2" markdown-import="7d7100550e756e6465726c696e655f6469637471017d7102581700000020707974686f6e2d746f2d636f666665657363726970747103550123710473732e">@language md

A lexical translator from python syntax to coffeescript syntax. This is
intended merely as a syntactic helper. It has no real smarts.
</t>
<t tx="ekr.20160220050321.1">#!/usr/bin/env python
'''
This script makes a coffeescript file for every python source file listed
on the command line (wildcard file names are supported).

For full details, see README.md.

Released under the MIT Licence.

Written by Edward K. Ream.
'''
&lt;&lt; license &gt;&gt;
&lt;&lt; imports &gt;&gt;
isPython3 = sys.version_info &gt;= (3, 0, 0)
@others
g = LeoGlobals() # For ekr.
if __name__ == "__main__":
    main()
</t>
<t tx="ekr.20160220050433.10">
def dump_list(title, aList):
    '''Dump a list with a header.'''
    dump(title)
    for z in aList:
        print(z)
    print('')
</t>
<t tx="ekr.20160220050433.100">
def is_regex(self):
    '''
    Return True if self.find_s is a regular pattern.
    For now a kludgy convention suffices.
    '''
    return self.find_s.endswith('$')
        # A dollar sign is not valid in any Python expression.
</t>
<t tx="ekr.20160220050433.101">
def all_matches(self, s):
    '''
    Return a list of match objects for all matches in s.
    These are regex match objects or (start, end) for balanced searches.
    '''
    trace = False
    if self.is_balanced():
        aList, i = [], 0
        while i &lt; len(s):
            progress = i
            j = self.full_balanced_match(s, i)
            if j is None:
                i += 1
            else:
                aList.append((i,j),)
                i = j
            assert progress &lt; i
        return aList
    else:
        return list(self.regex.finditer(s))
</t>
<t tx="ekr.20160220050433.102">
def full_balanced_match(self, s, i):
    '''Return the index of the end of the match found at s[i:] or None.'''
    i1 = i
    trace = False
    if trace: g.trace(self.find_s, s[i:].rstrip())
    pattern = self.find_s
    j = 0 # index into pattern
    while i &lt; len(s) and j &lt; len(pattern) and pattern[j] in ('*', s[i]):
        progress = i
        if pattern[j:j+3] in ('(*)', '[*]', '{*}'):
            delim = pattern[j]
            i = self.match_balanced(delim, s, i)
            j += 3
        elif j == len(pattern)-1 and pattern[j] == '*':
            # A trailing * matches the rest of the string.
            j += 1
            i = len(s)
            break
        else:
            i += 1
            j += 1
        assert progress &lt; i
    found = i &lt;= len(s) and j == len(pattern)
    if trace and found:
        g.trace('%s -&gt; %s' % (pattern, s[i1:i]))
    return i if found else None
</t>
<t tx="ekr.20160220050433.103">
def match_balanced(self, delim, s, i):
    '''
    delim == s[i] and delim is in '([{'
    Return the index of the end of the balanced parenthesized string, or len(s)+1.
    '''
    trace = False
    assert s[i] == delim, s[i]
    assert delim in '([{'
    delim2 = ')]}'['([{'.index(delim)]
    assert delim2 in ')]}'
    i1, level = i, 0
    while i &lt; len(s):
        progress = i
        ch = s[i]
        i += 1
        if ch == delim:
            level += 1
        elif ch == delim2:
            level -= 1
            if level == 0:
                if trace: g.trace('found: %s' % s[i1:i])
                return i
        assert progress &lt; i
    # Unmatched: a syntax error.
    g.trace('unmatched %s in %s' % (delim, s), g.callers(4))
    return len(s) + 1
</t>
<t tx="ekr.20160220050433.104">
def match(self, s, trace=False):
    '''
    Perform the match on the entire string if possible.
    Return (found, new s)
    '''
    trace = False or trace
    caller = g.callers(2).split(',')[0].strip()
        # The caller of match_all.
    s1 = truncate(s,40)
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        if j is None:
            return False, s
        else:
            start, end = 0, len(s)
            s = self.replace_balanced(s, start, end)
            if trace:
                g.trace('%-16s %30s %40s ==&gt; %s' % (caller, self, s1, s))
            return True, s
    else:
        m = self.regex.match(s)
        if m and m.group(0) == s:
            s = self.replace_regex(m, s)
            if trace:
                g.trace('%-16s %30s %30s ==&gt; %s' % (caller, self, s1, s))
            return True, s
        else:
            return False, s
</t>
<t tx="ekr.20160220050433.105">
def match_entire_string(self, s):
    '''Return True if s matches self.find_s'''
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        return j == len(s)
    else:
        m = self.regex.match(s)
        return m and m.group(0) == s
</t>
<t tx="ekr.20160220050433.106">
def replace(self, m, s):
    '''Perform any kind of replacement.'''
    if self.is_balanced():
        start, end = m
        return self.replace_balanced(s, start, end)
    else:
        return self.replace_regex(m, s)
</t>
<t tx="ekr.20160220050433.107">
def replace_balanced(self, s1, start, end):
    '''
    Use m (returned by all_matches) to replace s by the string implied by repr_s.
    Within repr_s, * star matches corresponding * in find_s
    '''
    trace = False
    s = s1[start:end]
    f, r = self.find_s, self.repl_s
    i1 = f.find('(*)')
    i2 = f.find('[*]')
    i3 = f.find('{*}')
    if -1 == i1 == i2 == i3:
        return s1[:start] + r + s1[end:]
    j = r.find('*')
    if j == -1:
        return s1[:start] + r + s1[end:]
    i = min([z for z in [i1, i2, i3] if z &gt; -1])
    assert i &gt; -1 # i is an index into f AND s
    delim = f[i]
    if trace: g.trace('head', s[:i], f[:i])
    assert s[:i] == f[:i], (s[:i], f[:i])
    if trace: g.trace('delim',delim)
    k = self.match_balanced(delim, s, i)
    s_star = s[i+1:k-1]
    if trace: g.trace('s_star',s_star)
    repl = r[:j] + s_star + r[j+1:]
    if trace: g.trace('repl',self.repl_s,'==&gt;',repl)
    return s1[:start] + repl + s1[end:]
</t>
<t tx="ekr.20160220050433.108">
def replace_regex(self, m, s):
    '''Do the replacement in s specified by m.'''
    s = self.repl_s
    for i in range(9):
        group = '\\%s' % i
        if s.find(group) &gt; -1:
            # g.trace(i, m.group(i))
            s = s.replace(group, m.group(i))
    return s</t>
<t tx="ekr.20160220050433.109">

class ReduceTypes:
    '''
    A helper class for the top-level reduce_types function.
    
    This class reduces a list of type hints to a string containing the
    reduction of all types in the list.
    '''
    @others
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
<t tx="ekr.20160220050433.110">
def __init__(self, aList=None, name=None, trace=False):
    '''Ctor for ReduceTypes class.'''
    self.aList = aList
    self.name = name
    self.optional = False
    self.trace = trace
</t>
<t tx="ekr.20160220050433.111">
def is_known_type(self, s):
    '''
    Return True if s is nothing but a single known type.

    It suits the other methods of this class *not* to test inside inner
    brackets. This prevents unwanted Any types.
    '''
    trace = False
    s1 = s
    s = s.strip()
    table = (
        '', 'None', # Tricky.
        'complex', 'float', 'int', 'long', 'number',
        'dict', 'list', 'tuple',
        'bool', 'bytes', 'str', 'unicode',
    )
    for s2 in table:
        if s2 == s:
            return True
        elif Pattern(s2+'(*)', s).match_entire_string(s):
            return True
    if s.startswith('[') and s.endswith(']'):
        inner = s[1:-1]
        return self.is_known_type(inner) if inner else True
    elif s.startswith('(') and s.endswith(')'):
        inner = s[1:-1]
        return self.is_known_type(inner) if inner else True
    elif s.startswith('{') and s.endswith('}'):
        return True
        # inner = s[1:-1]
        # return self.is_known_type(inner) if inner else True
    table = (
        # Pep 484: https://www.python.org/dev/peps/pep-0484/
        # typing module: https://docs.python.org/3/library/typing.html
        # Test the most common types first.
        'Any', 'Dict', 'List', 'Optional', 'Tuple', 'Union', 
        # Not generated by this program, but could arise from patterns.
        'AbstractSet', 'AnyMeta', 'AnyStr',
        'BinaryIO', 'ByteString',
        'Callable', 'CallableMeta', 'Container',
        'Final', 'Generic', 'GenericMeta', 'Hashable',
        'IO', 'ItemsView', 'Iterable', 'Iterator',
        'KT', 'KeysView',
        'Mapping', 'MappingView', 'Match',
        'MutableMapping', 'MutableSequence', 'MutableSet',
        'NamedTuple', 'OptionalMeta',
        # 'POSIX', 'PY2', 'PY3',
        'Pattern', 'Reversible',
        'Sequence', 'Set', 'Sized',
        'SupportsAbs', 'SupportsFloat', 'SupportsInt', 'SupportsRound',
        'T', 'TextIO', 'TupleMeta', 'TypeVar', 'TypingMeta',
        'Undefined', 'UnionMeta',
        'VT', 'ValuesView', 'VarBinding',
    )
    for s2 in table:
        if s2 == s:
            return True
        else:
            # Don't look inside bracketss.
            pattern = Pattern(s2+'[*]', s)
            if pattern.match_entire_string(s):
                return True
    if trace: g.trace('Fail:', s1)
    return False
</t>
<t tx="ekr.20160220050433.112">
def reduce_collection(self, aList, kind):
    '''
    Reduce the inner parts of a collection for the given kind.
    Return a list with only collections of the given kind reduced.
    '''
    trace = False
    if trace: g.trace(kind, aList)
    assert isinstance(aList, list)
    assert None not in aList, aList
    pattern = Pattern('%s[*]' % kind)
    others, r1, r2 = [], [], []
    for s in sorted(set(aList)):
        if pattern.match_entire_string(s):
            r1.append(s)
        else:
            others.append(s)
    if trace: g.trace('1', others, r1)
    for s in sorted(set(r1)):
        parts = []
        s2 = s[len(kind)+1:-1]
        for s3 in s2.split(','):
            s3 = s3.strip()
            if trace: g.trace('*', self.is_known_type(s3), s3)
            parts.append(s3 if self.is_known_type(s3) else 'Any')
        r2.append('%s[%s]' % (kind, ', '.join(parts)))
    if trace: g.trace('2', r2)
    result = others
    result.extend(r2)
    result = sorted(set(result))
    if trace: g.trace('3', result)
    return result
</t>
<t tx="ekr.20160220050433.113">
def reduce_numbers(self, aList):
    '''
    Return aList with all number types in aList replaced by the most
    general numeric type in aList.
    '''
    trace = False
    found = None
    numbers = ('number', 'complex', 'float', 'long', 'int')
    for kind in numbers:
        for z in aList:
            if z == kind:
                found = kind
                break
        if found:
            break
    if found:
        assert found in numbers, found
        aList = [z for z in aList if z not in numbers]
        aList.append(found)
    if trace: g.trace(aList)
    return aList
</t>
<t tx="ekr.20160220050433.114">
def reduce_types(self):
    '''
    self.aList consists of arbitrarily many types because this method is
    called from format_return_expressions.
    
    Return a *string* containing the reduction of all types in this list.
    Returning a string means that all traversers always return strings,
    never lists.
    '''
    trace = False
    if trace: g.trace('=====', self.aList)
    r = [('None' if z in ('', None) else z) for z in self.aList]
    assert None not in r
    self.optional = 'None' in r
        # self.show adds Optional if this flag is set.
    r = [z for z in r if z != 'None']
    if not r:
        self.optional = False
        return self.show('None')
    r = sorted(set(r))
    assert r
    assert None not in r
    r = self.reduce_numbers(r)
    for kind in ('Dict', 'List', 'Tuple',):
        r = self.reduce_collection(r, kind)
    r = self.reduce_unknowns(r)
    r = sorted(set(r))
    assert r
    assert 'None' not in r
    if len(r) == 1:
        return self.show(r[0])
    else:
        return self.show('Union[%s]' % (', '.join(sorted(r))))
</t>
<t tx="ekr.20160220050433.115">
def reduce_unknowns(self, aList):
    '''Replace all unknown types in aList with Any.'''
    return [z if self.is_known_type(z) else 'Any' for z in aList]
</t>
<t tx="ekr.20160220050433.116">
def show(self, s, known=True):
    '''Show the result of reduce_types.'''
    aList, name = self.aList, self.name
    trace = False or self.trace
    s = s.strip()
    if self.optional:
        s = 'Optional[%s]' % s
    if trace and (not known or len(aList) &gt; 1):
        if name:
            if name.find('.') &gt; -1:
                context = ''.join(name.split('.')[1:])
            else:
                context = name
        else:
            context = g.callers(3).split(',')[0].strip()
        context = truncate(context, 26)
        known = '' if known else '? '
        pattern = sorted(set([z.replace('\n',' ') for z in aList]))
        pattern = '[%s]' % truncate(', '.join(pattern), 53-2)
        print('reduce_types: %-26s %53s ==&gt; %s%s' % (context, pattern, known, s))
            # widths above match the corresponding indents in match_all and match.
    return s
</t>
<t tx="ekr.20160220050433.117">
def split_types(self, s):
    '''Split types on *outer level* commas.'''
    aList, i1, level = [], 0, 0
    for i, ch in enumerate(s):
        if ch == '[':
            level += 1
        elif ch == ']':
            level -= 1
        elif ch == ',' and level == 0:
            aList.append(s[i1:i])
            i1 = i+1
    aList.append(s[i1:].strip())
    return aList</t>
<t tx="ekr.20160220050433.118">

class MakeCoffeeScriptController(object):
    '''The controller class for python_to_coffeescript.py.'''
    @others
</t>
<t tx="ekr.20160220050433.119">
def __init__ (self):
    '''Ctor for MakeCoffeeScriptController class.'''
    self.options = {}
    # Ivars set on the command line...
    self.config_fn = None
    self.enable_unit_tests = False
    self.files = [] # May also be set in the config file.
    self.section_names = ('Global',)
        # 'Def Name Patterns', 'General Patterns')
    # Ivars set in the config file...
    ### self.output_fn = None
    self.output_directory = self.finalize('.')
    self.overwrite = False
    self.trace_visitors = False
    self.update_flag = False
    self.verbose = False # Trace config arguments.
    ### 
    # self.prefix_lines = []
    # self.trace_matches = False
    # self.trace_patterns = False
    # self.trace_reduce = False
    # self.warn = False
    # Pattern lists, set by config sections...
    # self.def_patterns = [] # [Def Name Patterns]
    # self.general_patterns = [] # [General Patterns]
    # self.names_dict = {}
    # self.op_name_dict = self.make_op_name_dict()
    # self.patterns_dict = {}
    # self.regex_patterns = []
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
    out_fn = out_fn[:-3] + '.coffee'
    dir_ = os.path.dirname(out_fn)
    if os.path.exists(out_fn) and not self.overwrite:
        print('file exists: %s' % out_fn)
    elif not dir_ or os.path.exists(dir_):
        t1 = time.clock()
        s = open(fn).read()
        node = ast.parse(s,filename=fn,mode='exec')
        ### Not yet. Lots of bugs. It may only work for Python 3.
        # ast_utils.mark_text_ranges(node, s)
        s = CoffeeScriptFormatter(controller=self).format(node)
        f = open(out_fn, 'w')
        self.output_time_stamp(f)
        f.write(s)
        f.close()
        print('wrote: %s' % out_fn)
    else:
        print('output directory not not found: %s' % dir_)</t>
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
    add('-t', '--test', action='store_true', default=False,
        help='run unit tests on startup')
    # add('--trace-matches', action='store_true', default=False,
        # help='trace Pattern.matches')
    # add('--trace-patterns', action='store_true', default=False,
        # help='trace pattern creation')
    # add('--trace-reduce', action='store_true', default=False,
        # help='trace st.reduce_types')
    add('--trace-visitors', action='store_true', default=False,
        help='trace visitor methods')
    # add('-u', '--update', action='store_true', default=False,
        # help='update stubs in existing stub file')
    add('-v', '--verbose', action='store_true', default=False,
        help='verbose output')
    # add('-w', '--warn', action='store_true', default=False,
        # help='warn about unannotated args')
    # Parse the options
    options, args = parser.parse_args()
    # Handle the options...
    self.enable_unit_tests=options.test
    self.overwrite = options.overwrite
    self.trace_visitors = options.trace_visitors
    ###
    # self.trace_matches = options.trace_matches
    # self.trace_patterns = options.trace_patterns
    # self.trace_reduce = options.trace_reduce
    # self.update_flag = options.update
    # self.verbose = options.verbose
    # self.warn = options.warn
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
<t tx="ekr.20160220050433.126">
def make_op_name_dict(self):
    '''
    Make a dict whose keys are operators ('+', '+=', etc),
    and whose values are lists of values of ast.Node.__class__.__name__.
    '''
    d = {
        '.':   ['Attr',],
        '(*)': ['Call', 'Tuple',],
        '[*]': ['List', 'Subscript',],
        '{*}': ['???',],
        ### 'and': 'BoolOp',
        ### 'or':  'BoolOp',
    }
    for op in (
        '+', '-', '*', '/', '%', '**', '&lt;&lt;',
        '&gt;&gt;', '|', '^', '&amp;', '//',
    ):
        d[op] = ['BinOp',]
    for op in (
        '==', '!=', '&lt;', '&lt;=', '&gt;', '&gt;=',
        'is', 'is not', 'in', 'not in',
    ):
        d[op] = ['Compare',]
    return d
</t>
<t tx="ekr.20160220050433.127">
def create_parser(self):
    '''Create a RawConfigParser and return it.'''
    parser = configparser.RawConfigParser(dict_type=OrderedDict)
        # Requires Python 2.7
    parser.optionxform = str
    return parser
</t>
<t tx="ekr.20160220050433.128">
def find_pattern_ops(self, pattern):
    '''Return a list of operators in pattern.find_s.'''
    trace = False or self.trace_patterns
    if pattern.is_regex():
        # Add the pattern to the regex patterns list.
        g.trace(pattern)
        self.regex_patterns.append(pattern)
        return []
    d = self.op_name_dict
    keys1, keys2, keys3, keys9 = [], [], [], []
    for op in d:
        aList = d.get(op)
        if op.replace(' ','').isalnum():
            # an alpha op, like 'not, 'not in', etc.
            keys9.append(op)
        elif len(op) == 3:
            keys3.append(op)
        elif len(op) == 2:
            keys2.append(op)
        elif len(op) == 1:
            keys1.append(op)
        else:
            g.trace('bad op', op)
    ops = []
    s = s1 = pattern.find_s
    for aList in (keys3, keys2, keys1):
        for op in aList:
            # Must match word here!
            if s.find(op) &gt; -1:
                s = s.replace(op, '')
                ops.append(op)
    # Handle the keys9 list very carefully.
    for op in keys9:
        target = ' %s ' % op
        if s.find(target) &gt; -1:
            ops.append(op)
            break # Only one match allowed.
    if trace and ops: g.trace(s1, ops)
    return ops
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
            aList.append(r'\\'+s[1:])
            if trace: g.trace('*** escaping:',s)
        else:
            aList.append(s)
    s = '\n'.join(aList)+'\n'
    if trace: g.trace(s)
    file_object = io.StringIO(s)
    self.parser.readfp(file_object)</t>
<t tx="ekr.20160220050433.131">
def is_section_name(self, s):
    
    def munge(s):
        return s.strip().lower().replace(' ','')
    
    s = s.strip()
    if s.startswith('[') and s.endswith(']'):
        s = munge(s[1:-1])
        for s2 in self.section_names:
            if s == munge(s2):
                return True
    return False
</t>
<t tx="ekr.20160220050433.132">
def make_patterns_dict(self):
    '''Assign all patterns to the appropriate ast.Node.'''
    trace = False or self.trace_patterns
    for pattern in self.general_patterns:
        ops = self.find_pattern_ops(pattern)
        if ops:
            for op in ops:
                # Add the pattern to op's list.
                op_names = self.op_name_dict.get(op)
                for op_name in op_names:
                    aList = self.patterns_dict.get(op_name, [])
                    aList.append(pattern)
                    self.patterns_dict[op_name] = aList
        else:
            # Enter the name in self.names_dict.
            name = pattern.find_s
            # Special case for 'number'
            if name == 'number':
                aList = self.patterns_dict.get('Num', [])
                aList.append(pattern)
                self.patterns_dict['Num'] = aList
            elif name in self.names_dict:
                g.trace('duplicate pattern', pattern)
            else:
                self.names_dict [name] = pattern.repl_s
    if 0:
        g.trace('names_dict...')
        for z in sorted(self.names_dict):
            print('  %s: %s' % (z, self.names_dict.get(z)))
    if 0:
        g.trace('patterns_dict...')
        for z in sorted(self.patterns_dict):
            aList = self.patterns_dict.get(z)
            print(z)
            for pattern in sorted(aList):
                print('  '+repr(pattern))
    # Note: retain self.general_patterns for use in argument lists.
</t>
<t tx="ekr.20160220050433.133">
def scan_patterns(self, section_name):
    '''Parse the config section into a list of patterns, preserving order.'''
    trace = False or self.trace_patterns
    parser = self.parser
    aList = []
    if parser.has_section(section_name):
        seen = set()
        for key in parser.options(section_name):
            value = parser.get(section_name, key)
            # A kludge: strip leading \\ from patterns.
            if key.startswith(r'\\'):
                key = '[' + key[2:]
                if trace: g.trace('removing escapes', key)
            if key in seen:
                g.trace('duplicate key', key)
            else:
                seen.add(key)
                aList.append(Pattern(key, value))
        if trace:
            g.trace('%s...\n' % section_name)
            for z in aList:
                print(z)
            print('')
    # elif trace:
        # print('no section: %s' % section_name)
        # print(parser.sections())
        # print('')
    return aList
</t>
<t tx="ekr.20160220050433.134">

class Stub(object):
    '''
    A class representing all the generated stub for a class or def.
    stub.full_name should represent the complete context of a def.
    '''
    @others
</t>
<t tx="ekr.20160220050433.135">
def __init__(self, kind, name, parent=None, stack=None):
    '''Stub ctor. Equality depends only on full_name and kind.'''
    self.children = []
    self.full_name = '%s.%s' % ('.'.join(stack), name) if stack else name
    self.kind = kind
    self.name = name
    self.out_list = []
    self.parent = parent
    self.stack = stack # StubTraverser.context_stack.
    if stack:
        assert stack[-1] == parent.name, (stack[-1], parent.name)
    if parent:
        assert isinstance(parent, Stub)
        parent.children.append(self)
</t>
<t tx="ekr.20160220050433.136">
def __eq__(self, obj):
    '''
    Stub.__eq__. Return whether two stubs refer to the same method.
    Do *not* test parent links. That would interfere with --update logic.
    '''
    if isinstance(obj, Stub):
        return self.full_name == obj.full_name and self.kind == obj.kind
    else:
        return NotImplemented

def __ne__(self, obj):
    """Stub.__ne__"""
    return not self.__eq__(obj)
</t>
<t tx="ekr.20160220050433.137">
def __hash__(self):
    '''Stub.__hash__. Equality depends *only* on full_name and kind.'''
    return len(self.kind) + sum([ord(z) for z in self.full_name])</t>
<t tx="ekr.20160220050433.138">
def __repr__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s %s' % (id(self), self.full_name)
    
def __str__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s' % self.full_name
</t>
<t tx="ekr.20160220050433.139">
def level(self):
    '''Return the number of parents.'''
    return len(self.parents())
    
def parents(self):
    '''Return a list of this stub's parents.'''
    return self.full_name.split('.')[:-1]
</t>
<t tx="ekr.20160220050433.14">

class CoffeeScriptFormatter(object):
    '''A class to convert python sources to coffeescript sources.'''
    # pylint: disable=consider-using-enumerate
    
    def __init__(self, controller):
        '''Ctor for CoffeeScriptFormatter class.'''
        self.controller = controller
        self.first_statement = False
        self.trace_visitors = controller.trace_visitors

    @others
</t>
<t tx="ekr.20160220050433.140">

class StubFormatter (AstFormatter):
    '''
    Formats an ast.Node and its descendants,
    making pattern substitutions in Name and operator nodes.
    '''
    @others
</t>
<t tx="ekr.20160220050433.141">
def __init__(self, controller, traverser):
    '''Ctor for StubFormatter class.'''
    self.controller = x = controller
    self.traverser = traverser
        # 2016/02/07: to give the formatter access to the class_stack.
    self.def_patterns = x.def_patterns
    self.general_patterns = x.general_patterns
    self.names_dict = x.names_dict
    self.patterns_dict = x.patterns_dict
    self.raw_format = AstFormatter().format
    self.regex_patterns = x.regex_patterns
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
</t>
<t tx="ekr.20160220050433.142">
matched_d = {}

def match_all(self, node, s, trace=False):
    '''Match all the patterns for the given node.'''
    trace = False or trace or self.trace_matches
    # verbose = True
    d = self.matched_d
    name = node.__class__.__name__
    s1 = truncate(s, 40)
    caller = g.callers(2).split(',')[1].strip()
        # The direct caller of match_all.
    patterns = self.patterns_dict.get(name, []) + self.regex_patterns
    for pattern in patterns:
        found, s = pattern.match(s,trace=False)
        if found:
            if trace:
                aList = d.get(name, [])
                if pattern not in aList:
                    aList.append(pattern)
                    d [name] = aList
                    print('match_all:    %-12s %26s %40s ==&gt; %s' % (caller, pattern, s1, s))
            break
    return s</t>
<t tx="ekr.20160220050433.143">
def visit(self, node):
    '''StubFormatter.visit: supports --verbose tracing.'''
    s = AstFormatter.visit(self, node)
    # g.trace('%12s %s' % (node.__class__.__name__,s))
    return s</t>
<t tx="ekr.20160220050433.144">
def trace_visitor(self, node, op, s):
    '''Trace node's visitor.'''
    if self.trace_visitors:
        caller = g.callers(2).split(',')[1]
        s1 = AstFormatter().format(node).strip()
        print('%12s op %-6s: %s ==&gt; %s' % (caller, op.strip(), s1, s))
</t>
<t tx="ekr.20160220050433.145">
# StubFormatter visitors for operands...</t>
<t tx="ekr.20160220050433.146">
# Attribute(expr value, identifier attr, expr_context ctx)

attrs_seen = []

def do_Attribute(self, node):
    '''StubFormatter.do_Attribute.'''
    trace = False
    s = '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.
    s2 = self.names_dict.get(s)
    if trace and s2 and s2 not in self.attrs_seen:
        self.attrs_seen.append(s2)
        g.trace(s, '==&gt;', s2)
    return s2 or s
</t>
<t tx="ekr.20160220050433.147">
# Return generic markers to allow better pattern matches.

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Num(self, node):
    # make_patterns_dict treats 'number' as a special case.
    # return self.names_dict.get('number', 'number')
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
</t>
<t tx="ekr.20160220050433.148">
def do_Dict(self, node):
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
    # return ''.join(result)
    return 'Dict[%s]' % ''.join(result)
</t>
<t tx="ekr.20160220050433.149">
def do_List(self, node):
    '''StubFormatter.List.'''
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    # g.trace('=====',elts)
    return 'List[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160220050433.150">
seen_names = []

def do_Name(self, node):
    '''StubFormatter ast.Name visitor.'''
    trace = False
    d = self.names_dict
    name = d.get(node.id, node.id)
    s = 'bool' if name in ('True', 'False') else name
    if trace and node.id not in self.seen_names:
        self.seen_names.append(node.id)
        if d.get(node.id):
            g.trace(node.id, '==&gt;', d.get(node.id))
        elif node.id == 'aList':
            g.trace('**not found**', node.id)
    return s
</t>
<t tx="ekr.20160220050433.151">
def do_Tuple(self, node):
    '''StubFormatter.Tuple.'''
    elts = [self.visit(z) for z in node.elts]
    if 1:
        return 'Tuple[%s]' % ', '.join(elts)
    else:
        s = '(%s)' % ', '.join(elts)
        return self.match_all(node, s)
    # return 'Tuple[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160220050433.152">
# StubFormatter visitors for operators...
</t>
<t tx="ekr.20160220050433.153">
# BinOp(expr left, operator op, expr right)

def do_BinOp(self, node):
    '''StubFormatter.BinOp visitor.'''
    trace = False or self.trace_reduce ; verbose = False
    numbers = ['number', 'complex', 'float', 'long', 'int',]
    op = self.op_name(node.op)
    lhs = self.visit(node.left)
    rhs = self.visit(node.right)
    if op.strip() in ('is', 'is not', 'in', 'not in'):
        s = 'bool'
    elif lhs == rhs:
        s = lhs
            # Perhaps not always right,
            # but it is correct for Tuple, List, Dict.
    elif lhs in numbers and rhs in numbers:
        s = reduce_types([lhs, rhs], trace=trace)
            # reduce_numbers would be wrong: it returns a list.
    elif lhs == 'str' and op in '%+*':
        # str + any implies any is a string.
        s = 'str'
    else:
        if trace and verbose and lhs == 'str':
            g.trace('***** unknown string op', lhs, op, rhs)
        # Fall back to the base-class behavior.
        s = '%s%s%s' % (
            self.visit(node.left),
            op,
            self.visit(node.right))
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160220050433.154">
# BoolOp(boolop op, expr* values)

def do_BoolOp(self, node): # Python 2.x only.
    '''StubFormatter.BoolOp visitor for 'and' and 'or'.'''
    trace = False or self.trace_reduce
    op = self.op_name(node.op)
    values = [self.visit(z).strip() for z in node.values]
    s = reduce_types(values, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160220050433.155">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    '''StubFormatter.Call visitor.'''
    trace = False
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
    # Explicit pattern:
    if func in ('dict', 'list', 'set', 'tuple',):
        s = '%s[%s]' % (func.capitalize(), ', '.join(args))
    else:
        s = '%s(%s)' % (func, ', '.join(args))
    s = self.match_all(node, s, trace=trace)
    self.trace_visitor(node, 'call', s)
    return s
</t>
<t tx="ekr.20160220050433.156">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)
</t>
<t tx="ekr.20160220050433.157">
# Compare(expr left, cmpop* ops, expr* comparators)

def do_Compare(self, node):
    '''
    StubFormatter ast.Compare visitor for these ops:
    '==', '!=', '&lt;', '&lt;=', '&gt;', '&gt;=', 'is', 'is not', 'in', 'not in',
    '''
    s = 'bool' # Correct regardless of arguments.
    ops = ','.join([self.op_name(z) for z in node.ops])
    self.trace_visitor(node, ops, s)
    return s
</t>
<t tx="ekr.20160220050433.158">
# If(expr test, stmt* body, stmt* orelse)

def do_IfExp(self, node):
    '''StubFormatterIfExp (ternary operator).'''
    trace = False or self.trace_reduce
    aList = [
        self.match_all(node, self.visit(node.body)),
        self.match_all(node, self.visit(node.orelse)),
    ]
    s = reduce_types(aList, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, 'if', s)
    return s
</t>
<t tx="ekr.20160220050433.159">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    '''StubFormatter.Subscript.'''
    s = '%s[%s]' % (
        self.visit(node.value),
        self.visit(node.slice))
    s = self.match_all(node, s)
    self.trace_visitor(node, '[]', s)
    return s
</t>
<t tx="ekr.20160220050433.16">
def format(self, node):
    '''Format the node (or list of nodes) and its descendants.'''
    self.level = 0
    val = self.visit(node)
    return val or ''
</t>
<t tx="ekr.20160220050433.160">
# UnaryOp(unaryop op, expr operand)

def do_UnaryOp(self, node):
    '''StubFormatter.UnaryOp for unary +, -, ~ and 'not' operators.'''
    op = self.op_name(node.op)
    # g.trace(op.strip(), self.raw_format(node.operand))
    if op.strip() == 'not':
        return 'bool'
    else:
        s = self.visit(node.operand)
        s = self.match_all(node, s)
        self.trace_visitor(node, op, s)
        return s
</t>
<t tx="ekr.20160220050433.161">
def do_Return(self, node):
    '''
    StubFormatter ast.Return vsitor.
    Return only the return expression itself.
    '''
    s = AstFormatter.do_Return(self, node)
    assert s.startswith('return'), repr(s)
    return s[len('return'):].strip()
</t>
<t tx="ekr.20160220050433.162">

class StubTraverser (ast.NodeVisitor):
    '''
    An ast.Node traverser class that outputs a stub for each class or def.
    Names of visitors must start with visit_. The order of traversal does
    not matter, because so few visitors do anything.
    '''
    @others
</t>
<t tx="ekr.20160220050433.163">
def __init__(self, controller):
    '''Ctor for StubTraverser class.'''
    self.controller = x = controller
        # A StandAloneMakeStubFile instance.
    # Internal state ivars...
    self.class_name_stack = []
    self.context_stack = []
    sf = StubFormatter(controller=controller,traverser=self)
    self.format = sf.format
    self.arg_format = AstArgFormatter().format
    self.level = 0
    self.output_file = None
    self.parent_stub = None
    self.raw_format = AstFormatter().format
    self.returns = []
    self.stubs_dict = {}
        # Keys are stub.full_name's.  Values are stubs.
    self.warn_list = []
    # Copies of controller ivars...
    self.output_fn = x.output_fn
    self.overwrite = x.overwrite
    self.prefix_lines = x.prefix_lines
    self.regex_patterns = x.regex_patterns
    self.update_flag = x.update_flag
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
    self.warn = x.warn
    # Copies of controller patterns...
    self.def_patterns = x.def_patterns
    self.names_dict = x.names_dict
    self.general_patterns = x.general_patterns
    self.patterns_dict = x.patterns_dict
    </t>
<t tx="ekr.20160220050433.164">
def add_stub(self, d, stub):
    '''Add the stub to d, checking that it does not exist.'''
    trace = False ; verbose = False
    key = stub.full_name
    assert key
    if key in d:
        caller = g.callers(2).split(',')[1]
        g.trace('Ignoring duplicate entry for %s in %s' % (stub, caller))
    else:
        d [key] = stub
        if trace and verbose:
            caller = g.callers(2).split(',')[1]
            g.trace('%17s %s' % (caller, stub.full_name))
        elif trace:
            g.trace(stub.full_name)</t>
<t tx="ekr.20160220050433.165">
def indent(self, s):
    '''Return s, properly indented.'''
    # This version of indent *is* used.
    return '%s%s' % (' ' * 4 * self.level, s)

def out(self, s):
    '''Output the string to the console or the file.'''
    s = self.indent(s)
    if self.parent_stub:
        self.parent_stub.out_list.append(s)
    elif self.output_file:
        self.output_file.write(s+'\n')
    else:
        print(s)
</t>
<t tx="ekr.20160220050433.166">
def run(self, node):
    '''StubTraverser.run: write the stubs in node's tree to self.output_fn.'''
    fn = self.output_fn
    dir_ = os.path.dirname(fn)
    if os.path.exists(fn) and not self.overwrite:
        print('file exists: %s' % fn)
    elif not dir_ or os.path.exists(dir_):
        t1 = time.clock()
        # Delayed output allows sorting.
        self.parent_stub = Stub(kind='root', name='&lt;new-stubs&gt;')
        for z in self.prefix_lines or []:
            self.parent_stub.out_list.append(z)
        self.visit(node)
            # Creates parent_stub.out_list.
        if self.update_flag:
            self.parent_stub = self.update(fn, new_root=self.parent_stub)
        if 1:
            self.output_file = open(fn, 'w')
            self.output_time_stamp()
            self.output_stubs(self.parent_stub)
            self.output_file.close()
            self.output_file = None
            self.parent_stub = None
        t2 = time.clock()
        print('wrote: %s in %4.2f sec' % (fn, t2 - t1))
    else:
        print('output directory not not found: %s' % dir_)
</t>
<t tx="ekr.20160220050433.167">
def output_stubs(self, stub):
    '''Output this stub and all its descendants.'''
    for s in stub.out_list or []:
        # Indentation must be present when an item is added to stub.out_list.
        if self.output_file:
            self.output_file.write(s.rstrip()+'\n')
        else:
            print(s)
    # Recursively print all children.
    for child in stub.children:
        self.output_stubs(child)
</t>
<t tx="ekr.20160220050433.168">
def output_time_stamp(self):
    '''Put a time-stamp in the output file.'''
    if self.output_file:
        self.output_file.write('# make_stub_files: %s\n' %
            time.strftime("%a %d %b %Y at %H:%M:%S"))
</t>
<t tx="ekr.20160220050433.169">
def update(self, fn, new_root):
    '''
    Merge the new_root tree with the old_root tree in fn (a .pyi file).

    new_root is the root of the stub tree from the .py file.
    old_root (read below) is the root of stub tree from the .pyi file.
    
    Return old_root, or new_root if there are any errors.
    '''
    trace = False ; verbose = False
    s = self.get_stub_file(fn)
    if not s or not s.strip():
        return new_root
    if '\t' in s:
        # Tabs in stub files make it impossible to parse them reliably.
        g.trace('Can not update stub files containing tabs.')
        return new_root
    # Read old_root from the .pyi file.
    old_d, old_root = self.parse_stub_file(s, root_name='&lt;old-stubs&gt;')
    if old_root:
        # Merge new stubs into the old tree.
        if trace and verbose:
            print(self.trace_stubs(old_root, header='old_root'))
            print(self.trace_stubs(new_root, header='new_root'))
        print('***** updating stubs from %s *****' % fn)
        self.merge_stubs(self.stubs_dict.values(), old_root, new_root)
        if trace:
            print(self.trace_stubs(old_root, header='updated_root'))
        return old_root
    else:
        return new_root
</t>
<t tx="ekr.20160220050433.17">
def visit(self, node):
    '''Return the formatted version of an Ast node, or list of Ast nodes.'''
    if self.trace_visitors:
        g.trace(node.__class__.__name__)
    if isinstance(node, (list, tuple)):
        return ', '.join([self.visit(z) for z in node])
    elif node is None:
        return 'None'
    else:
        assert isinstance(node, ast.AST), node.__class__.__name__
        method_name = 'do_' + node.__class__.__name__
        method = getattr(self, method_name)
        s = method(node)
        # pylint: disable=unidiomatic-typecheck
        assert type(s) == type('abc'), (node, type(s))
        return s
</t>
<t tx="ekr.20160220050433.170">
def get_stub_file(self, fn):
    '''Read the stub file into s.'''
    if os.path.exists(fn):
        try:
            s = open(fn, 'r').read()
        except Exception:
            print('--update: error reading %s' % fn)
            s = None
        return s
    else:
        print('--update: not found: %s' % fn)
        return None
</t>
<t tx="ekr.20160220050433.171">
def parse_stub_file(self, s, root_name):
    '''
    Parse s, the contents of a stub file, into a tree of Stubs.
    
    Parse by hand, so that --update can be run with Python 2.
    '''
    trace = False
    assert '\t' not in s
    d = {}
    root = Stub(kind='root', name=root_name)
    indent_stack = [-1] # To prevent the root from being popped.
    stub_stack = [root]
    lines = []
    pat = re.compile(r'^([ ]*)(def|class)\s+([a-zA-Z_]+)(.*)')
    for line in g.splitLines(s):
        m = pat.match(line)
        if m:
            indent, kind, name, rest = (
                len(m.group(1)), m.group(2), m.group(3), m.group(4))
            old_indent = indent_stack[-1]
            # Terminate any previous lines.
            old_stub = stub_stack[-1]
            old_stub.out_list.extend(lines)
            if trace:
                for s in lines:
                    g.trace('  '+s.rstrip())
            lines = [line]
            # Adjust the stacks.
            if indent == old_indent:
                stub_stack.pop()
            elif indent &gt; old_indent:
                indent_stack.append(indent)
            else: # indent &lt; old_indent
                # The indent_stack can't underflow because
                # indent &gt;= 0 and indent_stack[0] &lt; 0
                assert indent &gt;= 0
                while indent &lt;= indent_stack[-1]:
                    indent_stack.pop()
                    old_stub = stub_stack.pop()
                    assert old_stub != root
                indent_stack.append(indent)
            # Create and push the new stub *after* adjusting the stacks.
            assert stub_stack
            parent = stub_stack[-1]
            stack = [z.name for z in stub_stack[1:]]
            parent = stub_stack[-1]
            stub = Stub(kind, name, parent, stack)
            self.add_stub(d, stub)
            stub_stack.append(stub)
            if trace:
                g.trace('%s%5s %s %s' % (' '*indent, kind, name, rest))
        else:
            parent = stub_stack[-1]
            lines.append(line)
    # Terminate the last stub.
    old_stub = stub_stack[-1]
    old_stub.out_list.extend(lines)
    if trace:
        for s in lines:
            g.trace('  '+s.rstrip())
    return d, root
</t>
<t tx="ekr.20160220050433.172">
def merge_stubs(self, new_stubs, old_root, new_root, trace=False):
    '''
    Merge the new_stubs *list* into the old_root *tree*.
    - new_stubs is a list of Stubs from the .py file.
    - old_root is the root of the stubs from the .pyi file.
    - new_root is the root of the stubs from the .py file.
    '''
    trace = False or trace ; verbose = False
    # Part 1: Delete old stubs do *not* exist in the *new* tree.
    aList = self.check_delete(new_stubs,
                              old_root,
                              new_root,
                              trace and verbose)
        # Checks that all ancestors of deleted nodes will be deleted.
    aList = list(reversed(self.sort_stubs_by_hierarchy(aList)))
        # Sort old stubs so that children are deleted before parents.
    if trace and verbose:
        dump_list('ordered delete list', aList)
    for stub in aList:
        if trace: g.trace('deleting  %s' % stub)
        parent = self.find_parent_stub(stub, old_root) or old_root
        parent.children.remove(stub)
        assert not self.find_stub(stub, old_root), stub
    # Part 2: Insert new stubs that *not* exist in the *old* tree.
    aList = [z for z in new_stubs if not self.find_stub(z, old_root)]
    aList = self.sort_stubs_by_hierarchy(aList)
        # Sort new stubs so that parents are created before children.
    for stub in aList:
        if trace: g.trace('inserting %s' % stub)
        parent = self.find_parent_stub(stub, old_root) or old_root
        parent.children.append(stub)
        assert self.find_stub(stub, old_root), stub</t>
<t tx="ekr.20160220050433.173">
def check_delete(self, new_stubs, old_root, new_root, trace):
    '''Return a list of nodes that can be deleted.'''
    old_stubs = self.flatten_stubs(old_root)
    old_stubs.remove(old_root)
    aList = [z for z in old_stubs if z not in new_stubs]
    if trace:
        dump_list('old_stubs', old_stubs)
        dump_list('new_stubs', new_stubs)
        dump_list('to-be-deleted stubs', aList)
    delete_list = []
    # Check that all parents of to-be-delete nodes will be deleted.
    for z in aList:
        z1 = z
        for i in range(20):
            z = z.parent
            if not z:
                g.trace('can not append: new root not found', z)
                break
            elif z == old_root:
                # if trace: g.trace('can delete', z1)
                delete_list.append(z1)
                break
            elif z not in aList:
                g.trace("can not delete %s because of %s" % (z1, z))
                break
        else:
            g.trace('can not happen: parent loop')
    if trace:
        dump_list('delete_list', delete_list)
    return delete_list</t>
<t tx="ekr.20160220050433.174">
def flatten_stubs(self, root):
    '''Return a flattened list of all stubs in root's tree.'''
    aList = [root]
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
    return aList
        
def flatten_stubs_helper(self, root, aList):
    '''Append all stubs in root's tree to aList.'''
    aList.append(root)
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
</t>
<t tx="ekr.20160220050433.175">
def find_parent_stub(self, stub, root):
    '''Return stub's parent **in root's tree**.'''
    return self.find_stub(stub.parent, root) if stub.parent else None
</t>
<t tx="ekr.20160220050433.176">
def find_stub(self, stub, root):
    '''Return the stub **in root's tree** that matches stub.'''
    if stub == root: # Must use Stub.__eq__!
        return root # not stub!
    for child in root.children:
        stub2 = self.find_stub(stub, child)
        if stub2: return stub2
    return None
</t>
<t tx="ekr.20160220050433.177">
def sort_stubs_by_hierarchy(self, stubs1):
    '''
    Sort the list of Stubs so that parents appear before all their
    descendants.
    '''
    stubs, result = stubs1[:], []
    for i in range(50):
        if stubs:
            # Add all stubs with i parents to the results.
            found = [z for z in stubs if z.level() == i]
            result.extend(found)
            for z in found:
                stubs.remove(z)
        else:
            return result
    g.trace('can not happen: unbounded stub levels.')
    return [] # Abort the merge.
</t>
<t tx="ekr.20160220050433.178">
def trace_stubs(self, stub, aList=None, header=None, level=-1):
    '''Return a trace of the given stub and all its descendants.'''
    indent = ' '*4*max(0,level)
    if level == -1:
        aList = ['===== %s...\n' % (header) if header else '']
    for s in stub.out_list:
        aList.append('%s%s' % (indent, s.rstrip()))
    for child in stub.children:
        self.trace_stubs(child, level=level+1, aList=aList)
    if level == -1:
        return '\n'.join(aList) + '\n'
</t>
<t tx="ekr.20160220050433.179">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def visit_ClassDef(self, node):
    
    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('class', node.name,old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.class_name_stack.append(node.name)
    self.context_stack.append(node.name)
    if self.trace_matches or self.trace_reduce:
        print('\nclass %s\n' % node.name)
    # Format...
    if not node.name.startswith('_'):
        if node.bases:
            s = '(%s)' % ', '.join([self.format(z) for z in node.bases])
        else:
            s = ''
        self.out('class %s%s:' % (node.name, s))
    # Visit...
    self.level += 1
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.class_name_stack.pop()
    self.level -= 1
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160220050433.18">
# Contexts...
</t>
<t tx="ekr.20160220050433.180">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def visit_FunctionDef(self, node):

    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('def', node.name, old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.returns = []
    self.level += 1
    self.context_stack.append(node.name)
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.level -= 1
    # Format *after* traversing
    # if self.trace_matches or self.trace_reduce:
        # if not self.class_name_stack:
            # print('def %s\n' % node.name)
    self.out('def %s(%s) -&gt; %s' % (
        node.name,
        self.format_arguments(node.args),
        self.format_returns(node)))
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160220050433.181">
# arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

def format_arguments(self, node):
    '''
    Format the arguments node.
    Similar to AstFormat.do_arguments, but it is not a visitor!
    '''
    assert isinstance(node,ast.arguments), node
    args = [self.raw_format(z) for z in node.args]
    defaults = [self.raw_format(z) for z in node.defaults]
    # Assign default values to the last args.
    result = []
    n_plain = len(args) - len(defaults)
    # pylint: disable=consider-using-enumerate
    for i in range(len(args)):
        s = self.munge_arg(args[i])
        if i &lt; n_plain:
            result.append(s)
        else:
            result.append('%s=%s' % (s, defaults[i - n_plain]))
    # Now add the vararg and kwarg args.
    name = getattr(node, 'vararg', None)
    if name:
        if hasattr(ast, 'arg'): # python 3:
            name = self.raw_format(name)
        result.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name:
        if hasattr(ast, 'arg'): # python 3:
            name = self.raw_format(name)
        result.append('**' + name)
    return ', '.join(result)
</t>
<t tx="ekr.20160220050433.182">
def munge_arg(self, s):
    '''Add an annotation for s if possible.'''
    if s == 'self':
        return s
    for pattern in self.general_patterns:
        if pattern.match_entire_string(s):
            return '%s: %s' % (s, pattern.repl_s)
    if self.warn and s not in self.warn_list:
        self.warn_list.append(s)
        print('no annotation for %s' % s)
    return s + ': Any'
</t>
<t tx="ekr.20160220050433.183">
def format_returns(self, node):
    '''
    Calculate the return type:
    - Return None if there are no return statements.
    - Patterns in [Def Name Patterns] override all other patterns.
    - Otherwise, return a list of return values.
    '''
    trace = False
    name = self.get_def_name(node)
    raw = [self.raw_format(z) for z in self.returns]
    r = [self.format(z) for z in self.returns]
        # Allow StubFormatter.do_Return to do the hack.
    # Step 1: Return None if there are no return statements.
    if trace and self.returns:
        g.trace('name: %s r:\n%s' % (name, r))
    if not [z for z in self.returns if z.value != None]:
        return 'None: ...'
    # Step 2: [Def Name Patterns] override all other patterns.
    for pattern in self.def_patterns:
        found, s = pattern.match(name)
        if found:
            if trace:
                g.trace('*name pattern %s: %s -&gt; %s' % (
                    pattern.find_s, name, s))
            return s + ': ...'
    # Step 3: remove recursive calls.
    raw, r = self.remove_recursive_calls(name, raw, r)
    # Step 4: Calculate return types.
    return self.format_return_expressions(name, raw, r)
</t>
<t tx="ekr.20160220050433.184">
def format_return_expressions(self, name, raw_returns, reduced_returns):
    '''
    aList is a list of maximally reduced return expressions.
    For each expression e in Alist:
    - If e is a single known type, add e to the result.
    - Otherwise, add Any # e to the result.
    Return the properly indented result.
    '''
    assert len(raw_returns) == len(reduced_returns)
    lws =  '\n' + ' '*4
    n = len(raw_returns)
    known = all([is_known_type(e) for e in reduced_returns])
    # g.trace(reduced_returns)
    if not known or self.verbose:
        # First, generate the return lines.
        aList = []
        for i in range(n):
            e, raw = reduced_returns[i], raw_returns[i]
            known = ' ' if is_known_type(e) else '?'
            aList.append('# %s %s: %s' % (' ', i, raw))
            aList.append('# %s %s: return %s' % (known, i, e))
        results = ''.join([lws + self.indent(z) for z in aList])
        # Put the return lines in their proper places.
        if known:
            s = reduce_types(reduced_returns,
                             name=name,
                             trace=self.trace_reduce)
            return s + ': ...' + results
        else:
            return 'Any: ...' + results
    else:
        s = reduce_types(reduced_returns,
                         name=name,
                         trace=self.trace_reduce) 
        return s + ': ...'
</t>
<t tx="ekr.20160220050433.185">
def get_def_name(self, node):
    '''Return the representaion of a function or method name.'''
    if self.class_name_stack:
        name = '%s.%s' % (self.class_name_stack[-1], node.name)
        # All ctors should return None
        if node.name == '__init__':
            name = 'None'
    else:
        name = node.name
    return name
</t>
<t tx="ekr.20160220050433.186">
def remove_recursive_calls(self, name, raw, reduced):
    '''Remove any recursive calls to name from both lists.'''
    # At present, this works *only* if the return is nothing but the recursive call.
    trace = False
    assert len(raw) == len(reduced)
    pattern = Pattern('%s(*)' % name)
    n = len(reduced)
    raw_result, reduced_result = [], []
    for i in range(n):
        if pattern.match_entire_string(reduced[i]):
            if trace:
                g.trace('****', name, pattern, reduced[i])
        else:
            raw_result.append(raw[i])
            reduced_result.append(reduced[i])
    return raw_result, reduced_result</t>
<t tx="ekr.20160220050433.187">
def visit_Return(self, node):

    self.returns.append(node)
        # New: return the entire node, not node.value.
</t>
<t tx="ekr.20160220050433.188">

class TestClass(object):
    '''
    A class containing constructs that have caused difficulties.
    This is in the make_stub_files directory, not the test directory.
    '''
    # pylint: disable=no-member
    # pylint: disable=undefined-variable
    # pylint: disable=no-self-argument
    # pylint: disable=no-method-argument
    @others</t>
<t tx="ekr.20160220050433.189">
def parse_group(group):
    if len(group) &gt;= 3 and group[-2] == 'as':
        del group[-2:]
    ndots = 0
    i = 0
    while len(group) &gt; i and group[i].startswith('.'):
        ndots += len(group[i])
        i += 1
    assert ''.join(group[:i]) == '.'*ndots, group
    del group[:i]
    assert all(g == '.' for g in group[1::2]), group
    return ndots, os.sep.join(group[::2])
</t>
<t tx="ekr.20160220050433.19">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def do_ClassDef(self, node):
    result = []
    name = node.name # Only a plain string is valid.
    bases = [self.visit(z) for z in node.bases] if node.bases else []
    result.append('\n\n')
    if bases:
        result.append(self.indent('class %s(%s):\n' % (name, ', '.join(bases))))
    else:
        result.append(self.indent('class %s:\n' % name))
    for i, z in enumerate(node.body):
        self.level += 1
        self.first_statement = i == 0
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.190">
def return_all(self):
    return all([is_known_type(z) for z in s3.split(',')])
    # return all(['abc'])</t>
<t tx="ekr.20160220050433.191">
def return_array():
    return f(s[1:-1])</t>
<t tx="ekr.20160220050433.192">
def return_list(self, a):
    return [a]</t>
<t tx="ekr.20160220050433.193">
def return_two_lists(s):
    if 1:
        return aList
    else:
        return list(self.regex.finditer(s))
</t>
<t tx="ekr.20160220050433.2">import ast
import ast_utils
from collections import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.
try:
    import ConfigParser as configparser # Python 2
except ImportError:
    import configparser # Python 3
import glob
import optparse
import os
# import re
import sys
import time
try:
    import StringIO as io # Python 2
except ImportError:
    import io # Python 3
</t>
<t tx="ekr.20160220050433.20">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def do_FunctionDef(self, node):
    '''Format a FunctionDef node.'''
    result = []
    if node.decorator_list:
        for z in node.decorator_list:
            result.append(self.indent('@%s\n' % self.visit(z)))
    name = node.name # Only a plain string is valid.
    args = self.visit(node.args) if node.args else ''
    result.append('\n')
    result.append(self.indent('def %s(%s):\n' % (name, args)))
    for i, z in enumerate(node.body):
        self.level += 1
        self.first_statement = i == 0
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

    return''.join([self.visit(z) for z in node.body])
</t>
<t tx="ekr.20160220050433.23">
def do_Lambda(self, node):
    return self.indent('lambda %s: %s' % (
        self.visit(node.args),
        self.visit(node.body)))
</t>
<t tx="ekr.20160220050433.24">
# Expressions...
</t>
<t tx="ekr.20160220050433.25">
def do_Expr(self, node):
    '''An outer expression: must be indented.'''
    return self.indent('%s\n' % self.visit(node.value))
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
<t tx="ekr.20160220050433.28">
def do_AugLoad(self, node):
    return 'AugLoad'

def do_Del(self, node):
    return 'Del'

def do_Load(self, node):
    return 'Load'

def do_Param(self, node):
    return 'Param'

def do_Store(self, node):
    return 'Store'
</t>
<t tx="ekr.20160220050433.29">
# Operands...
</t>
<t tx="ekr.20160220050433.3"></t>
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
        if isPython3 and isinstance(name, ast.arg):
            name = name.arg
        args2.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name:
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
    return '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.
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
    return '%s(%s)' % (func, ','.join(args))
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
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        # result.append('{\n' if keys else '{')
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
        # result.append(',\n'.join(items))
        # result.append('\n}' if keys else '}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
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
<t tx="ekr.20160220050433.4">
def is_known_type(s):
    '''
    Return True if s is nothing but a single known type.
    Recursively test inner types in square brackets.
    '''
    return ReduceTypes().is_known_type(s)
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
    return node.id

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
    # A pretty spectacular hack.
    # We assume docstrings are the first expr following a class or def.
    docstring = False
    if self.first_statement:
        callers = ''.join([z for z in g.callers(2).split(',') if z != 'visit'])
        docstring = callers.endswith('do_Expr')
    if docstring:
        s = repr(node.s).replace('\\n','\n')
        if s.startswith('"'):
            return '""%s""' % s
        else:
            return "''%s''" % s
    else:
        return repr(node.s)
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
<t tx="ekr.20160220050433.5">
def merge_types(a1, a2):
    '''
    a1 and a2 may be strings or lists.
    return a list containing both of them, flattened, without duplicates.
    '''
    # Only useful if visitors could return either lists or strings.
    assert a1 is not None
    assert a2 is not None
    r1 = a1 if isinstance(a1, (list, tuple)) else [a1]
    r2 = a2 if isinstance(a2, (list, tuple)) else [a2]
    return sorted(set(r1 + r2))
</t>
<t tx="ekr.20160220050433.50">
# Operators...
</t>
<t tx="ekr.20160220050433.51">
def do_BinOp(self, node):
    return '%s%s%s' % (
        self.visit(node.left),
        self.op_name(node.op),
        self.visit(node.right))
</t>
<t tx="ekr.20160220050433.52">
def do_BoolOp(self, node):
    op_name = self.op_name(node.op)
    values = [self.visit(z) for z in node.values]
    return op_name.join(values)
</t>
<t tx="ekr.20160220050433.53">
def do_Compare(self, node):
    result = []
    lt = self.visit(node.left)
    ops = [self.op_name(z) for z in node.ops]
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
        self.op_name(node.op),
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
# Statements...
</t>
<t tx="ekr.20160220050433.57">
def do_Assert(self, node):
    test = self.visit(node.test)
    if getattr(node, 'msg', None):
        message = self.visit(node.msg)
        return self.indent('assert %s, %s\n' % (test, message))
    else:
        return self.indent('assert %s\n' % test)
</t>
<t tx="ekr.20160220050433.58">
def do_Assign(self, node):
    return self.indent('%s=%s\n' % (
        '='.join([self.visit(z) for z in node.targets]),
        self.visit(node.value)))
</t>
<t tx="ekr.20160220050433.59">
def do_AugAssign(self, node):
    return self.indent('%s%s=%s\n' % (
        self.visit(node.target),
        self.op_name(node.op), # Bug fix: 2013/03/08.
        self.visit(node.value)))
</t>
<t tx="ekr.20160220050433.6">
def reduce_types(aList, name=None, trace=False):
    '''
    Return a string containing the reduction of all types in aList.
    The --trace-reduce command-line option sets trace=True.
    If present, name is the function name or class_name.method_name.
    '''
    return ReduceTypes(aList, name, trace).reduce_types()
</t>
<t tx="ekr.20160220050433.60">
def do_Break(self, node):
    return self.indent('break\n')
</t>
<t tx="ekr.20160220050433.61">
def do_Continue(self, node):
    return self.indent('continue\n')
</t>
<t tx="ekr.20160220050433.62">
def do_Delete(self, node):
    targets = [self.visit(z) for z in node.targets]
    return self.indent('del %s\n' % ','.join(targets))
</t>
<t tx="ekr.20160220050433.63">
def do_ExceptHandler(self, node):
    result = []
    result.append(self.indent('except'))
    if getattr(node, 'type', None):
        result.append(' %s' % self.visit(node.type))
    if getattr(node, 'name', None):
        if isinstance(node.name, ast.AST):
            result.append(' as %s' % self.visit(node.name))
        else:
            result.append(' as %s' % node.name) # Python 3.x.
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.64">
# Python 2.x only

def do_Exec(self, node):
    body = self.visit(node.body)
    args = [] # Globals before locals.
    if getattr(node, 'globals', None):
        args.append(self.visit(node.globals))
    if getattr(node, 'locals', None):
        args.append(self.visit(node.locals))
    if args:
        return self.indent('exec %s in %s\n' % (
            body, ','.join(args)))
    else:
        return self.indent('exec %s\n' % (body))
</t>
<t tx="ekr.20160220050433.65">
def do_For(self, node):
    result = []
    result.append(self.indent('for %s in %s:\n' % (
        self.visit(node.target),
        self.visit(node.iter))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.66">
def do_Global(self, node):
    return self.indent('global %s\n' % (
        ','.join(node.names)))
</t>
<t tx="ekr.20160220050433.67">
def do_If(self, node):
    result = []
    result.append(self.indent('if %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.68">
def do_Import(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('import %s\n' % (
        ','.join(names)))
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
# Top-level functions</t>
<t tx="ekr.20160220050433.70">
def do_ImportFrom(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('from %s import %s\n' % (
        node.module,
        ','.join(names)))
</t>
<t tx="ekr.20160220050433.71">
def do_Pass(self, node):
    return self.indent('pass\n')
</t>
<t tx="ekr.20160220050433.72">
# Python 2.x only

def do_Print(self, node):
    vals = []
    for z in node.values:
        vals.append(self.visit(z))
    if getattr(node, 'dest', None):
        vals.append('dest=%s' % self.visit(node.dest))
    if getattr(node, 'nl', None):
        if node.nl == 'False':
            vals.append('nl=%s' % node.nl)
    return self.indent('print(%s)\n' % (
        ','.join(vals)))
</t>
<t tx="ekr.20160220050433.73">
def do_Raise(self, node):
    args = []
    for attr in ('type', 'inst', 'tback'):
        if getattr(node, attr, None) is not None:
            args.append(self.visit(getattr(node, attr)))
    if args:
        return self.indent('raise %s\n' % (
            ','.join(args)))
    else:
        return self.indent('raise\n')
</t>
<t tx="ekr.20160220050433.74">
def do_Return(self, node):
    if node.value:
        return self.indent('return %s\n' % (
            self.visit(node.value).strip()))
    else:
        return self.indent('return\n')
</t>
<t tx="ekr.20160220050433.75">
def do_TryExcept(self, node):
    result = []
    result.append(self.indent('try:\n'))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.handlers:
        for z in node.handlers:
            result.append(self.visit(z))
    if node.orelse:
        result.append('else:\n')
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.76">
def do_TryFinally(self, node):
    result = []
    result.append(self.indent('try:\n'))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    result.append(self.indent('finally:\n'))
    for z in node.finalbody:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.77">
def do_While(self, node):
    result = []
    result.append(self.indent('while %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append('else:\n')
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.78">
def do_With(self, node):
    result = []
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
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    result.append('\n')
    return ''.join(result)
</t>
<t tx="ekr.20160220050433.79">
def do_Yield(self, node):
    if getattr(node, 'value', None):
        return self.indent('yield %s\n' % (
            self.visit(node.value)))
    else:
        return self.indent('yield\n')
</t>
<t tx="ekr.20160220050433.8">
def dump(title, s=None):
    if s:
        print('===== %s...\n%s\n' % (title, s.rstrip()))
    else:
        print('===== %s...\n' % title)
</t>
<t tx="ekr.20160220050433.81">
def kind(self, node):
    '''Return the name of node's class.'''
    return node.__class__.__name__
</t>
<t tx="ekr.20160220050433.82">
def indent(self, s):
    '''Return s, properly indented.'''
    assert not s.startswith('\n'), g.callers()
    return '%s%s' % (' ' * 4 * self.level, s)
</t>
<t tx="ekr.20160220050433.83">
def op_name (self,node,strict=True):
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
<t tx="ekr.20160220050433.84">

class AstArgFormatter (AstFormatter):
    '''
    Just like the AstFormatter class, except it prints the class
    names of constants instead of actual values.
    '''
    @others</t>
<t tx="ekr.20160220050433.85">
# Return generic markers to allow better pattern matches.

def do_BoolOp(self, node): # Python 2.x only.
    return 'bool'

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Name(self, node):
    return 'bool' if node.id in ('True', 'False') else node.id

def do_Num(self, node):
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
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
    print('')</t>
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
def shortFileName(self,fileName, n=None):
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
<t tx="ekr.20160220050433.95">

class Pattern(object):
    '''
    A class representing regex or balanced patterns.
    
    Sample matching code, for either kind of pattern:
        
        for m in reversed(pattern.all_matches(s)):
            s = pattern.replace(m, s)
    '''
    @others
</t>
<t tx="ekr.20160220050433.96">
def __init__ (self, find_s, repl_s=''):
    '''Ctor for the Pattern class.'''
    self.find_s = find_s
    self.repl_s = repl_s
    if self.is_regex():
        self.regex = re.compile(find_s)
    elif self.is_balanced():
        self.regex = None
    else:
        # Escape all dangerous characters.
        result = []
        for ch in find_s:
            if ch == '_' or ch.isalnum():
                result.append(ch)
            else:
                result.append('\\'+ch)
        self.regex = re.compile(''.join(result))
</t>
<t tx="ekr.20160220050433.97">
def __eq__(self, obj):
    """Return True if two Patterns are equivalent."""
    if isinstance(obj, Pattern):
        return self.find_s == obj.find_s and self.repl_s == obj.repl_s
    else:
        return NotImplemented

def __ne__(self, obj):
    """Return True if two Patterns are not equivalent."""
    return not self.__eq__(obj)

def __hash__(self):
    '''Pattern.__hash__'''
    return len(self.find_s) + len(self.repl_s)</t>
<t tx="ekr.20160220050433.98">
def __repr__(self):
    '''Pattern.__repr__'''
    return '%s: %s' % (self.find_s, self.repl_s)
    
__str__ = __repr__
</t>
<t tx="ekr.20160220050433.99">
def is_balanced(self):
    '''Return True if self.find_s is a balanced pattern.'''
    s = self.find_s
    if s.endswith('*'):
        return True
    for pattern in ('(*)', '[*]', '{*}'):
        if s.find(pattern) &gt; -1:
            return True
    return False
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
<t tx="ekr.20160220051105.1"></t>
<t tx="ekr.20160220051359.1"></t>
<t tx="ekr.20160220051359.2">pylint
clone-find-all-flattened
clone-to-at-spot
beautify-tree
sort-lines
</t>
<t tx="ekr.20160220051359.3">@language python

c.cloneFindAllFlattenedAtNode('@clean make_stub_files.py',top_level=True)
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
                print(repr(p.b[:3]), p.h)
print('done')
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
<t tx="ekr.20160220054807.1"></t>
<t tx="ekr.20160220055816.3">
def output_time_stamp(self, f):
    '''Put a time-stamp in the output file f.'''
    f.write('# python_to_coffeescript: %s\n' %
        time.strftime("%a %d %b %Y at %H:%M:%S"))
</t>
<t tx="ekr.20160220073633.1"></t>
<t tx="ekr.20160220081725.1"># -*- coding: utf-8 -*-
# https://bitbucket.org/plas/thonny/src/3b71fda7ac0b66d5c475f7a668ffbdc7ae48c2b5/thonny/ast_utils.py?at=master
&lt;&lt; imports &gt;&gt;
# pylint: disable=deprecated-lambda
isPython3 = sys.version_info &gt;= (3, 0, 0)
@others
</t>
<t tx="ekr.20160220081959.1">import ast
import _ast
import io
import sys
import token
import tokenize
# from thonny.common import TextRange
import traceback
</t>
<t tx="ekr.20160220081959.10">def value_to_literal(value):
    if value is None:
        return ast.Name(id="None", ctx=ast.Load())
    elif isinstance(value, bool):
        if value:
            return ast.Name(id="True", ctx=ast.Load())
        else:
            return ast.Name(id="False", ctx=ast.Load())
    elif isinstance(value, str):
        return ast.Str(s=value)
    else:
        raise NotImplementedError("only None, bool and str supported at the moment, not " + str(type(value)))
</t>
<t tx="ekr.20160220081959.11">def fix_ast_problems(tree, source_lines, tokens):

    # Problem 1:
    # Python parser gives col_offset as offset to its internal UTF-8 byte array
    # I need offsets to chars
    utf8_byte_lines = list(map(lambda line: line.encode("UTF-8"), source_lines))

    # Problem 2:
    # triple-quoted strings have just plain wrong positions: http://bugs.python.org/issue18370
    # Fortunately lexer gives them correct positions
    string_tokens = list(filter(lambda tok: tok.type == token.STRING, tokens))

    # Problem 3:
    # Binary operations have wrong positions: http://bugs.python.org/issue18374
    # Problem 4:
    # Function calls have wrong positions in Python 3.4: http://bugs.python.org/issue21295
    # similar problem is with Attributes and Subscripts

    def fix_node(node):
        for child in _get_ordered_child_nodes(node):
        #for child in ast.iter_child_nodes(node):
            fix_node(child)
        if isinstance(node, ast.Str):
            # fix triple-quote problem
            # get position from tokens
            token = string_tokens.pop(0)
            node.lineno, node.col_offset = token.start
        elif((isinstance(node, ast.Expr) or isinstance(node, ast.Attribute))
            and isinstance(node.value, ast.Str)):
            # they share the wrong offset of their triple-quoted child
            # get position from already fixed child
            # TODO: try whether this works when child is in parentheses
            node.lineno = node.value.lineno
            node.col_offset = node.value.col_offset
        elif(isinstance(node, ast.BinOp)
            and compare_node_positions(node, node.left) &gt; 0):
            # fix binop problem
            # get position from an already fixed child
            node.lineno = node.left.lineno
            node.col_offset = node.left.col_offset
        elif(isinstance(node, ast.Call)
            and compare_node_positions(node, node.func) &gt; 0):
            # Python 3.4 call problem
            # get position from an already fixed child
            node.lineno = node.func.lineno
            node.col_offset = node.func.col_offset
        elif(isinstance(node, ast.Attribute)
            and compare_node_positions(node, node.value) &gt; 0):
            # Python 3.4 attribute problem ...
            node.lineno = node.value.lineno
            node.col_offset = node.value.col_offset
        elif(isinstance(node, ast.Subscript)
            and compare_node_positions(node, node.value) &gt; 0):
            # Python 3.4 Subscript problem ...
            node.lineno = node.value.lineno
            node.col_offset = node.value.col_offset
        else:
            # Let's hope this node has correct lineno, and byte-based col_offset
            # Now compute char-based col_offset
            if hasattr(node, "lineno"):
                byte_line = utf8_byte_lines[node.lineno - 1]
                char_col_offset = len(byte_line[: node.col_offset].decode("UTF-8"))
                node.col_offset = char_col_offset

    fix_node(tree)
</t>
<t tx="ekr.20160220081959.12">def compare_node_positions(n1, n2):
    if n1.lineno &gt; n2.lineno:
        return 1
    elif n1.lineno &lt; n2.lineno:
        return -1
    elif n1.col_offset &gt; n2.col_offset:
        return 1
    elif n2.col_offset &lt; n2.col_offset:
        return -1
    else:
        return 0
</t>
<t tx="ekr.20160220081959.13">def pretty(node, key="/", level=0):
    """Used for testing and new test generation via AstView.
    Don't change the format without updating tests"""
    if isinstance(node, ast.AST):
        fields = [(key, val) for key, val in ast.iter_fields(node)]
        value_label = node.__class__.__name__
        if isinstance(node, ast.Call):
            # Try to make 3.4 AST-s more similar to 3.5
            if sys.version_info[: 2] == (3, 4):
                if ("kwargs", None) in fields:
                    fields.remove(("kwargs", None))
                if ("starargs", None) in fields:
                    fields.remove(("starargs", None))
            # TODO: translate also non-None kwargs and starargs
    elif isinstance(node, list):
        fields = list(enumerate(node))
        if len(node) == 0:
            value_label = "[]"
        else:
            value_label = "[...]"
    else:
        fields = []
        value_label = repr(node)
    item_text = level * '    ' + str(key) + "=" + value_label
    if hasattr(node, "lineno"):
        item_text += " @ " + str(getattr(node, "lineno"))
        if hasattr(node, "col_offset"):
            item_text += "." + str(getattr(node, "col_offset"))
        if hasattr(node, "end_lineno"):
            item_text += "  -  " + str(getattr(node, "end_lineno"))
            if hasattr(node, "end_col_offset"):
                item_text += "." + str(getattr(node, "end_col_offset"))
    lines = [item_text] + [pretty(field_value, field_key, level + 1)
                           for field_key, field_value in fields]
    return "\n".join(lines)
</t>
<t tx="ekr.20160220081959.14">def _get_ordered_child_nodes(node):
    if isinstance(node, ast.Dict):
        children = []
        for i in range(len(node.keys)):
            children.append(node.keys[i])
            children.append(node.values[i])
        return children
    elif isinstance(node, ast.Call):
        children = [node.func] + node.args
        for kw in node.keywords:
            children.append(kw.value)
        # TODO: take care of Python 3.5 updates (eg. args=[Starred] and keywords)
        if hasattr(node, "starargs") and node.starargs is not None:
            children.append(node.starargs)
        if hasattr(node, "kwargs") and node.kwargs is not None:
            children.append(node.kwargs)
        children.sort(key=lambda x: (x.lineno, x.col_offset))
        return children
    else:
        return ast.iter_child_nodes(node)
</t>
<t tx="ekr.20160220081959.15">def _tokens_text(tokens):
    return "".join([t.string for t in tokens])
</t>
<t tx="ekr.20160220081959.16">def _tokenize_with_char_offsets(source):
    """Built-in tokenizer gives token offsets in bytes. I need them in chars.
    Let's call them "thokens"
    
    (Seems that the function is not necessary anymore)
    """
    import collections
    Thoken = collections.namedtuple("Thoken", "type string lineno col_offset end_lineno end_col_offset")
    token_source = tokenize.tokenize(io.BytesIO(source.encode('utf-8')).readline)
    encoding = "UTF-8"
    char_lines = list(map(lambda line: line + "\n", source.split("\n")))
    byte_lines = None
    thokens = []
    for token in token_source:
        if token.type == tokenize.ENCODING:
            # first token
            encoding = token.string
            byte_lines = list(map(lambda line: line.encode(encoding), char_lines))
        if token.start[0] == 0 or (token.start[1] == 0 and token.end[1] == 0):
            # just copy information
            thoken = Thoken(token.type, token.string,
                            token.start[0], token.start[1],
                            token.end[0], token.end[1])
        else:
            # translate byte offsets to char offsets
            assert token.start[0] &gt; 0 # lineno should be &gt; 0
            byte_start_line = byte_lines[token.start[0] - 1]
            char_start_col = len(byte_start_line[: token.start[1]].decode(encoding))
            byte_end_line = byte_lines[token.end[0] - 1]
            char_end_col = len(byte_end_line[: token.end[1]].decode(encoding))
            thoken = Thoken(token.type, token.string,
                            token.start[0], char_start_col,
                            token.end[0], char_end_col)
        thokens.append(thoken)
</t>
<t tx="ekr.20160220081959.2">def extract_text_range(source, text_range):
    lines = source.splitlines(True)
    # get relevant lines
    lines = lines[text_range.lineno - 1: text_range.end_lineno]
    # trim last and first lines
    lines[-1] = lines[-1][: text_range.end_col_offset]
    lines[0] = lines[0][text_range.col_offset:]
    return "".join(lines)
</t>
<t tx="ekr.20160220081959.3">def find_closest_containing_node(tree, text_range):
    # first look among children
    for child in ast.iter_child_nodes(tree):
        result = find_closest_containing_node(child, text_range)
        if result is not None:
            return result
    # no suitable child was found
    if (hasattr(tree, "lineno")
        and TextRange(tree.lineno, tree.col_offset, tree.end_lineno, tree.end_col_offset)
            .contains_smaller_eq(text_range)):
        return tree
    # nope
    else:
        return None
</t>
<t tx="ekr.20160220081959.4">def find_expression(node, text_range):
    if (hasattr(node, "lineno")
        and node.lineno == text_range.lineno and node.col_offset == text_range.col_offset
        and node.end_lineno == text_range.end_lineno and node.end_col_offset == text_range.end_col_offset
        # expression and Expr statement can have same range
        and isinstance(node, _ast.expr)):
        return node
    else:
        for child in ast.iter_child_nodes(node):
            result = find_expression(child, text_range)
            if result is not None:
                return result
        return None
</t>
<t tx="ekr.20160220081959.5">def contains_node(parent_node, child_node):
    for child in ast.iter_child_nodes(parent_node):
        if child == child_node or contains_node(child, child_node):
            return True
    return False
</t>
<t tx="ekr.20160220081959.6">def has_parent_with_class(target_node, parent_class, tree):
    for node in ast.walk(tree):
        if isinstance(node, parent_class) and contains_node(node, target_node):
            return True
    return False
</t>
<t tx="ekr.20160220081959.7">def parse_source(source, filename='&lt;unknown&gt;', mode="exec"):
    root = ast.parse(source, filename, mode)
    mark_text_ranges(root, source)
    return root
</t>
<t tx="ekr.20160220081959.8">def get_last_child(node):
    if isinstance(node, ast.Call):
        # TODO: take care of Python 3.5 updates (Starred etc.)
        if hasattr(node, "kwargs") and node.kwargs is not None:
            return node.kwargs
        elif hasattr(node, "starargs") and node.starargs is not None:
            return node.starargs
        elif len(node.keywords) &gt; 0:
            return node.keywords[-1]
        elif len(node.args) &gt; 0:
            return node.args[-1]
        else:
            return node.func
    elif isinstance(node, ast.BoolOp):
        return node.values[-1]
    elif isinstance(node, ast.BinOp):
        return node.right
    elif isinstance(node, ast.Compare):
        return node.comparators[-1]
    elif isinstance(node, ast.UnaryOp):
        return node.operand
    elif(isinstance(node, (ast.Tuple, ast.List, ast.Set))
          and len(node.elts)) &gt; 0:
        return node.elts[-1]
    elif(isinstance(node, ast.Dict)
          and len(node.values)) &gt; 0:
        return node.values[-1]
    elif(isinstance(node, (ast.Return, ast.Assign, ast.AugAssign, ast.Yield, ast.YieldFrom))
          and node.value is not None):
        return node.value
    elif isinstance(node, ast.Delete):
        return node.targets[-1]
    elif isinstance(node, ast.Expr):
        return node.value
    elif isinstance(node, ast.Assert):
        if node.msg is not None:
            return node.msg
        else:
            return node.test
    elif isinstance(node, ast.Subscript):
        if hasattr(node.slice, "value"):
            return node.slice.value
        else:
            assert(hasattr(node.slice, "lower")
                    and hasattr(node.slice, "upper")
                    and hasattr(node.slice, "step"))
            if node.slice.step is not None:
                return node.slice.step
            elif node.slice.upper is not None:
                return node.slice.upper
            else:
                return node.slice.lower
    elif isinstance(node, (ast.For, ast.While, ast.If, ast.With)):
        return True # There is last child, but I don't know which it will be
    else:
        return None
    # TODO: pick more cases from here:
    """
    (isinstance(node, (ast.IfExp, ast.ListComp, ast.SetComp, ast.DictComp, ast.GeneratorExp))
            or isinstance(node, ast.Raise) and (node.exc is not None or node.cause is not None)
            # or isinstance(node, ast.FunctionDef, ast.Lambda) and len(node.args.defaults) &gt; 0 
                and (node.dest is not None or len(node.values) &gt; 0))
                
            #"TODO: Import ja ImportFrom"
            # TODO: what about ClassDef ???
    """
</t>
<t tx="ekr.20160220081959.9">def mark_text_ranges(node, source):
    """
    Node is an AST, source is corresponding source as string.
    Function adds recursively attributes end_lineno and end_col_offset to each node
    which has attributes lineno and col_offset.
    """
    &lt;&lt; mark_text_ranges helpers &gt;&gt;
    ### all_tokens = list(tokenize.tokenize(io.BytesIO(source.encode('utf-8')).readline))
    readline = io.BytesIO(source.encode('utf-8')).readline
    if isPython3:
        all_tokens = list(tokenize.tokenize(readline))
    else:
        all_tokens = []
        def token_eater(t1, t2, t3, t4, t5):
            all_tokens.append(
                Bunch(type=t1, start=(t2, t3), end=(t3, t4), string=t5))
        tokenize.tokenize(readline, token_eater)
    source_lines = source.splitlines(True)
    fix_ast_problems(node, source_lines, all_tokens)
    prelim_end_lineno = len(source_lines)
    prelim_end_col_offset = len(source_lines[len(source_lines) - 1])
    _mark_text_ranges_rec(node, all_tokens, prelim_end_lineno, prelim_end_col_offset)
</t>
<t tx="ekr.20160220082219.1">class TextRange(Record):
    '''TextRange class from thonny.common.'''
    @others
</t>
<t tx="ekr.20160220082219.10">def get_end_index(self):
    return str(self.end_lineno) + "." + str(self.end_col_offset)
</t>
<t tx="ekr.20160220082219.11">def __str__(self):
    return "TR(" + str(self.lineno) + "." + str(self.col_offset) + ", " + str(self.end_lineno) + "." + str(self.end_col_offset) + ")"
</t>
<t tx="ekr.20160220082219.2">def __init__(self, lineno, col_offset, end_lineno, end_col_offset):
    '''TextRange ctor.'''
    self.lineno = lineno
    self.col_offset = col_offset
    self.end_lineno = end_lineno
    self.end_col_offset = end_col_offset
</t>
<t tx="ekr.20160220082219.3">def contains_smaller(self, other):
    this_start = (self.lineno, self.col_offset)
    this_end = (self.end_lineno, self.end_col_offset)
    other_start = (other.lineno, other.col_offset)
    other_end = (other.end_lineno, other.end_col_offset)
    return (this_start &lt; other_start and this_end &gt; other_end
            or this_start == other_start and this_end &gt; other_end
            or this_start &lt; other_start and this_end == other_end)
</t>
<t tx="ekr.20160220082219.4">def contains_smaller_eq(self, other):
    return self.contains_smaller(other) or self == other
</t>
<t tx="ekr.20160220082219.5">def not_smaller_in(self, other):
    return not other.contains_smaller(self)
</t>
<t tx="ekr.20160220082219.6">def is_smaller_in(self, other):
    return other.contains_smaller(self)
</t>
<t tx="ekr.20160220082219.7">def not_smaller_eq_in(self, other):
    return not other.contains_smaller_eq(self)
</t>
<t tx="ekr.20160220082219.8">def is_smaller_eq_in(self, other):
    return other.contains_smaller_eq(self)
</t>
<t tx="ekr.20160220082219.9">def get_start_index(self):
    return str(self.lineno) + "." + str(self.col_offset)
</t>
<t tx="ekr.20160220082951.1"></t>
<t tx="ekr.20160220084232.1">@others
</t>
<t tx="ekr.20160220084252.1">
def _extract_tokens(tokens, lineno, col_offset, end_lineno, end_col_offset):
    return list(filter((lambda tok: tok.start[0] &gt;= lineno
                               and (tok.start[1] &gt;= col_offset or tok.start[0] &gt; lineno)
                               and tok.end[0] &lt;= end_lineno
                               and (tok.end[1] &lt;= end_col_offset or tok.end[0] &lt; end_lineno)
                               and tok.string != ''),
                       tokens))

</t>
<t tx="ekr.20160220084252.2">
def _mark_text_ranges_rec(node, tokens, prelim_end_lineno, prelim_end_col_offset):
    """
    Returns the earliest starting position found in given tree, 
    this is convenient for internal handling of the siblings
    """
    # set end markers to this node
    if "lineno" in node._attributes and "col_offset" in node._attributes:
        tokens = _extract_tokens(tokens, node.lineno, node.col_offset, prelim_end_lineno, prelim_end_col_offset)
        try:
            tokens = _mark_end_and_return_child_tokens(node, tokens, prelim_end_lineno, prelim_end_col_offset)
        except:
            traceback.print_exc() # TODO: log it somewhere
            # fallback to incorrect marking instead of exception
            node.end_lineno = node.lineno
            node.end_col_offset = node.col_offset + 1
    # mark its children, starting from last one
    # NB! need to sort children because eg. in dict literal all keys come first and then all values
    children = list(_get_ordered_child_nodes(node))
    for child in reversed(children):
        (prelim_end_lineno, prelim_end_col_offset) = \
        _mark_text_ranges_rec(child, tokens, prelim_end_lineno, prelim_end_col_offset)
    if "lineno" in node._attributes and "col_offset" in node._attributes:
        # new "front" is beginning of this node
        prelim_end_lineno = node.lineno
        prelim_end_col_offset = node.col_offset
    return (prelim_end_lineno, prelim_end_col_offset)
</t>
<t tx="ekr.20160220084252.3">
def _strip_trailing_junk_from_expressions(tokens):
    # pylint: disable=no-member
    # the code below works if token.ELLIPSIS does not exist.
    while(tokens[-1].type not in (token.RBRACE, token.RPAR, token.RSQB,
                                  token.NAME, token.NUMBER, token.STRING)
                and not (hasattr(token, "ELLIPSIS") and tokens[-1].type == token.ELLIPSIS)
                and tokens[-1].string not in ")}]"
                or tokens[-1].string in ['and', 'as', 'assert', 'class', 'def', 'del',
                                          'elif', 'else', 'except', 'exec', 'finally',
                                          'for', 'from', 'global', 'if', 'import', 'in',
                                          'is', 'lambda', 'not', 'or', 'try',
                                          'while', 'with', 'yield']):
        del tokens[-1]
</t>
<t tx="ekr.20160220084252.4">def _strip_trailing_extra_closers(tokens, remove_naked_comma):
    level = 0
    for i in range(len(tokens)):
        if tokens[i].string in "({[":
            level += 1
        elif tokens[i].string in ")}]":
            level -= 1
        if level == 0 and tokens[i].string == "," and remove_naked_comma:
            tokens[:] = tokens[0: i]
            return
        if level &lt; 0:
            tokens[:] = tokens[0: i]
            return
</t>
<t tx="ekr.20160220084252.5">def _strip_unclosed_brackets(tokens):
    level = 0
    for i in range(len(tokens) - 1, -1, -1):
        if tokens[i].string in "({[":
            level -= 1
        elif tokens[i].string in ")}]":
            level += 1
        if level &lt; 0:
            tokens[:] = tokens[0: i]
            level = 0 # keep going, there may be more unclosed brackets
</t>
<t tx="ekr.20160220084252.6">def _mark_end_and_return_child_tokens(node, tokens, prelim_end_lineno, prelim_end_col_offset):
    """
    # shortcut
    node.end_lineno = prelim_end_lineno
    node.end_col_offset = prelim_end_col_offset
    return tokens
    """
    # prelim_end_lineno and prelim_end_col_offset are the start of
    # next positioned node or end of source, ie. the suffix of given
    # range may contain keywords, commas and other stuff not belonging to current node
    # Function returns the list of tokens which cover all its children
    if isinstance(node, _ast.stmt):
        # remove empty trailing lines
        while(tokens[-1].type in (tokenize.NL, tokenize.COMMENT, token.NEWLINE, token.INDENT)
               or tokens[-1].string in (":", "else", "elif", "finally", "except")):
            del tokens[-1]
    else:
        _strip_trailing_extra_closers(tokens, not isinstance(node, ast.Tuple))
        _strip_trailing_junk_from_expressions(tokens)
        _strip_unclosed_brackets(tokens)
    # set the end markers of this node
    node.end_lineno = tokens[-1].end[0]
    node.end_col_offset = tokens[-1].end[1]
    # Peel off some trailing tokens which can't be part any
    # positioned child node.
    # TODO: maybe cleaning from parent side is better than
    # _strip_trailing_junk_from_expressions
    # Remove trailing empty parens from no-arg call
    if (isinstance(node, ast.Call)
        and _tokens_text(tokens[-2:]) == "()"):
        del tokens[-2:]
    # Remove trailing full slice
    elif isinstance(node, ast.Subscript):
        if _tokens_text(tokens[-3:]) == "[:]":
            del tokens[-3:]
        elif _tokens_text(tokens[-4:]) == "[::]":
            del tokens[-4:]
    # Attribute name would confuse the "value" of Attribute
    elif isinstance(node, ast.Attribute):
        assert tokens[-1].type == token.NAME
        del tokens[-1]
        _strip_trailing_junk_from_expressions(tokens)
    return tokens
</t>
<t tx="ekr.20160220085158.1">class ReadLinesClass:
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
<t tx="ekr.20160220093908.1">@ From The Python Cookbook: Often we want to just collect a bunch of
stuff together, naming each item of the bunch; a dictionary's OK for
that, but a small do-nothing class is even handier, and prettier to
use.

Create a Bunch whenever you want to group a few variables:

    point = Bunch(datum=y, squared=y*y, coord=x)

You can read/write the named attributes you just created, add others,
del some of them, etc:
    if point.squared &gt; threshold:
        point.isok = True
@c

class Bunch(object):
    """A class that represents a colection of things.

    Especially useful for representing a collection of related variables."""

    def __init__(self, **keywords):
        self.__dict__.update(keywords)

    def __repr__(self):
        return self.toString()

    def ivars(self):
        return sorted(self.__dict__)

    def keys(self):
        return sorted(self.__dict__)

    def toString(self):
        tag = self.__dict__.get('tag')
        entries = ["%s: %s" % (key, str(self.__dict__.get(key)))
            for key in self.ivars() if key != 'tag']
        if tag:
            return "Bunch(tag=%s)...\n%s\n" % (tag, '\n'.join(entries))
        else:
            return "Bunch...\n%s\n" % '\n'.join(entries)
    # Used by new undo code.

    def __setitem__(self, key, value):
        '''Support aBunch[key] = val'''
        return operator.setitem(self.__dict__, key, value)

    def __getitem__(self, key):
        '''Support aBunch[key]'''
        return operator.getitem(self.__dict__, key)

    def get(self, key, theDefault=None):
        return self.__dict__.get(key, theDefault)

bunch = Bunch
</t>
<t tx="ekr.20160220094909.1">
# Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

def do_Try(self, node): # Python 3
    result = []
    result.append(self.indent('try:\n'))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.handlers:
        for z in node.handlers:
            result.append(self.visit(z))
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    if node.finalbody:
        result.append(self.indent('finally:\n'))
        for z in node.finalbody:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
</tnodes>
</leo_file>
