# What happens if you track an image using Git LFS but the Git LFS server is down

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
