# Resolving a conflict

If you just pushed changes in a commit but you realize you need to amend the commit message.

To avoid this mistake as possible, always read and check the last commit using git log.

git commit -m "Commit message with errors testtttt"
git commit -amend -m "Commit message with errors test"
git push origin main

This second commit is goningn to return and error:

To github.com:estebanways/DeveloperEnvironment.git
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'github.com:estebanways/DeveloperEnvironment.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

The following command will give you the next step options (use the appropriate branch, the one you are working on):
git pull origin main

You will get more errors with the steps to merge the changes:

hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only

So run:
git config pull.rebase false

And then try to pull before pushing:
git pull origin main

At this point you will get the default text editor open, commonly nano.

There you can type the next message:
"Pull latest report from https://github.com/estebanways/project"

Save changes to the report.

Finally, push the amended commit.
git push origin main

Note:
You will be able to push changes on GitHub, but the commit with the error message does not dissapear. At least, the file list on GitHub will show the corrected commit message instead of the previous commit with message errors.

In any case, try to push changes to user branches before merging changes to official repo branches to ensure that your work is tested, reviewed, and does not break the main codebase.

ALternatives:
Move the head to the previous commit. Locally is ok, but after a push will affect other repo users.

Related topics:
You are in a situation where you really need to undo some commits but other people have already pulled those changes.
How do I delete previous commits (on git and/or GitHub)
We accidentally left off a file that we meant to commit

Alternative to:
- If you have already pushed the commit to GitHub, you will have to force push a commit with an amended message:
