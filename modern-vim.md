1) Who is the audience for this book?  Is the book's tone appropriate
for that audience?

2) Is the book well-organized?  Is the material presented in a
reasonable order, and does it flow well from one topic to the next?
Does the table of contents provide a useful guide?

3) Is the book correct?  Are there any technical details that are in
error, misleading, or perhaps recently superseded?

4) Is the book engaging? Do you want to keep reading it?

5) Is the book complete? Are there any missing topics, or
extraneous topics that should not have been included?

6) Is the book consistent?  Is the level of detail consistent and
appropriate?  How about the audience being addressed?

7) Would you recommend this book to others? Why or why not?

For any of these questions, if the answer is "no," what could be
done to improve it?


p. vii

"I didn’t choose this notation without good reason." would be much
clearer as "I chose this notation for a good reason."


p. 3
In vim8, I went to build all my help tags

    :helptags ALL

It came back with:

    E152: Cannot open /usr/local/vim8/share/vim/vim80/doc/tags

I had just made a fresh install of vim8 and root owns that tags file.
I `chmod`ded it and all was well.

I didn't test this tip under Neovim because the pathing is all different.

You said that you created a package called `bundle`, but I think that
will be confusing to people (like me) who already know "bundle" as a
directory name to put bundles in.  As a vim 7.4+pathogen user, all my
packages are in `~/.vim/bundle`.

I think you need to explicitly explain what a package is.  Unless I
look at `:help packages`, I don't know that a package is a directory
that groups plugins.  Is there any more to a package than just being
a directory?
