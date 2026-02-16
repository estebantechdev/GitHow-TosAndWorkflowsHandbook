# Git LFS servers

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
