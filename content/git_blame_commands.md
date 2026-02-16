# Git blame commands

View all Lines Authored by Specified User:
$ git log -p --author=Esteban index.html

OR, git blame <filename> | grep <authorname>:
$ git blame index.html | grep esteban

For a more generalized commit search, you can use git log. In its simplest form, git log will display a list of commits in reverse chronological order, starting at HEAD. There, you will see the the first commit HASH (the commits from the first to the last one.) You can use that HASH to find out the author of the very first commit (the repository creator): 
$ git log --oneline

Now, if you want to learn more about what changed in a commit, simply copy the commit hash and use git log as follows:
$ git log -p 232216bd

This looks for references of the author in the git logs and the code:
$ for file in *; do git blame -- $file | grep esteban >> blame.txt; done
It prints a blame.txt file.
OR, giving a relative path:
$ for file in relative-dir/*; do git blame -- $file | grep esteban >> blame.txt; done
It prints a blame.txt file.

To find the author and commit information of each line of the last modified version of the file (let’s say, myfile) in your Git repository, you run git blame as follows:
$ git blame myfile

By default, git blame shows the author name. If you want to see the author email instead, run git blame with the -e option as follows:
$ git blame -e index.html

Displaying Long Commit Hash:
$ git blame -l index.html

Combine options:
$ git blame -el index.html

Displaying Raw Timestamp:
By default, git blame shows a nicely formatted date & time. But, if for some reason, you need date & time as timestamp values, you can use the -t option of git blame as follows:
$ git blame -t index.html

Listing Specific Range of Lines:
Syntax:
$ git blame -L startLineNumber,endLineNumber filePath
Example:
$ git blame -L 10,20 index.html

To display N number of lines:
Syntax:
$ git blame -L X,+N
For example, to display 5 lines before from the line 15 (including line 15) of the file:
$ git blame -L 15,+5 index.html
$ git blame -L 15,-5 gulpfile.babel.js

Getting Help:
$ man git-blame
$ git help blame
