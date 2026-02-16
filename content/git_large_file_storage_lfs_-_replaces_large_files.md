# Git Large File Storage (LFS) - Replaces large files

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
