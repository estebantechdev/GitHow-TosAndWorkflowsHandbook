# Reconfigure git user and email on a fresh OS installation before running any new commit

Configure user and email to change auto setup values on a fresh git installation before proceed with the first commit. Otherwise, git will store the commit using the host credentials. Hopefully, this commit can be amended and would me better to amend the commit before the next push to the origin if exists.

Example:

$ git commit -m "Update file permissions"

Output:
[feature/estebanways 789745c] Update file permissions
Committer: commbase <commbase@commbase.commbase.aestudio.sytes.net> Your name and email address were configured automatically based on your username and hostname. Please check that they are accurate. You can suppress this message by setting them explicitly:
git config --global user.name "Your Name"
git config --global user.email you@example.com
After doing this, you may fix the identity used for this commit with:
git commit --amend --reset-author
1 file changed, insertions(+), ℗ deletions(-) mode change 100644 -> 100755 Module5/Split/Split.txt
