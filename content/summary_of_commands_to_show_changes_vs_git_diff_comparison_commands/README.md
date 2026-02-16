# Summary of commands to show changes VS git diff comparison commands

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
