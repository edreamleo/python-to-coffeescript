
The initial version of python_to_coffeescript.py (the script) used only tokens. This solves all token-related problems, but makes parsing difficult. Conversely, basing the code on ast trees solves all parsing-related problems, but makes recovering token-related information difficult. Yesterday I started experimenting with using parse trees.

This posting gives a preliminary design for a way of associating important token-related data with parse trees. Doing this *cleanly* and *reliably* is far from a trivial project. Imo, it's fascinating and well worth doing for its own sake. I'm starting to have a good feeling about this...

The script needs the following token-related data:

- The **ignored lines** (comment lines and blank lines) that preceed or follow any given **statement line**.

- The **line breaks** occuring within lines. This is not absolutely essential--the script could break lines automatically, but it would be best if the original line breaks were respected.

- The exact spelling of all strings. Essential in general, though perhaps not for python_to_coffeescript.py.

The present plan is as follows:

1. Use *only* the ast.lineno fields and the tokenizer module to recreate token data. The design requires that both the ast.lineno field and Python's tokenizer module are absolutely solid.

2. Ignore the ast.col_offset field. It's notoriously hard to recreate token-related data using col_offset. col_offset is buggy and differs in Python 2 and 3. 

3. Recreate the spelling of strings by traversing the tree in **string order**. That is, we assume that the Str visitor will be called in the order in which strings appear in the source file. This is an important constraint on the traverser class. I *think* it is possible to satisfy this contraint, but I wouldn't be my life on it. Given the list of tokens, we create another list containng only string tokens:

        def tok_name(the_token):
            return token.tok_name[the_token[0]].lower()
    
        string_toks = [z for z in tokens if tok_name(z) == 'string']
    
   The ast.Str visitor gets the strings spelling by popping the next token from the start of the string_toks list.

4. Associate ignored lines with statements by traversing the tree in **line order**. Again, this is a non-trivial constraint on the traversal. Assuming that this constraint can be met, we can *preprocess* the tokens in various ways. For example, it may be useful to tokenize the input line-by-line:

        line_tokens = [list(tokenize.generate_tokens(z)) for z in s.splitlines(True)]
    
   We shall have to munge this list if the ast.lineno is a logical line number instead of a physical line number.

5. Insert line breaks within statements using the line_tokens array. Details omitted. Invention may be required.

### Summary

The overal plan is to sync tokens with statements in the ast tree by preprocessing tokens. There are a number of complicating factors, including continued lines and lines containing multiple statements. Nevertheless, syncing tokens appears more promising than using the ast.col_offset field.

This design is preliminary and experimental. Gotcha's may lurk. Another one-day prototype should prove revealing. I am cautiously optimistic at 4 a.m  ;-)

Edward
