# Fix the remote error message: GH001: Large files detected

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
