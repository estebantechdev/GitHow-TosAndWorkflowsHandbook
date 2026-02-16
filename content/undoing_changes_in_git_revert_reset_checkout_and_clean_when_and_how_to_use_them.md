# Undoing changes in Git: revert, reset, checkout, and clean – When and how to use them

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
