# Create and set up a new repository on github.com

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
