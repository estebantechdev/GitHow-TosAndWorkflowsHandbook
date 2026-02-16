# A GIT manual, from the Book DIY Linux

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
