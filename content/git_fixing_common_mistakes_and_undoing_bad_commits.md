# Git: fixing common mistakes and undoing bad commits

Git commands to run before start writing code:
-----------------------------------------------:
$ git status
$ git log
$ git branch

**If there's a remote repository collaboration:
$ git branch -a
$ git push origin main

I want to revert a change in the text editor (E.g.: VS Code), before add it to the staging area:
-------------------------------------------------------------------------------------------------:
($ git status - Returns that I have modified the file.
$ git diff - Shows changes between the file versions.)
$ git checkout cal.py - Reverts the file status.
$ git checkout -- <file_path> - Dircard changes made to the file and revert changes to the last committed state.
($ git status
$ git diff - Verify past status of the file.)
$ git checkout -- . - Discard changes in all files in the working directory.

- Amend in one line:
----------------------:
$ git commit --amend -m "Completed Subtract function"
**Note: It changes the hash. A hash is part of the commit. When a hash changes it means change the Git history.
We only want to change history, when we are the only ones who have access to the change that we've made. If we've pushed our changes to a repository for other people to see and pull from it we do not wanna change to get history (amend) because it can cause problems with their repositories.

- We accidentally left off a file that we meant to commit
-----------------------------------------------------------:
Scenario:
1. We worked on/created a file, for example, .gitignore. We wanted to commit it, but added it to the staging area and forgot to commit it.
2. We worked on/created a file and commit it, but committed its message with typos or errors. E.g.: calc.py.
3. Next, we amend the commit. If we amend opening the editor we will notice the errors:
$ git commit --amend <------- (requires more arguments: -m "Corrected message")
Notice that the output tells us the files involved in the commit. In this case it's going to commit the file message we are amending, but also the file that we forgot to previously commit. E.g.:
OUTPUT:
On branch main <------- (formerly "master")
Changes to be committed:
new file: .gitignore
modified: calc.py
END OF OUTPUT.
We should decide on whether or not to include a mention for the file we forgot to commit.
To do not include the file in the message, just save the commit without add any change.
To verify that there is not any second commit:
$ git log --stat <----- This command seems deprecated or not working at all, so I'll replace it with a simple git log. There are also alternative commands to show logs in some fancy fashions, such as: $ git log --pretty=oneline, and so forth.
$ git log
We will note that the file we forgot (.gitignore) is a part of the second commit.
So, now here one more time just to paint out. The hash of the commit is unique, so it's going to change history if we amend it.

- We've made all the commits to the wrong branch by accident. 
----------------------------------------------------------------:
E.g: $ git branch
OUTPUT:
*master
subtract-feature
END OF OUTPUT.
Mistake: We committed to master (main) the commits for the feature branch.
Goal: Move the commit from main to the feature branch and then return our main back to its previous state.
$ git log
OUTPUT: 
Commit: [HASH]
...
END OF OUTPUT.
Copy the first 6 or 7 hash numbers.
Checkout the feature branch:
$ git checkout subtract-feature
Verify the commit is not there:
$ git log
Move the commit from main to the working branch:
$ git cherry-pick 1b8150b <----- The [HASH] we copied.
Verify the new commit on our feature branch:
$ git log
Get rid of the commit in the main:
$ checkout main
$ git log
Try one of the 3 reset types:
A. Soft Reset:
1. Copy the HASH of the commit we want to go back to in time. E.g.: Initial Commit.
2. $ git reset --soft [HASH]
Verify that the commits after that point back in time are not present, including the commit we wanted to get rid of:
$ git log
Verify the status of the files:
$ git status
Conclusion:
The soft reset resets us back to the commit that we want but it will keep our changes that we've made in the staging area.
B. Mixed Reset:
1. Copy the hash wanted.
2. Without any additional option the command will default to mixed:
$ git reset [HASH] <------ HASH of the commit we want to go back to in time.
Verify the commit:
$ git log
Verify the files status:
$ git status
Conclusion:
With a mixed reset the files are either put in the staging area or working directory based on which one you specify (If the file has been committed, will go back to the staging area, but if it is the staging area, will go back to the working directory.)
C. Hard Reset:
1. Copy the HASH of the commit we want to go back to in time.
2. Hard reset:
$ git reset --hard [HASH]
3. Verify the commit:
$ git log
4. Verify the files status:
$ git status
OUTPUT:
It says that there are untracked files still there.
Conclusion:
A hard reset is going to make all of our tracked files match the state that they were in at the hash that we specify, but it leaves any untracked files alone.
So, to get rid of untracked files:
$ git clean -df - d = directories f = files
$ git status

- I have a lot of untracked files that I want to get rid of in the working directory:
--------------------------------------------------------------------------------------:
$ git clean -df - d = directories f = files
$ git status
OUTPUT:
On branch main 	   <------- (formerly known as master)
nothing to commit, working directory clean

- We got rid of files we really did not want to loose or wrongly run a reset
------------------------------------------------------------------------------:
We are lucky if git did not run git garbage yet. Git garbage deletes all those changes we made. Those changes are visible to us through the command git reflog.
E.g.:
1. Kind of show exactly what we've been doing:
$ git reflog - Press Q KEY to exit
2. Copy the HASH before the "reset commit" HASH (Review the reset types).
3. Checkout that HASH:
$ git checkout [HASH]
4. Run a git log:
$ git log
At this point we must see the changes back. We must see the commit immediately previous to the "reset commit".
Know, right now we are in a detached head state, which basically means that we aren't on a branch. Where we currently are it will be trashed at some point in the future. So, to solve these changes we need to make a branch from it.
5. Make a branch for the point in the future:
$ git branch backup
6. Look at all my branches:
$ git branch
OUTPUT:
･ (HEAD detached at 1b818d3)
      backup
      main
      subtract-feature
END OF OUTPUT.
Notice the symbol " ･ ". It is an emoji which seems a "dot" in the output.
7. Checkout the master branch:
$ git checkout main
8. Look at all my branches:
$ git branch
OUTPUT:
* main   <----- (Formerly master)
subtract-feature
END OF OUTPUT.
At this point we can see that we still have the backup branch. Our changes are there.
9. Confirm that the changes are there:
$ git checkout backup
$ git log
Check that we have those changes that we thought we lost (Using the commit messages and hashes.)

- You are in a situation where you really need to undo some commits but other people have already pulled those changes.
------------------------------------------------------------------------------------------------------------------------:
Use git revert: It creates new commits to revert the effect of some earlier commits. So, this way you DON'T REWRITE ANY HISTORY.
E.g.:
$ git log - And then select the hash of the commit to revert.
$ git revert [HASH]
It opens the editor with the whole commit message beginning with the word "Revert". For example, "Revert Completed Subtract Function"
Run a Git log:
$ git log
It shows the additional revert commit.
It also lists the untouched previous commits, include the commit we reverted.
TRICK:
We can check the difference between our reverted commit and our revert commit, using their HASHES, like this:
$ git diff 1b818d 79ae379
So, now whenever you push these changes and somebody else pulls those down their history is not gonna be corrupted because all of this history is the same and all they're gonna set are these new commits that undid those previous commits.

- How do I delete previous commits (on git and/or GitHub)
------------------------------------------------------------------------------------------------------------------------:

Remember to use git amend only in single person repos. Otherwise, checkout the ammend info in this document.

$ git status
$ git log
After the git amend (much better in one line)..., the amend commit becomes the head.
The HEAD~1 means the commit before head. Head is the amend commit that we want to keep. Obviously you can also use HEAD~n to "go back" n commits from your head. Maybe from this point you have interpreted: --hard HEAD also as HEAD~0 => deleting work in progress.
$ git reset --hard HEAD~1
Or, you could look at the output of git log, find the commit id of the commit you want to back up to, and then do this:
$ git reset --hard <sha1-commit-id>
If you already pushed it (e.g.: on GitHub), you will need to, INSTEAD, do a force push to get rid of it. Checkout changes on GitHub to make sure that the origin and local repo are synced.
The next correct command depends on your specific situation:
$ git push origin HEAD --force
This command pushes the current state of your branch (where HEAD is pointing) to the remote repository's default branch. It's useful if you are on a different branch other than main and want to push the changes to the corresponding remote branch.
$ git push origin main --force
This command pushes the main branch to the remote repository, regardless of which branch you are currently on locally. It forces the remote main branch to match your local main branch.
If you have not yet pushed the commit anywhere, you can use git rebase -i to remove that commit. First, find out how far back that commit is (approximately). Then do:
git rebase -i HEAD~N
The ~N means rebase the last N commits (N must be a number, for example HEAD~10). Then, you can edit the file that Git presents to you to delete the offending commit. On saving that file, Git will then rewrite all the following commits as if the one you deleted didn't exist.

##  Git commands for files and directories

------- SHELL COMMANDS: --------------------

These commands basically should be used only when the files are untracked/unstaged/not put under version control (except for the commands to change file permissions and make a file executable).

Create a new file:
$ touch filename

Create a new directory (you have to create a directory and a new file in it in the same command):
$ touch newdirectory/newfile
Do not use mkdir for creating new directories or git is not going to log it (put it under version control), what it means that it is not going to stage it when you run 'git add' later on. If you did use mkdir, you can remove the empty directories using 'rm -rf' and then recreate them with 'touch'.

Remove any file or directory permissions:
$ chmod 777 directoryname/filename
$ chmod 777 directoryname/*

Make a file executable:
$ chmod +x filename

Move a unstaged (untracked) file (It can be read):
$ mv file

------- GIT COMMANDS: --------------------

These commands only work when the files are tracked/staged (added the staging area).

Move/Rename a file:
$ git mv filename directory/newfilename

Move/Rename a directory:
$ git mv directory/ directoryrenamed/

Remove a file from the staging area or the commit area:
$ git add . 
$ git status
$ git reset
This is a mixed reset. It removes a file from the staging area to the working directory, or to the staging area in case of it has been previously committed. See the 3 reset types.
**We can use "git restore --staged <file>..." to unstage

Delete a file from the working directory:
$ git rm filename

Delete a directory from the working directory:
$ git rm -r directory/
-r: allows recursive removal when a leading directory name is given.

Remove a folder from the tracked, but the repository structure remains. It also works to remove folder/directory only from git repository (remote) and not from the local:
$ git rm -r --cached FolderName
--cached: Use this option to unstage and remove paths only from the index. Working tree files, whether modified or not, will be left alone.
$ git commit -m "Removed folder from repository"
$ git push origin main
After those commands, you are able to use rm -rf ./Folder to delete it.
CAUTION: Remember not to run rm -rf / or rm rf /* as user root (it deletes the whole system) or rm -rf ./* (because you delete the .git/ directory and other hidden files such as any .gitignore)

Delete any untracked file or directory using git commands instead of shell commands:
First, add it to the staging area:
$ git add file1
Finally, delete it (for files):
$ git rm file1
Finally, delete it (for directories):
$ git rm -r directory/
