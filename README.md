
This is the readme file for python_to_coffeescript.py. It explains what
the script does, why I created it, how to use the script. A last section explains why the code is as it is and how it may evolve. Full source code for the script is in its [github repository](https://github.com/edreamleo/python-to-coffeescript). This script is offered under the terms of [Leo's MIT License](http://leoeditor.com/license.html).


### Overview

This script makes a [coffeescript](http://coffeescript.org/) (.coffee) file in the output directory for each source file listed on the command line (wildcard file names are supported). This script never creates directories automatically, nor does it overwrite .coffee files unless the --overwrite command-line option is in effect.

This script merely converts python syntax to the roughly equivalent coffeescript syntax. It knows nothing about coffeescript semantics. It is intended *only* to help start creating coffeescript code from an existing python code base.

This script already does much of the grunt work of converting python to coffeescript. The script processes itself without error, but coffeescript itself complains about some results.  This is to be expected at this time.

### Rationale

This script is a *one day prototype*, intended only as a proof of concept. In that sense, it has already succeeded.

The proximate cause for this script was the notes from a [DropBox sprint](https://blogs.dropbox.com/tech/2012/09/dropbox-dives-into-coffeescript/). Coffeescript is obviously successful. Numerous python-to-javascript systems seem unlikely ever to gain traction.

Googling 'python to javascript' or 'python to coffeescript' yields no similar tools, despite many similar searches. This script will be useful to me.


### Quick Start

1. Put `python_to_coffeescript.py` on your path.

2. Enter a directory containing .py files:

        cd myDirectory
    
3. Generate foo.coffee from foo.py:

        python_to_coffeescript foo.py

4. Look at foo.coffee to see the generated coffeescript code:

        edit foo.coffee

5. (Optional) Run coffeescript itself on the code:

        coffee foo.coffee

6. Regenerate foo.coffee, overwriting the previous .coffee file:

        python_to_coffeescript.py foo.py -o
   
7. (Optional) Specify a configuration file containing defaults:

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

The initial version of this script was based on ast trees. It is in the attic (the Unused Code section of the python_to_coffeescript.leo). The great disadvantage of parse trees is that it is *extremely* difficult to associate tokens with parse nodes. See [this discussion](http://stackoverflow.com/questions/16748029/how-to-get-source-corresponding-to-a-python-ast-node) and [this proposed solution](https://bitbucket.org/plas/thonny/src/3b71fda7ac0b66d5c475f7a668ffbdc7ae48c2b5/thonny/common.py?at=master). Imo, the solution is not good enough.

**Important**: Even if there were no holes in the ast api, it would still be tricky to associate tokens with parse trees. My present plan is to experiment with using *both* parse-trees and tokens. The idea will be for the ast visitors to **sync** tokens with keywords and strings. This will allow the accumulation of properly-formatted comments preceding keywords, and will allow the perfect reconstruction of strings, something that appears difficult or impossible with a purely parse-tree-oriented approach.

Finally, note that no matter how the code list is generated, it would be possible to use a real peephole pass on it if required.

### Summary

This has been a success proof of concept. It is surely useful as is.

I have years of experience working with tokens and parse trees. Nevertheless, it remains unclear whether tokens or parse trees will come to dominate the code. Only further work will reveal the best way.

Edward K. Ream  
February 21, 2016
