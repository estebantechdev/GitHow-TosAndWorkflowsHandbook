# Git tutorial for beginners, summary of basic commands from YouTube

Just my notes... decided to share in case someone wants to use them:

Terminal commands:
	ls - lists all of the folders 
	ls -la - lists all of the files 
	cd .. - returns one dir back 
	cd - enters a directory
	. - just install in the current directory 
	
On initial install:
	git --version - checks the version of the installed locally git
	git config --global user.name "Your Name" - sets up the name of the user 
	git config --global user.email "yourname@somemail.eu" - sets up the mail of the user
	git config --list - lists all the git configurations

Git recently changed the default branch on new repositories from master to main, change the default branch for Git using this command:
git config --global init.defaultBranch main

For help on commands:
	git help <verb> (e.g. git help config) OR 
	git <verb> --help

For git repos with master branch instead of main to update their names:
1. IF it is not yet locally configured, in Git, change the default branch for Git using this command:
$ git config --global init.defaultBranch main
2. Verify the active branch:
$ git branch -a
If there are many branches, the active branc will show an "*" in the left. IF you notice that the "main branch" is master, rename it.
3. Rename the branch master as main:
$ git branch -m main
In case of that there is a "main branch" for any reason, to force the change, use:
$ git branch -M main
3. Update the remote repository:
$ git push -u REMOTENAME main
4. Remove the old master branch in the remote (origin, for example):
$ git push REMOTEBRANCH --delete master

*** 2 possible scenarios:
First scenario: Have an existing project on your local machine that you wanna start tracking using Git.
Second Scenario: There's an existing project remotely that you wanna start developing on.

For initializing the project (For the First scenario):
	git init - initializes the git repo in the current folder
	touch .gitignore - creates a git ignore file. Example: Include in the file the lines: 
		.DS_Store
		.project
		*.pyc 
	git status - check working tree - both on the git and on local 
	git status --ignored - displays a list of all ignored files

Add files:
	git add -A - adds all of the files for committing
	git add file1
	git add file 1 file2 fileX 
	remember - git status - to check the state of the repo 
	
Remove files: 
	git reset - removes tracked files to be committed (from the staging area)
	git reset somefile.js - removes somefile.js from the commit preparation
	
Committing:
	git commit -m "This is the commit message" - -m is used to add message

Correct the last commit message with typos:

- Commit has not been pushed online:

git --amend

Steps in the editor:

Press INSERT key

Edit the file

Switch between INSERT and DEL modes as required to edit

When the amend is ready, press ESC and then SHIFT + Q, you will see just “:”, then type wq! and press ENTER to save the commit message changes.

If you don’t want to apply the changes, type qa! at the “:” prompt

Type visual to return to the edition mode from the “:” prompt

- If you have already pushed the commit to GitHub, you will have to force push a commit with an amended message:

We strongly discourage force pushing, since this changes the history of your repository. If you force push, people who have already cloned your repository will have to manually fix their local history.

For more information, see “Recovering from upstream rebase” in the Git manual.

Changing the message of the most recently pushed commit:

Follow the steps above to amend the commit message.

Use the following command to force push over the old commit:

git push --force-with-lease example-branch

Changing the message of older or multiple commits:
If you need to amend the message for multiple commits or an older commit, you can use interactive rebase, then force push to change the commit history.
Read the file Changing a commit message - GitHub Docs.pdf, or visit GitHub for details.

Check log:
	git log - renders commit id (hash), author, date, and commit message. Press key Q to exit

*** The next commands are mainly, but not only, for the second scenario:

Clone a remote repo (For the Second scenario,  no need to run git init):
	git clone <url> <where to clone> - Example: The SSH github.com repository's URL
        ls  -ls - If you wanna verify that the files are in the local copy of the repository

View info about the repo:
	git remote -v - lists info about the repo (I will see "fetch" (local directory) and "push" (remote directory) locations)
	git branch -a - lists all of the branches in the repository, not only locally but as remotely as well

View changes:
	git diff - shows the difference made in the files
	
Pull before push ALWAYS:
	git pull origin master
	git pull origin main - Use this command since we setup git to use main instead of master as the main branch.
	Remember: People a lot of times forget pull, but now you have to remember that we're now working on a project that could potentially have multiple developers and people have been pushing code to that repository while we've been working on our own features. So what the "git pull" does is it will pull any changes that have been made since the last time that we pulled from that repository. And as you can see after we ran that pull, it said that we were already up to date because there have been no changes to that remote repository since the last time that we pulled from it, and now we are ready to push.
	
THEN PUSH (it's to the remote repository, remember to use "main"):
	git push origin master - <origin> name of remote repo <master> the branch that we push to 
	
First time push of the branch:
	git push -u origin <name of the branch> - -u coordinates the two branches (local and on server)

** A common workflow (Create a branch for your desired feature):

Remember to use main instead of master for the main branch.

Create a branch:
	git branch <name of the branch>

Checkout a branch (Begin working on that branch, by switching from main to it):
	git checkout <name of the branch>

Get to know which branch are we working on (Use VS Code or Oh my ZSh! terminal):
	git branch

Remember: At this point I can make changes, add them, and commit them to the files on the current branch (feature branch, named "calc-divide")
Example: git commit -m "Divide function"
This has no effect on the main branch or the remote repository

Push new branch to the remote repository:
	git push -u origin calc-divide - The u option just tells git we want to associate our local calc-divide branch with the remote calc-divide branch. In the future, git will know that those two branches are associated to each other.

Push and pull all the repository, including all the branches previously associated:
	git push
	git pull
	git branch -a - lists all of the branches in the repository, not only locally but as remotely as well. We should see the new branch in the remote repository.

** A lot of companies run a lot of unit tests or things like that to make sure that all the code runs well before the merge with master (main).

Merge a branch (To the main (formerly known as master) branch):
	git checkout master
	git pull origin master
	git branch --merged - see which branches are merged 
	git merge <name of the branch you want to merge>
	git push origin master 

** I commonly delete a branch after its new features have been merged into the (remote) repository

Delete a branch:
	git branch -d <name of the branch> - this deletes it locally!!!
	git branch -a - check the repo branches 
	git push origin --delete <name of the branch> - this deletes it from the repo (remotely)!


Alternative to:
There is an alternative to force pushing after you have committed on GitHub with a wrong commit messages. It consits of a conflict resolution. The downside is that it keeps the commit with the error in the git log, which is not a big deal if we pushed to our own branch, and avoids the problem of removing the other user changes that pushed to the same branch since your last pull.

Topic:
Resolving a conflict

git push --force origin <branch> VS git push --force-with-lease origin <branch>:

--force: overwrites the remote branch unconditionally, even if others have pushed new commits since your last pull.
This can erase others’ work or cause divergence if you’re not the only one working on that branch.

--force-with-lease: safer version of --force.
It overwrites only if no one else has updated the remote branch since your last fetch/pull.
If someone else has pushed changes, it refuses to overwrite — protecting their commits.

Recommended use

If you’re the only one working on that branch (for example, a feature branch in your own repo), then:

git push --force origin <branch>

is fine.

If it’s a shared branch (like main, develop, or any branch used by others), you should always prefer:

git push --force-with-lease origin <branch>