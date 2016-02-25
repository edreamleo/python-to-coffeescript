
This is the readme file for py2cs.py. It explains what the script does, why I created it, and how to use the script. A last section explains why the code is as it is and how it may evolve. Full source code for the script is in its [github repository](https://github.com/edreamleo/python-to-coffeescript). This script is offered under the terms of [Leo's MIT License](http://leoeditor.com/license.html).


### Overview

This script makes a [coffeescript](http://coffeescript.org/) (.coffee) file in the output directory for each source file listed on the command line (wildcard file names are supported). This script never creates directories automatically, nor does it overwrite .coffee files unless the --overwrite command-line option is in effect.

This script merely converts python syntax to the roughly equivalent coffeescript syntax. It knows nothing about coffeescript semantics. It is intended *only* to help start creating coffeescript code from an existing python code base.

This script already does much of the grunt work of converting python to coffeescript. The script processes itself without error, but coffeescript itself complains about some results.

### Rationale

The proximate cause for this script were the notes from a [DropBox sprint](https://blogs.dropbox.com/tech/2012/09/dropbox-dives-into-coffeescript/). Coffeescript is obviously successful. Numerous python-to-javascript systems seem unlikely ever to gain traction.

Googling 'python to javascript' or 'python to coffeescript' yields no similar tools, despite many similar searches. This script will be useful to me.

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

### Command-line arguments

    Usage: py2cs.py [options] file1, file2, ...
    
    Options:
      -h, --help          show this help message and exit
      -c FN, --config=FN  full path to configuration file
      -d DIR, --dir=DIR   full path to the output directory
      -o, --overwrite     overwrite existing .coffee files
      -v, --verbose       verbose output

*Note*: glob.glob wildcards can be used in file1, file2, ...

### Summary

py2cs.py could be improved, but it is useful as is. 

Edward K. Ream  
February 21 to 25, 2016
