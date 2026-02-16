# Git How-Tos and Workflows: Hands-On Git for Daily Use

## How to install Git on MS Windows

To install Git on Windows, you should use the official Git for Windows installer available from the official Git website. The process is straightforward and involves downloading the executable file and running the setup wizard, generally accepting the default options. 
Step 1: Download the installer 
Open your web browser and go to the official Git website: https://git-scm.com/download/win.
The download of the latest 64-bit Git for Windows installer (.exe file) should start automatically. If not, click the appropriate download link for your system. 
Step 2: Run the installer 
Once the download is complete, locate the downloaded .exe file (usually in your Downloads folder) and double-click it to launch the installer.
When prompted by the User Account Control, click Yes to allow the app to make changes to your device. 
Step 3: Follow the setup wizard 
Read the GNU General Public License agreement and click Next.
Select the installation destination folder. The default location (C:\Program Files\Git) is recommended for most users.
On the "Select Components" screen, the default options are usually sensible. Ensure that "Windows Explorer integration" (including Git Bash Here and Git GUI Here) is checked for easy access from your right-click menu in File Explorer. Click Next.
Select your desired default text editor for Git (e.g., VS Code, Notepad++, or Vim) from the dropdown list. The default is usually Vim. Click Next.
Follow the prompts through the remaining configuration screens, accepting the default (recommended) options unless you have a specific reason to change them. Key settings include:
Adjusting your PATH environment: The recommended option, "Git from the command line and also from 3rd-party software," allows you to use Git from any terminal (Command Prompt, PowerShell, or Git Bash).
Configuring line ending conversions: The default "Checkout Windows-style, commit Unix-style line endings" is generally fine for cross-platform projects on Windows.
Configuring the terminal emulator: The default MinTTY is suggested.
Choosing a credential helper: Use the default Git Credential Manager Core.
Click Install to begin the installation process.
Step 4: Verify the installation
Once the installation is complete, you can uncheck the option to view the release notes and click Finish.
Open a new Command Prompt, PowerShell, or Git Bash terminal.
Type the following command and press Enter:
bash
git --version
Use code with caution.

If the installation was successful, you will see the installed Git version number (e.g., git version 2.X.X.windows.1).
Step 5: Configure Git (optional but recommended) 
After installation, configure your Git username and email address. This information is associated with any commits you create: 
bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
Use code with caution.

You can verify your settings at any time by typing git config --list. 

## A GIT manual, from the Book DIY Linux

This manual based on the practice of version control programs, Git and Git hosting.
The manual doesn't contain all the possible options but it's a guide.

Create a local repo in the actual directory:
$ git init 

Add a file to the Index (Stage area):
$ git add [file]

Add all the files directory to the stage:
$ git add . 

Remove a file from the repository:
Drag and drop the file and then show the status.

Deletes a file of the repository and the system:
$ git rm [file]

Rename/Move a file of the repository (origin to destiny). Moves the file, updating the index to record the replaced file path, as well as updating any affected git submodules:
$ git mv [file] [directory/file]

Show status:
$ git status

Commit a change in the stage area. Perform commit after add:
$ git commit -m "This is the first commit of Esteban"

Commit a change in the stage area + add the files in one step:
$ git commit -am "This is a commit to..."

List all of the branches in the repository, not only locally but as remotely as well. We should see the new branch in the remote repository.
$ git branch -a

Show all the branches and mark the actual (relative) *branch we are on locally:
$ git branch

Create a new branch [newbranch]:
$ git branch [newbranch]

Create new branch and switch to it:
$ git checkout -b [newbranch]

Go to a certain branch to work on it. 
$ git checkout [branch]

* IE: $ git checkout master, to go to the branch master.
* Note that checkout has more uses. See command $ git reset.

How to delete local Git branches / delete branch:
Open a Git BASH window or Command Window in the root of your Git repository.
If necessary, use the git switch or checkout command to move off the branch you wish to delete.
$ git branch --delete <branchname> ...
Verify the local Git branch is deleted:
$ git branch -a

Fetch (retrieve from remote) and merge (with local) for a remote repo in one step, or just
merge for a local repository:
$ git pull

Push and pull all the repository (remote repo), including all the branches previously associated:
	git push
	git pull
	git branch -a - lists all of the branches in the repository, not only locally but as remotely as well. We should see the new branch in the remote repository.

Merge a branch (To the main (formerly known as master) branch):
	git checkout master
	git pull origin master
	git branch --merged - see which branches are merged 
	git merge <name of the branch you want to merge>
	git push origin master 

Merge two branches. Many steps.. some explained. Create a branch. Create a conflict and resolve it. 
For example, from the master (checked out):
$ git merge [branch2]

Delete a branch after or without a merge:
$ git branch -d [branch2]

Resolve the differences between file versions in the work area:
$ git diff

Resolve the differences between file versions in the staging area:
$ git diff --stages

Resolve differences between branches:
$ git diff [branch1] [branch2]

Revise (instead of resolve) differences between two added or staged files, or even between a repo file and an external file out of the repo:
$ git diff --no-index index.html indexTMP.html
Note: You must provide the complete path of any file that is not in the relative directory.

Remote repo commands:

Retrieve a copy of the remote repo:
$ git clone [addr]

* IE: $ git clone https:github.com/.../proj.git

Return remote repo connection information, the fetch and push addresses, to be able
to interact with the repository with fetch, push and pull:
$ git remote -v

* The example uses the command with Github. To connect to bitbucket use the bitbucket connection, below:

Return remote repo (Add a repo to the list):
$ git remote add origin https://girku@bitbucket.org/girku/trails.git


Here is the complete Bitbucket in its actual status, from my account page:

I am starting from scratch:
	Set up your local directory:
	Set up Git on your machine if you haven't already.
	$ mkdir /path/to/your/project - Remember not to create a project directory with mkdir for git to log it (put it in version control).
	$ cd /path/to/your/project
	$ git init
	$ git remote add origin https://girku@bitbucket.org/girku/trails.git

	Create your first file, commit, and push:
	$ echo "Esteban Herrera" >> contributors.txt
	$ git add contributors.txt
	$ git commit ‐m 'Initial commit with contributors'
	$ git push ‐u origin master
	Great job, now you're all set up! Get started coding or create a team and invite people to work with you.

I have an existing project:
	Already have a Git repository on your computer? Let's push it up to Bitbucket.
	$ cd /path/to/my/repo
	$ git remote add origin https://girku@bitbucket.org/girku/trails.git
	$ git push ‐u origin ‐‐all # pushes up the repo and its refs for the first time
	$ git push ‐u origin ‐‐tags # pushes up any tags

Want to grab a repo from another site? Try our importer!

Resolve Error with renamed repo in GitHub: "remote: This repository moved. Please use the new location". It does the change even if there is not error.

The simple way is:
$ git remote set-url origin [updated link url https://........git]
If it was upstream, you change it like:
$ git remote set-url upstream https://github.com/YOUR-USERNAME/YOUR-REPO

Alternatively, if you like the long way it is:
$ git remote rm origin
$ git remote add origin [updated link]

Where, update link can be: git@github.com:larnu-bootcamp/challenge_11.git

Verify the change:
$ git remote -v

(END)

git fetch is the command that tells your local git to retrieve the latest meta-data info from the original (yet doesn’t do any file transferring. It’s more like just checking to see if there are any changes available).
git pull on the other hand does that AND brings (copy) those changes from the remote repository.
You can use git fetch to know the changes done in the remote repo/branch since your last pull. This is useful to allow for checking before doing an actual pull, which could change files in your current branch and working copy (and potentially lose your changes, etc).
git fetch    
git diff ...origin

Retrieve new changes from repo:
$ git fetch

Uploads new changes to the repo, to the determined branch:
$ git push origin [branch]

* Origin = Remote repo. Master = Some local branch.
* IE: $ git push origin master
* IE: 
$ checkout -b [newbranch]
$ push origin [newbranch]

Delete a branch:
Given a branch, like origin:[newbranch], the branch persists in local and must be removed in a second step.

	git branch -d <name of the branch> - this deletes it locally!!!
	git branch -a - check the repo branches 
	git push origin --delete <name of the branch> - this deletes it from the repo (remotely)!

Retrieve new repo changes and merge in local (fetch and merge) in one step:
$ git pull

Retrieve new changes in local (fetch only from remote repo "origin"):
$ git fetch origin

Verify changes in local and remote repo, history, etc:
$ git log

* IE: $ git log [from] [to]

git log → shows history of commits.

git log -p → shows history plus detailed changes in each commit.

It’s very useful when you want to review what changed over time, not just the commit messages.

Show fetch and push addresses:
$ git remote show https://github.com/.../proj.git

Clone git repo using the protocol SSH:
$ git clone ssh:myuser@github.com/.../proj.git

Protocols are used to share the repo. The Protocols supported by git are:
HTTP/S protocol
SSH protocol
Git Protocol. It uses a daemon (Disk and Execution Monitor).

Show tag list:
$ git tag

Identify the project advances, by adding a tag in the last commit made:

First ensure that you have checked out the branch you want to tag.
$ git checkout your_target_branch

Simple version (but use the one with message):
$ git tag [v2.0]

Or:
$ git tag [v0.1.0]

Version the code using the git Annotated Tags:
$ git tag -a v1.0 -m "my version 1.0"

* It is useful in SourceTree or any other editor/IDE mechanism such as Git Graph extension for Visual Studio Code to see which commit is a version, graphically.
* Useful to mark project version.

Show the result of a tag that has been created:
$ git show v2.0

Show the label of a certain tag:
$ git show v1.0

Push the Tag to the Remote Repository:
$ git push origin v1.0

Share new local tag to the remote repo:
$ git push origin master --tags
Example 2:
$ git push origin estebanways/feature --tags

In Git, you can remove tags using the git tag -d command. Here's the basic syntax:

$ git tag -d <tag_name>

Replace <tag_name> with the name of the tag you want to delete. For example:

$ git tag -d v0.1.1

After deleting the tag locally, you might also want to delete it on the remote repository if you've already pushed the tag.

Delete the remote tag (if it exists):

$ git push origin :refs/tags/v0.1.1

Note: Deleting a tag locally and on the remote repository doesn't delete the commits the tag was pointing to; it just removes the reference to the tag. If you've pushed a tag to a remote repository and others have already pulled that tag, you might want to communicate the removal of the tag to them.

Create a distribuited repo (bare metal). SSH to the server, and create it:
$ git init --bare

Clone the bare repo:
$ git clone --bare MyRepo.git

* With the bare repo the server is the bare and every clone is (like a master) copy of the repo.
* IE: $ git clone --bare Myrepo MyRepo.git

Show metadata and data changes of a certain commit:
$ git show [commit]

Reset
Reset the head (See Git stages image):
$ git reset HEAD^ filename

$ git reset --soft HEAD^

$ git reset --hard HEAD^

*See the course for more information.

Clean:
$ git clean

File FLAGS:
Look for for more information.

Register the user in the repo:
$ git config --global user.email "you@example.com"
$ git config --global user.name "Your Name"

*Omit --global to set the identity only in this repository.

These configuration commands can be used to change auto setup values on a fresh sytem and/or git installation. After a the first commit, a messages will tell you that the email and address were configured automatically. After doing this, you may fix the identity used for this commit with:
$ git commit --amend --reset-author

Replace username:
$ git config --global --replace-all user.name "Esteban Herrera"

List global configuration:
$ git config --global --list

Show git commands:
$ git help
$ git help [commands]

*IE: $ git help push

Git manual:
$ man git

*Does not work on SourceTree in Windows.

More about Bitbucket:
In Bitbucket the repo owner, IE: Esteban Herrera (girku) can create a repo or a team like
"pitbulls" and then a team repo. I will use a team repo option but not going to invite user 
from the team, enter to the repo and use the option "Invite users to this repo". Send email 
to the developer invited to the repo. The use will receive the link to go to his Bitubucket 
account and see the Git address to clone the repo locally in SourceTree (HTTPS or SSH). In 
that way the user is not going to require an user and password to generate the (HTTPS or 
SSH) keys. For connections that require authentication, the username is the email of the repo
owner, IE: Esteban Herrera, and the password is a secret phrase. Anyways, it's not recommended
to share the password to developers, because they can damage or delete all the repo files and
the whole repo account. In cases when you need to write some password, use a program like
TeamViewer with a toke setup to enter to the developer computer ad enter the repo owner
information remotely during the first cloning time in SourceTree. The second option is to
create an account in Bitbucket, and share it like wide open between users, but there's the risk
that somebody can delete it or damage an existent repo. Bitbucket gives options to add features
as: Install "something" to add more branches as features, fork and (?), hooks, contributors.txt 
and readme.txt files, links to Confluence (Jira, etc.), Wiki, Chat, etc. When you upload the 
first repo files (commit), don't $ git add the file to install the DB, instead exclude it and 
share it as if it was was made in a copy of the server, IE: USBWebserver Trails/htdocs/.

## Git Tutorial for Beginners, Summary of basic commands from YouTube

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

## CHALLENGE: Create a pull request on GitHub

Challenge git commands:

Give the GitHub username (estebanways) to who has the github repository permissions to allow you to create pull requests. That person, for example, the owner of the repo, will give you the permissions on github and then you will receive an email with a button for you to confirm that you are joining any particular repository or organization.
The link of the repo to be cloned:
https://github.com/larnu-bootcamp/challenge_11

Clone the given repository (use ssh):
$ git clone git@github.com:larnu-bootcamp/challenge_11.git

Create a new branch:
$ git checkout -b feature/<your-github-username>

Options to verify branches:
Switch to your feature branch (try not to change again since you work on your "feature" branch):
$ git checkout feature/estebanways
List the branch were you are in (your current branch, not working directory):
$ git branch
List all the existent branches in the repo:
$ git branch -a

Create a new directory with the name of your github's username:
$ mkdir <your-github-username>

Go to that new dirctory:
$ cd <your-github-username>

Create your html and css files:
$ touch index.html
$ touch style.css

Coding your html and css2 files:
$ git status
$ git add .
$ git add index.html
$ git status
$ git commit -m "Add new feature front"
$ git log

Comment your changes and upload your branch to GitHub:
To create comments:
$ git add index.html
$ git commit -m "First commit"
Long commit version:
$ git -m "Title" -m "Description"
Finally, create a new pull request of your branch pointing to main (actually you upload your branch, to merge to main you should be positioned on main, but do not do that. That is a job for someone else in this sequence):
$ git push origin feature/<your-github-username>

Use new commits to avoid reverting previous wrong commits:
$ git commit -m "Delete create new feature x"

See all the new branches created by other developers (new changes pushed to origin since the cloning or the last pulled):
$ git fetch --all

OUTPUT EXAMPLE:
Fetching origin
remote: Enumerating objects: 100, done.
remote: Counting objects: 100% (100/100), done.
remote: Compressing objects: 100% (71/71), done.
remote: Total 98 (delta 32), reused 89 (delta 23), pack-reused 0
Unpacking objects: 100% (98/98), 92.70 KiB | 479.00 KiB/s, done.
From github.com:larnu-bootcamp/desafio_11
 * [new branch]      feacture   -> origin/feacture
 * [new branch]      feature/antonionce -> origin/feature/antonionce
 * [new branch]      feature/isavalenzuela -> origin/feature/isavalenzuela
END OF OUTPUT.

Push to my feature branch (in origin = GitHub):
See changes in the complete repo:
$ git fetch --all
Retrieve new changes in remote (origin) repo to the local machine version (not required at the moment, because we are working alone on our feature branch, not on main):
$ git pull origin master
See which branches are merged:
$ git branch --merged
Merge using name of the branch you want to merge:
$ git merge feature/estebanways
Push the new feature branch to the repository (this initiates the pull request):
$ git push origin feature/estebanways
Note: Use $ push -u origin <name of teh branch> the first time you push the branch. The option -u coordinates the two branches (on local and remote).
Go to github and press the button "Create pull request."
This pull requests as a "First commit" for testing purpose can be created without any description. It can or can't be accepted by the person in charge of the repository.

$ man git push

OUTPUT:
-u, --set-upstream
           For every branch that is up to date or successfully pushed,
           add upstream (tracking) reference, used by argument-less git-
           pull(1) and other commands. For more information, see
           branch.<name>.merge in git-config(1).
END OF OUTPUT.

About pull request reviews (on GitHub):
https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews

I want to find the first commit that is reachable from branch, but not from master:
$ git rev-list ^main feature/estebanways | tail -n 1
OUTPUT:
2012a696cf58fd5f46fb312e5335758d1087188b
END.

Gitlens:
VS Code extension. It shows commits history, who commited, etc.

Displaying verification statuses for all of your commits:
You can enable vigilant mode for commit signature verification to mark all of your commits and tags with a signature verification status.
https://docs.github.com/en/authentication/managing-commit-signature-verification/displaying-verification-statuses-for-all-of-your-commits

Important Question:
So, when the maintainer accepts the pull request, he/she merges and then deletes the branch, if I, as a dev, have more files, only the commit file disappears, not the whole branch, right?
Answer:
No, that is better not to delete the branch until the feature is complete.
A branch must be created for each new feature ( a feature different from others.)

Important Question:
If I make a pull request and then more pushes, when the maintainer reads the pull request, he/she reads the last push, that is, the last version, not necessarily the version logged when I pull requested, right?
Answer:
That's right!

Important Question:
Should I push daily?
Answer:
For a feature, it is supposed that it is complete or something is complete and then you pull request and wait for the maintainer to review it (and his/her feedback).

Note:
Some people can make mistakes during the process. Here are some examples:

Error: "The following untracked working tree files would be overwritten by merge"
Reproduction: When runs: '$ git pull origin main' (it must be done from main (git checkout main))
Steps:
Some steps done to deal with the errors and its consequences until it is fixed
01. Another programming pair fusioned their branch to main ...
02. Now I get this error: "The following untracked working tree files would be overwritten by merge" (the files from the pair branch.)
03. git branch -a shows that I pulled the "aliens" branch (menu_principal)
04. git rm -r does not work because the files mentioned are unstaged
05. The directory gets removed using rm -rf menu_principal
06. More files, not just directories (not part of main), are there. You can carefully, remove them. You could need a meeting with members of the team that owns those files.
07. Finally, you could run git pull origin main from main to pull the main changes
08. The (other team's) branch "menu_principal" is still there, normally
09. Checkout your feature branch and just '$ git pull' to pull our "shared branch" changes made from our shared branch mates.
10. Try to avoid using $ git pull from main (to pull changes in main) until the error gets
resolved, or you will have to repeat the directory/file removal workaround again and again every main pull.

## CHALLENGE: Create a new branch enhancements to ... (improve CSS styles)

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

## Git, fixing common mistakes and undoing bad commits

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

## Create and set up a new repository on github.com

References:
Web: https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/setting-up-git


- Set up my git and Github.com to work together:

- Create the repository on github.com:
GO to the repositories section, choose create, and then give it a name.
We will clone the remote as a new local repository, but github.com also offers commands for two more options:
Option: …or create a new repository on the command line
Option: …or push an existing repository from the command line

- Clone the repository to create a local version of it:
Type this somewhere in the developer user's directory. I always use ~/Developer:
$ git clone git@github.com:estebanways/estebanways.github.io.git

- Verify the connection:
$ cd PROJECT
$ git remote -v

- Create new files or use the command cp or cp -dpR to paste files and dirctories to the local repository:
Verify files status:
$ git status

- Setup the local repository permissions:
I can or cannot run this, but it depends on the project permissions, for example a basic index.html proyect, so the server is not going to fail executing it. 
WARNING: Remember that this action is going to require a new commit, due to the files will appear as modified for the command git status!!!
$ cd ..
$ chmod -R 777 PROJECTDIR/
Ind if I need to make a file executable:
$ chmod +x PROJECTDIR/thisfile

- Publish a basic html repository from github:
Go to the specific repository, next go to Settings, and select the menu option Pages

## Create new SSH keys for GitHub repo access from another computer or OS

After a period of time, after a comamnd to connect to your repository online like this:


$ co my_repo
$ git status
$ git pull origin main

You should get an access error like this:
...
git@github.com: Permission denied (public key).
fatal: Could not read from remote repository.

Please make sure your have the correct acces rights.
...


The problem is that you do not have your GitHub's SSH keys in your file ~/.ssh/id_rsa. To resolve the problem, recreate the SSH keys in the terminal and paste them in a new SSH keys section, currently on http://github.com/settings/keys

Remember to use the github account's email as the email parameter.

$ ssh-keygen -t ed25519 -C stv.herrera@gmail.com

Copy the passphrase to the clipboard and then go to paste it following the instructions on GitHub.com

$ ssh-add ~/.ssh/id_ed25519

Insert your passphrase.

$ cd path/to/clone/repo/dir

$ git clone git@github.com:user/repo.git

$ cd repo-dir

Open VS Code Editor

$ code .

Or, open VS Code wherever and select `File > Open Folder`.

## Verified vs unverified commits (GPG key)

Topic: GPG keys.
https://github.com/settings/keys

Topic: Managing commit signature verification.
https://docs.github.com/en/authentication/managing-commit-signature-verification

Here’s a clear explanation of verified vs unverified commits on GitHub, especially regarding GPG keys:

1. What are Verified Commits?

A verified commit on GitHub indicates that the commit was signed with a GPG (GNU Privacy Guard) key that is associated with your GitHub account. GitHub confirms that the commit was indeed made by the person who claims to have made it, adding a layer of trust and security.

Key points:

A commit is verified when it is cryptographically signed with your private GPG key.

GitHub checks the signature against your public key linked to your GitHub account.

Verified commits show a “Verified” badge next to them in GitHub's interface.

Example:

commit 9a1b2c3d4e5f6g7h8i9j0k
Author: Esteban Herrera <esteban@example.com>
Verified: ✅

2. What are Unverified Commits?

An unverified commit is a commit that either:

Was not signed with a GPG key, or

Was signed with a GPG key not associated with your GitHub account, or

Has a signature that cannot be verified (e.g., expired or mismatched key).

Key points:

Unverified commits do not have a “Verified” badge.

They can still be trusted if you know the author, but GitHub cannot confirm authenticity cryptographically.

Often appears as “Unverified” in GitHub commits list.

3. How to Sign Commits with a GPG Key

Configure Git to use a GPG key:

$ git config --global user.signingkey <your-key-id>

$ git config --global commit.gpgsign true

Set this command to `false` if you want to disable the GPG verification.

You can use an existent key or generate a new one for your device/user. It is recommended to create a new one just for Git.

Generate a GPG key:

gpg --full-generate-key

To print the GPG key ID in ASCII format:

$ gpg --armor --export <GPG key ID>

<GPG key ID>: You get it using listing your keys:

$ gpg --list-secret-keys --keyid-format LONG

```output
sec    rsa3072/<GPG key ID>
...

```

Add the public key to GitHub:

Go to Settings → SSH and GPG keys → New GPG key.

Paste your public key.

After this, all commits you make with that key will show as verified.

Troubleshooting MS-Windows-WSL-Debian VS Code

When proceeding with `git commit...` you get the error:

```output
error: gpg failed to sign the data: [GNUPG:] KEY_CONSIDERED C68C33E9FBE090488AEA80BBFF5A3D6759436166 2 [GNUPG:] BEGIN_SIGNING H10 [GNUPG:] PINENTRY_LAUNCHED 14546 curses 1.3.1 - xterm-256color :0 - 1000/1000 - gpg: signing failed: Inappropriate ioctl for device [GNUPG:] FAILURE sign 83918950 gpg: signing failed: Inappropriate ioctl for device
```

This specific error usually happens in WSL when GPG tries to open pinentry (the program that asks for your passphrase), but VS Code / WSL doesn’t give it a proper TTY.

In other words: GPG can’t show the password prompt, so it fails.

Fix 1 — Allow TTY for the gpg prompt

Sometimes you just need to tell Git where the TTY is.

Add this:

$ export GPG_TTY=$(tty)

Make it permanent:

$ echo 'export GPG_TTY=$(tty)' >> ~/.bashrc

$ source ~/.bashrc

Test signing again:

$ echo test | gpg --clearsign

If a passphrase prompt appears inside the terminal, this fix worked.

Fix 2 — Force GPG to use pinentry-tty

WSL often cannot open the GUI or curses pinentry. Switching to the TTY version fixes it.

Run this inside WSL:

$ sudo apt install pinentry-tty

Then configure GPG:

$ echo "pinentry-program /usr/bin/pinentry-tty" >> ~/.gnupg/gpg-agent.conf

$ gpgconf --kill gpg-agent

Test signing again:

$ echo test | gpg --clearsign

If a passphrase prompt appears inside the terminal, this fix worked.

4. Why Verified Commits Matter

Security: Ensures the commit was actually made by the claimed author.

Trust: Important for open-source projects and collaboration.

Accountability: Makes tampering harder, especially in critical codebases.

5. Common Issues with Unverified Commits

Using the wrong email in Git commits (must match GitHub account).

Expired or revoked GPG key.

Commit made on a machine without your configured GPG key.

| Commit Type       | Signed with GPG Key? | Associated with GitHub Account? | Badge on GitHub |
|------------------|-------------------|-------------------------------|----------------|
| Verified          | ✅ Yes            | ✅ Yes                         | ✅ Verified     |
| Unverified        | ❌ No / ❌ Invalid | ❌ No / Mismatch               | ❌ Unverified   |

## Git Stash

Using Stash

**Handle Urgent Work While Stashing Current Progress**

1. **List current stashes (if any)**
   Before stashing, you might want to check any existing stashes:

   ```bash
   $ git stash list
   ```

2. **Add untracked files to the staging area**
   To include untracked files in the stash, you first need to add them:

   ```bash
   $ git add .
   ```

   Or, use:

   ```bash
   $ git add <file_1> <file_2>
   ```

3. **Stash single or multiple files**
   You can save your current work in the stash and add a message to identify it easily later. To stash a specific file or set of files, use:

   ```bash
   $ git stash push -m "Work in progress" <file1> <file2>
   ```

   To stash all the files in the staging area area at once:

   ```bash
   $ git stash push -m
   ```

4. **Work on the urgent file**
   After stashing, you can now work on the urgent file and commit your changes:

   ```bash
   $ git commit -m "Fix taxes"
   ```

5. **List stashes again**
   Once you finish the urgent work, check the stash list to see the stashes you saved earlier:

   ```bash
   $ git stash list
   ```

6. **Pop specific stashes (single file or all)**
   To bring back a specific file from the stash to the working directory, use:

   ```bash
   $ git stash pop stash@{index}
   ```

   For example, to pop the first stash in the list:

   ```bash
   $ git stash pop stash@{0}
   ```

   To send back the files stash to the working area:

   ```
   $ git stash pop
   ```

7. **Check the commit history**
   Once your work is restored and organized, you can view your commit history:

   ```bash
   $ git log --oneline
   ```

This version allows you to stash and pop individual files while maintaining a clear flow for handling urgent tasks.

## Create and set up a new repository on gitlab.com

TODO:

## Reconfigure git user and email on a fresh OS installation before running any new commit

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

##  git config – How to Configure Git Settings to Improve Your Development Workflow

TODO:

Web: https://www.freecodecamp.org/news/git-config-how-to-configure-git-settings/

## git restore

TODO:

Web: https://www.git-tower.com/learn/git/commands/git-restore

## Git Reset to Remote Head – How to Reset a Remote Branch to Origin

TODO:

Web: https://www.freecodecamp.org/news/git-reset-to-remote-head-how-to-reset-a-remote-branch-to-origin/

##  Git Rename Branch – How to Change a Local Branch Name

TODO:

Web: https://www.freecodecamp.org/news/git-rename-branch-how-to-change-a-local-branch-name/

## Git Fetch vs Pull: What's the Difference Between the Git Fetch and Git Pull Commands?

TODO:

Web: https://www.freecodecamp.org/news/git-fetch-vs-pull/#:~:text=git%20fetch%20is%20the%20command,changes%20from%20the%20remote%20repository.

## Git diff Command – How to Compare Changes in Your Code

TODO: 

Web: https://www.freecodecamp.org/news/git-diff-command/

## How to Write Better Git Commit Messages – A Step-By-Step Guide

TODO:

Web: https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages/

## How to Write Good Commit Messages: A Practical Git Guide

Web: https://www.freecodecamp.org/news/writing-good-commit-messages-a-practical-guide/

## Which commit message convention do you use at work?

Web: https://hashnode.com/post/which-commit-message-convention-do-you-use-at-work-ck3e4jbdd00zyo4s1h7mc7e0g

## How to Write Good Commit Messages with Commitlint

TODO:

Web: https://www.freecodecamp.org/news/how-to-use-commitlint-to-write-good-commit-messages/

## GitHub Skills

TODO:

https://skills.github.com/

## How to Setup a CI/CD Pipeline with GitHub Actions and AWS

TODO:

Web: https://www.freecodecamp.org/news/how-to-setup-a-ci-cd-pipeline-with-github-actions-and-aws/

## Is there a way to know who downloads my Github repository

TODO:

Web: https://stackoverflow.com/questions/36854401/is-there-a-way-to-know-who-downloads-my-github-repository

## GitHub: Tab size preferences. Emoji skin tone preferences

Go to: https://github.com/settings/appearance

## Git Blame commands

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

## Summary of Commands to Show Changes VS Git Diff Comparison Commands

Summary of Commands to Show Changes VS Git Diff Comparison Commands

| Command | Description |
|----------|--------------|
| `git diff` | Show unstaged changes in the working directory compared to the index (staging area). |
| `git diff 35f4b4d 186398f` | Show changes between two specific commits. |
| `git diff HEAD~1 HEAD~2` | Show differences between two recent commits. |
| `git show HEAD~1` | Display details and changes from the second most recent commit. |
| `git annotate <file>` | Show line-by-line changes with the author and commit information. |

Additional Useful Commands to Show Changes

| Command                | Description                                                                                                  |
| ---------------------- | ------------------------------------------------------------------------------------------------------------ |
| `git status`           | Summarize which files are modified, staged, or untracked.                                                    |
| `git diff --staged`    | Show changes between the staged (index) files and the last commit.                                           |
| `git log -p`           | Show commit history along with the diff for each commit.                                                     |
| `git show <commit>`    | Display metadata and changes introduced by a specific commit. *(You already have an example with `HEAD~1`.)* |
| `git blame <file>`     | Similar to `git annotate`, shows who last modified each line of a file.                                      |
| `git diff --name-only` | List only the names of changed files, not their contents.                                                    |
| `git diff --stat`      | Show a summary of changes (number of insertions/deletions per file).                                         |

Git Diff Comparison Commands

| **Command**                 | **Description**                                                      |
| --------------------------- | -------------------------------------------------------------------- |
| `git diff filename`         | Compare an **unstaged file** with the **last committed version**.    |
| `git diff -r HEAD filename` | Compare a **staged file** with the **last committed version**.       |
| `git diff -r HEAD`          | Compare **all staged files** with their **last committed versions**. |

## Resolving a conflict

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

## Undoing Changes in Git: revert, reset, checkout, and clean – When and How to Use Them

git revert allows you to undo a change in a shared branch.

You apply a commit that introduces an unintended change to the target branch of the repository. You need to run a Git command that will undo the change applied by the commit.

git revert

Compare to 'git reset'.

------------------------------------------

git reset -mixed HEAD

git reset --mixed HEAD undoes the staging of files but keeps file changes. It does not affect commits.

GIT MAN Topic: How do I delete previous commits (on git and/or GitHub)

Discard changes in all tracked files (files that Git is currently tracking).

git reset --hard

Effect: Resets your current branch completely to a specific commit. By default, if you don’t specify a commit, it resets to HEAD. This affects:

Working directory (your files) → reverted to match the commit

Staging area (index) → cleared to match the commit

HEAD → stays at the commit you reset to (or moves if you specify a commit)

Example:

git reset --hard


Discards all local changes (both staged and unstaged) and makes your files exactly match the last commit.

If you want to reset to an older commit:

git reset --hard <commit-hash>

Important: This cannot be undone easily if the changes are not committed somewhere; your work is lost.

Compare to git 'revert'.
Compare git reset --hard to git checkout -- .

-----------------------------------------

git reset --hard VS git checkout -- .

This is a subtle but important distinction in Git! Both git reset --hard and git checkout -- . can revert changes, but they work at different levels and affect different things.

| Command              | Affects Working Directory | Affects Staging Area | Moves HEAD? | Can lose uncommitted changes?       |
|----------------------|--------------------------|--------------------|------------|-----------------------------------|
| git reset --hard     | Yes                      | Yes                | Yes        | Yes                               |
| git checkout -- .    | Yes                      | No                 | No         | Yes (for unstaged changes)        |


Quick rule of thumb:
Use git checkout -- . when you want to discard unstaged edits only.
Use git reset --hard when you want to wipe everything and reset your branch completely.

----------------------------------------

git checkout -- .

Discard changes on files using Git.

Effect: Only discards changes in the working directory (your files) for the current folder (or you can target a specific file). It does not affect:

The commit history → HEAD doesn’t move

The staging area → changes in the index are untouched unless you specifically reset those too

Reverts all unstaged changes in the current directory to match the last commit.

If you want to revert a specific file:

git checkout -- <file_path>

This command will discard the changes made to the specified file and revert it to the last committed state.

----------------------------------------

git clean deletes untracked files but does not undo a commit.

git clean

-----------------------------------------

git rebase integrates source branch commits into the target branch, it does not undo changes.

git rebase

## Restoring an old version of a file

git checkout -- filename

To revert to a version from a specific commit:
git checkout dc9d8fac mental_health_survey.csv

This was the second to last commit, so another approach is:
git checkout HEAD~1 mental_health_survey.csv


## 5 tips to improve your Code Reviews on GitHub

https://dev.to/this-is-learning/5-tips-to-improve-your-code-reviews-on-github-gja

## GitHub: Start with a pull requested

Web: https://github.com/features/code-review

## GitHub: About pull request reviews

Web: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews

## Managing code review settings for your team

Web: https://docs.github.com/en/organizations/organizing-members-into-teams/managing-code-review-settings-for-your-team

## The Best Way To Do A Code Review On GitHub

The Best Way To Do A Code Review On GitHub:
Web: https://linearb.io/blog/code-review-on-github/

## Choosing a name for a Git branch

When choosing a name for a Git branch, it's helpful to use descriptive and meaningful names that convey the purpose or goal of the branch. Since you want to test the implementation of "Whisper" in your project but are unsure if it will be implemented, you could consider a branch name like:

feature/whisper-testing: This name clearly indicates that the branch is for testing the "Whisper" feature in your project.

experiment/whisper-implementation: This name suggests that the branch is for experimenting with the implementation of "Whisper" in your project.

dev/whisper-prototype: This name implies that the branch is for developing a prototype or initial version of the "Whisper" feature in your project.

experiment/estebanways

Remember to prefix the branch name with either feature/, experiment/, or dev/ to maintain consistency with Git branch naming conventions. Additionally, feel free to customize the branch name further based on your project's naming conventions or personal preferences.

## Paste public github file content on OpenAI's ChatGPT using prompts

open https://github.com/estebanways/multiple-dev-container-vscode/blob/master/python-src/hello.py from estebaways

Syntax:
open github file <web-address> from <public-repo-user>

Certainly! Here's the content of the hello.py file from the GitHub repository you provided:
python
print("Hello from Python!")
This simple script prints the message "Hello from Python!" to the console.

## Reduce the size of the repository by rewriting the branch history

You have a Git repository that is used by your team to collaborate on a project. The repo contains a single branch with a long history of changes.
You need to reduce the size of the repository by rewriting the branch history.

The git filter-branch and git filter-repo commands support rewriting history for a specific branch, which significantly reduces the repository size in this scenario.

git filter-branch

git filter-repo

## Git Large File Storage (LFS) - Replaces large files

Git Large File Storage (LFS) - Replaces large files such as audio samples, videos, datasets, and graphics...

Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and
graphics with text pointers inside Git, while storing the file contents on a remote server
like GitHub.com or GitHub Enterprise.

Getting Started
Download and install the Git command line extension. Once downloaded and installed, set up Git LFS for your user account by running:

git lfs install
You only need to run this once per user account.

In each Git repository where you want to use Git LFS, select the file types you'd like Git LFS to manage (or directly edit your .gitattributes). You can configure additional file extensions at anytime.

git lfs track "*.psd"

Now make sure .gitattributes is tracked:

git add .gitattributes

Note that defining the file types Git LFS should track will not, by itself, convert any pre-existing files to Git LFS, such as files on other branches or in your prior commit history. To do that, use the git lfs migrate(1) command, which has a range of options designed to suit various potential use cases.

There is no step three. Just commit and push as you normally would; for instance, if your current branch is named main:

git add file.psd
git commit -m "Add design file"
git push origin main

Check out their wiki, discussion forum, and documentation for help with any questions you might have!

Information from: https://git-lfs.com/

## Git LFS servers

Git LFS servers are useful for large files that don’t work well in normal Git repositories, because Git stores all history in the .git folder, which grows quickly with big files. Typical use cases include:

1. Binary Files

Files that can’t be efficiently diffed (Git only stores changes well for text files).

Examples:

.exe, .dll, .bin

.zip, .tar.gz

.iso

.apk or .ipa

2. Media Assets

Large images, videos, or audio files used in projects.

Examples:

.png, .jpg, .tif, .psd (Photoshop)

.mp3, .wav

.mp4, .mov

3. Game Development / Design Files

Big assets for games or 3D projects.

Examples:

.fbx, .obj, .blend (Blender)

.unity, .umap, .uasset (Unreal Engine)

4. Scientific / Data Files

Large datasets or simulation outputs.

Examples:

.csv, .h5, .mat

GIS or satellite imagery files

5. Other Large Project Files

Any file that would bloat your Git repo if stored normally.

Key point: Git LFS doesn’t replace Git for code; it’s only for large files that change infrequently, so your repo stays lightweight.

++ Here’s a practical workflow for deciding which files to put in Git LFS and which to keep in Git:

1. Files to Keep in Normal Git

Text files and code: Git tracks changes efficiently.

.c, .cpp, .py, .js, .html, .css

Configuration & scripts: Usually small, frequently changed.

.json, .yaml, .sh, .env.example

Documentation:

.md, .txt

Rule of thumb: If the file is small (< 5–10 MB) and diffable, keep it in Git.

2. Files to Move to Git LFS

Large binaries: Don’t diff efficiently.

.exe, .dll, .bin

Media & assets:

Images: .png, .jpg, .psd, .tif

Video/audio: .mp4, .mov, .mp3, .wav

3D assets: .fbx, .obj, .blend

Datasets & simulations:

.csv, .h5, .mat, large .json files

Compressed archives:

.zip, .tar.gz, .apk, .ipa

Rule of thumb: If the file is large, rarely changes, or will bloat your Git history, use LFS.

3. How to Track LFS Files

Install Git LFS on your local machine:

git lfs install

Track specific types of files:

git lfs track "*.psd"
git lfs track "*.mp4"
git lfs track "*.bin"

Commit the .gitattributes file created by LFS:

git add .gitattributes
git commit -m "Track large files with LFS"

4. Tips

Don’t track small, frequently-changing files with LFS; it adds overhead.

Plan your .gitattributes at the start of the project to avoid retrofitting.

Keep backups of the LFS storage folder—losing it can break your repo.

++ Create a file server for Git LFS (Large File Storage).

Git LFS stores large files separately from your Git repository, usually on a dedicated server or cloud storage. Here’s a clear guide to setting up your own Git LFS server:

1. Prerequisites

A server with SSH or HTTP access (Linux recommended).

Git installed on the server.

Optional: Nginx or Apache if you want HTTP access.

2. Choose a Git LFS Server Implementation

There are multiple ways to host Git LFS:

+++ Option A: Use git-lfs-server (simple, open source)

A lightweight server written in Go.

GitHub: https://github.com/git-lfs/lfs-test-server

Steps:

Install Go on the server if needed.

Clone the repository:

git clone https://github.com/git-lfs/lfs-test-server.git
cd lfs-test-server
go build

Create a directory to store LFS files:

mkdir -p /srv/git-lfs

Run the server:

./lfs-test-server -dir /srv/git-lfs -port 8080

Point your Git repository to use it:

git lfs install
git lfs track "*.bin"
git remote set-url origin http://your-server:8080/your-repo.git

+++ Option B: Serve via HTTP using git-lfs + a normal Git server

Set up a normal Git server (bare repository):

mkdir -p /srv/git/myrepo.git
cd /srv/git/myrepo.git
git init --bare

Enable Git LFS support in the repo:

git lfs install

Configure your Git LFS server URL (for pushing/pulling):

git config lfs.url http://your-server/myrepo.git/info/lfs

Set up a web server (like Nginx or Apache) to serve /srv/git/myrepo.git/info/lfs.

Option C: Use Ready Solutions

Gitea – lightweight self-hosted Git server with Git LFS support.

GitLab CE – full-featured Git server with LFS support built-in.

3. Configure Your Client

On your local machine:

git lfs install
git lfs track "*.psd"  # or any large file type
git add .gitattributes
git add <your-large-files>
git commit -m "Add large files"
git push origin main

4. Notes

HTTP is easier for clients behind firewalls, SSH is simpler for trusted environments.

Always back up the LFS storage folder; it contains all your large files.

If you use git-lfs-server or HTTP, make sure to secure it with HTTPS or authentication.


Create a private Git LFS server using Docker

Here’s a ready-to-run Docker setup for a private Git LFS server using the lfs-test-server image. This is simple and self-contained.

1. Create a Directory for Storage

On your host machine, create a folder for LFS files and configuration:

mkdir -p ~/git-lfs-server/data

This folder will persist your LFS files outside the container.

2. Create a docker-compose.yml
version: "3"

services:
  git-lfs:
    image: registry.gitlab.com/git-lfs/lfs-test-server:latest
    container_name: git-lfs-server
    ports:
      - "8080:8080"  # HTTP port
    volumes:
      - ./data:/data
    environment:
      LFS_DIR: /data


ports: Change 8080 if you want a different HTTP port.

./data:/data: Maps host folder to container storage.

3. Start the Server
docker-compose up -d

Check logs to confirm it’s running:

docker-compose logs -f

4. Configure Your Git Repository

On your local machine:

git lfs install
git lfs track "*.bin"  # track large files
git add .gitattributes
git add <your-large-files>
git commit -m "Add LFS files"

Set the LFS URL for your repo:

git remote add origin http://YOUR_SERVER_IP:8080/your-repo.git
git config lfs.url http://YOUR_SERVER_IP:8080/your-repo.git/info/lfs
git push origin main

5. Optional: Enable HTTPS

For production use, it’s better to put Nginx or Caddy in front of the container with SSL. Example:

server {
    listen 443 ssl;
    server_name git-lfs.example.com;

    ssl_certificate /etc/ssl/fullchain.pem;
    ssl_certificate_key /etc/ssl/privkey.pem;

    location / {
        proxy_pass http://127.0.0.1:8080;
    }
}

Done! You now have a private Git LFS server running in Docker. All your large files will be stored in ~/git-lfs-server/data.

## What happens if you track an image using Git LFS but the Git LFS server is down

What happens if you track an image using Git LFS but the Git LFS server is down when you commit and push?

Here’s what happens in that scenario:

1. Committing Locally

Git LFS stores the file as a pointer locally in your repository.

You can commit normally in Git, even if the LFS server is down, because the commit only records a small text “pointer” file that references the large file.

No large file is uploaded yet, so the commit succeeds.

2. Pushing to Remote

When you run git push (or git push origin main), Git LFS tries to upload the actual large file to the LFS server.

If the LFS server is down:

The push will fail with an error like:

Git LFS: Upload failed for <filename>
batch request: Post <server URL>/objects/batch: dial tcp <IP>: connect: connection refused

The Git commit itself may still reach the Git remote, but the pointer in the repo points to a file that wasn’t uploaded.

Any other user cloning or pulling the repo will not be able to get the actual large file, only the pointer.

3. What to Do

Wait until the LFS server is back online and push again.

Git LFS keeps track of which files still need to be uploaded, so a retry will resume the upload.

You can also check which files are pending:

git lfs status

| Action                    | Server up             | Server down                                            |
| ------------------------- | --------------------- | ------------------------------------------------------ |
| **Commit**                | Works                 | Works (pointer stored)                                 |
| **Push**                  | Works, files uploaded | Fails for large files, pointer pushed but file missing |
| **Clone / Pull (others)** | Works                 | Fail to download large files, errors appear            |

Key takeaway: Your Git history is safe, but collaborators won’t get the real large files until the LFS server is back online.


How to keep working offline with LFS files even when the server is down—very handy for unstable servers?

1. Understand Local Storage

When you commit LFS-tracked files, Git stores a pointer in .git and the actual large file in the local LFS cache (~/.git/lfs/objects by default).

This means you can still work locally with your files even if the LFS server is offline.

2. Using LFS Files Offline

You can edit, commit, and manage LFS files locally just like normal files.

The .gitattributes file ensures Git knows these are LFS-tracked files.

Example workflow offline:

git add my_large_file.mp4
git commit -m "Update video file offline"

This works even if the server is down.

3. Pushing Later

Once the LFS server is back online, simply push as usual:

git push origin main

Git LFS will detect which files need uploading and send only those files.

You can check pending uploads:

git lfs status

4. Sharing With Collaborators

While offline or server-down, other collaborators cannot pull the LFS files. They’ll get the pointer files and see an error if they try to check out the content.

To prevent blocking them:

Push the Git commits without LFS files temporarily if needed.

Or work locally until the LFS server is back.

5. Optional: Local LFS Server

You can also set up a local LFS server for temporary offline use.

Example: Docker container running lfs-test-server on your machine. Point your repo to it:

git config lfs.url http://localhost:8080/your-repo.git/info/lfs

This way, all LFS operations stay local until you push to the real remote.

Key Takeaway: Git LFS lets you commit and work locally offline, because the large files are cached. The only limitation is that collaborators can’t fetch LFS files until the server is online.

## Fix the remote error message: GH001: Large files detected

I removed the file but github error persists:

```output
origin main 
Enumerating objects: 29, done.
Counting objects: 100% (29/29), done.
Delta compression using up to 4 threads
Compressing objects: 100% (24/24), done.
Writing objects: 100% (24/24), 228.44 MiB | 5.69 MiB/s, done.
Total 24 (delta 9), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (9/9), completed with 3 local objects.
remote: error: Trace: 2e227e872bb6b9bb8c803c758d30fafe82681a1f70a38b6e1c849b1ab876eb44
remote: error: See https://gh.io/lfs for more information.
remote: error: File 03. Spec-Driven Development and Context Engineering/Mastering Context Engineering 2/Mastering Context Engineering 2 720p.mp4 is 239.72 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
To github.com:estebantechdev/Spec-Driven_Development.git
 ! [remote rejected] main -> main (pre-receive hook declined)

```
 
This happens because the file is still in your Git history, even if you deleted it from the folder.

GitHub rejects the push because that 239 MB MP4 exists in a previous commit, and GitHub scans the entire history, not just the latest state.

Deleting the file locally is not enough — you must rewrite history to remove it completely.

Why the Error Persists

- You added the video.

- You committed it.

- Later you deleted it.

- But the commit that added it is still part of the branch history.

- GitHub blocks the push because one commit contains a file >100 MB.

### Solution — Remove the File From History

#### Step 1 — Install git filter-repo (recommended)

Linux / macOS

```shell
pip install git-filter-repo
```

Windows (PowerShell)

```shell
pip install git-filter-repo
```

#### Step 2 — Run Filter

From the root of your repository:

```shell
git filter-repo --path "03. Spec-Driven Development and Context Engineering/Mastering Context Engineering 2/Mastering Context Engineering 2 720p.mp4" --invert-paths
```

This command means:

Find that file in all commits

Remove it everywhere

Rewrite history

#### Step 3 — Force Push

```shell
git push origin main --force
```

Now GitHub will accept it because the large file no longer exists in history.

Important Notes

If This Is a New Repo

This is safe and easy.

If Others Cloned the Repo

They will need to re-clone, because history changed.

### Alternative (Nuclear Option — Easiest for New Projects)

If you don’t care about history yet:

```shell
rm -rf .git
git init
git config --global init.defaultBranch main
git add .
git commit -m "clean start"
git branch -M main
git remote add origin <repo-url>
# Example:
# git remote add origin git@github.com:estebantechdev/Spec-Driven_Development.git
git push -u origin main
```

This completely resets history and guarantees no large files remain.

If you made changes after receiving the error you could require to merge: 

```shell
git config pull.rebase false
git pull origin main  # Or the branch use
```

If you receive an error which includes:

```output
fatal: refusing to merge unrelated histories
```

Note: At this point you can deny the merge locally (steps not included here). On the contrary, we are allowing the unrelated histories by using the following command:

```shell
git pull origin main --allow-unrelated-histories
```

If you receive an error which includes:

```output
Automatic merge failed; fix conflicts and then commit the result.
```

```shell
git status
git diff  # Do not edit files(s) just yet
git add .
git commit -m "Resolve merge conflicts."
git log
git push origin main
```

This will add the change(s) shown on screen. You have pushed without receiving errors this time.

Verify changes, accept them or or re-edit the file(s) involved in the conflict accordingly, save the files and then push again no blocking errors.

```shell
# git pull origin main
# git status
git commit -m "Accept current changes."
git push origin main
```



### Prevent It in the Future

Add a .gitignore:

```gitignore
*.mp4
*.zip
*.iso
*.mov

```

### Key Idea

GitHub rejects history, not just current files.

You must erase the large file from commits, not only from the folder.


## Git milestone tagging options

TODO:

## Reflect changes made to an original Git repository in a copy repository

TODO: Directory: Reflect changes made to an original Git repository in a copy repository

## Change the GitHub username

Go to: https://github.com/settings/admin, and click on teh button to chage the username.

Changing the user name is simple but can become a nightmare as there can be configuration, repos, site accounts, etc. liked to the accaount.

Here is a hyphotetical list of things the change affects for you to consider:

[x] LinkedIn

[x] Personal Blogs

[x] Personal websites and domains

[x] Blockchain profiles

[x] Kaggle

[x] Hugging Face

[x] GitHub profile README.md

[x] GitHub repository documentation

[x] Docker Hub (username)

[x] Pipeline(s )workflow(s)

[x] GitHub releases

[x] Code deployments linked by GitHub user/repo

[x] DIY Linux book (Pay Hip)

[x] DIY Linux book (Leanpub)

[x] lescifi YouTube, DevPills YouTube

[x] Hackerrank

[x] GitHub IO page

[x] Datacamp

[x] Resume

[x] Hoja de Vida (CV)

