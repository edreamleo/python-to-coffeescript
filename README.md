
This is the readme file for python_to_coffeescript.py. It explains what
the script does, why I created it, how to use the script. A last section explains why the code is as it is and how it may evolve. Full source code for the script is in its [github repository](). This script is offered under the terms of the [MIT License]().


### Overview

This script makes a [coffeescript]() (.coffee) file in the output directory for each source file listed on the command line (wildcard file names are supported). This script never creates directories automatically, nor does it overwrite .coffee files unless the --overwrite command-line option is in effect.

This script merely converts python syntax to the roughly equivalent coffeescript syntax. It knows nothing about coffeescript semantics. It is intended *only* to help start creating coffeescript code from an existing python code base.

This script already does much of the grunt work of converting python to coffeescript. The script processes itself without error, but coffeescript itself complains about some results.  This is to be expected at this time.

### Rationale

This script is a *one day prototype*, intended only as a proof of concept. In that sense, it has already succeeded.

The proximate cause for this script was the notes from a [DropBox sprint]. It is apparent that coffeescript is successful, while numerous python-to-javascript systems are in an uncertain state at best. Imo, none are likely to gain traction.

Googling 'python to javascript' or 'python to coffeescript' yields no similar tools, despite many similar searches. This script will be useful to me, which is all that really matters ;-)


### Quick Start

1. Put `python_to_coffeescript.py` on your path.

2. Enter a directory containing .py files:

        cd myDirectory
    
3. Generate foo.coffee from foo.pyi:

        python_to_coffeescript foo.py

4. Look at foo.coffee to see the generated coffeescript code.

5. (Optional) Run coffeescript itself on the code:

        coffee foo.coffee

6. Regenerate foo.pyi with more verbose output:

        python_to_coffeescript.py foo.py -o -v

   The -o (--overwrite) option allows the script to overwrite foo.pyi.  
   The -v (--verbose) options generates return comments for all stubs in foo.pyi.
   
7. (Optional) Specify a configuration file containing default

        python_to_coffeescript.py -c myConfigFile.cfg -o

### Command-line arguments

Usage: python_to_coffeescript.py [options] file1, file2, ...

Options:
  -h, --help          show this help message and exit
  -c FN, --config=FN  full path to configuration file
  -d DIR, --dir=DIR   full path to the output directory
  -o, --overwrite     overwrite existing .coffee files
  -t, --test          run unit tests on startup
  -v, --verbose       verbose output

*Note*: glob.glob wildcards can be used in file1, file2, ...

### Code notes

The present code is based on Leo's token-based beautifier command, with substantial modifications brought about by having to parse the code. Using tokens is reasonable. This approach preserves line breaks, comments and the spelling of strings. On the minus side, it requires ad-hoc parsing of Python, which becomes increasingly difficult as more complex syntactic transformations are attempted.

The initial version of this script was based on ast trees. It is in the attic (the Unused Code section of the python_to_coffeescript.leo). The great disadvantage of parse trees is that it is *extremely* difficult to associate tokens with parse nodes. See [this discussion]() and [this proposed solution](). Imo, the solution is not good enough.

My present plan is to experiment with using *both* parse-trees and tokens. The idea will be for the ast visitors to **synch** tokens with keywords and strings. This will allow the accumulation of properly-formatted comments preceding keywords, and will allow the perfect reconstruction of strings, something that appears difficult or impossible with a purely parse-tree-oriented approach.

Finally, note that no matter how the code list is generated, it would be possible to use a real peephole pass on it if required.

### Summary

This has been a success proof of concept. It is surely useful as is. Further work will focus on the interplay between token-oriented views of code and parse-tree-oriented views. Only experience will show how the interplay between the two different views will work out.

Edward K. Ream
February 20 - 21, 2016
