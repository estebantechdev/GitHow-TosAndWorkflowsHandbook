# CHALLENGE: Create a new branch enhancements to ... (improve CSS styles)

Challenge Description:
Create a new branch enhancements to improve css styles.
Improve the project https://github.com/larnu-bootcamp/challenge_js.
- improve styles
- improve js
- branch name: enhancement/<your-name>

How to Proceed:
If the branch is merged (the maintainer does that),
the same branch should be pulled (features/branch),
but if the branch is in pull request (status),
you should create a new branch enhancement/<your-name>
where: 
<your-name> = your github username (estebanways)
or, use the git stash to contain your new code hidden to in future sequential pushes and pull requests.

Command Steps:
$ git checkout main
$ git checkout -b enhancement/estebanways
Now you are in your new branch
$ git branch -a
Make code changes to this code branch
Push changes:
$ git status, $ git add <files>, $ git commit ...
$ git push
If you use $ git push without the part origin enhancement/estebanways,
git will tell you to do a:
$ git push --set-upstream origin enhancement/estebanways
After pushing the files, verify the branch is on GitHub.com (website)
After verifying the branch with some diffs on GitHub, make a pull request
You can keep using the same branch (if allowed) to pull (but the branch is just mine),
modify, and push more changes (such as corrections), and then pull request again.
It is important to verify every step on GitHub to make sure that the changes are all right.

## Find out TODO lines in Git repo using shell commands

Use:
$ git grep -I -l TODO | xargs -n1 git blame | grep TODO

Note: You can replace the string TODO with any other text to search for and then list different results.
