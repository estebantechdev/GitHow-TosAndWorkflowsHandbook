# Git stash

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
