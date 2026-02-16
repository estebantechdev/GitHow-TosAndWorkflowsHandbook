# CHALLENGE: Create a pull request on GitHub

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
