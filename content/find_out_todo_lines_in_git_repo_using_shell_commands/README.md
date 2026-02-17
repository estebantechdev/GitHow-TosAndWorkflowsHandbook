# Find out TODO lines in Git repo using shell commands

-Use:
-$ git grep -I -l TODO | xargs -n1 git blame | grep TODO
-
-Note: You can replace the string TODO with any other text to search for and then list different results.
