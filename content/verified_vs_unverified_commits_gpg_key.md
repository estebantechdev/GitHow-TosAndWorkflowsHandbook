# Verified vs unverified commits (GPG key)

Topic: GPG keys.
https://github.com/settings/keys

Topic: Managing commit signature verification.
https://docs.github.com/en/authentication/managing-commit-signature-verification

Here’s a clear explanation of verified vs unverified commits on GitHub, especially regarding GPG keys:

1. What are Verified Commits?

A verified commit on GitHub indicates that the commit was signed with a GPG (GNU Privacy Guard) key that is associated with your GitHub account. GitHub confirms that the commit was indeed made by the person who claims to have made it, adding a layer of trust and security.

Key points:

A commit is verified when it is cryptographically signed with your private GPG key.

GitHub checks the signature against your public key linked to your GitHub account.

Verified commits show a “Verified” badge next to them in GitHub's interface.

Example:

commit 9a1b2c3d4e5f6g7h8i9j0k
Author: Esteban Herrera <esteban@example.com>
Verified: ✅

2. What are Unverified Commits?

An unverified commit is a commit that either:

Was not signed with a GPG key, or

Was signed with a GPG key not associated with your GitHub account, or

Has a signature that cannot be verified (e.g., expired or mismatched key).

Key points:

Unverified commits do not have a “Verified” badge.

They can still be trusted if you know the author, but GitHub cannot confirm authenticity cryptographically.

Often appears as “Unverified” in GitHub commits list.

3. How to Sign Commits with a GPG Key

Configure Git to use a GPG key:

$ git config --global user.signingkey <your-key-id>

$ git config --global commit.gpgsign true

Set this command to `false` if you want to disable the GPG verification.

You can use an existent key or generate a new one for your device/user. It is recommended to create a new one just for Git.

Generate a GPG key:

gpg --full-generate-key

To print the GPG key ID in ASCII format:

$ gpg --armor --export <GPG key ID>

<GPG key ID>: You get it using listing your keys:

$ gpg --list-secret-keys --keyid-format LONG

```output
sec    rsa3072/<GPG key ID>
...

```

Add the public key to GitHub:

Go to Settings → SSH and GPG keys → New GPG key.

Paste your public key.

After this, all commits you make with that key will show as verified.

Troubleshooting MS-Windows-WSL-Debian VS Code

When proceeding with `git commit...` you get the error:

```output
error: gpg failed to sign the data: [GNUPG:] KEY_CONSIDERED C68C33E9FBE090488AEA80BBFF5A3D6759436166 2 [GNUPG:] BEGIN_SIGNING H10 [GNUPG:] PINENTRY_LAUNCHED 14546 curses 1.3.1 - xterm-256color :0 - 1000/1000 - gpg: signing failed: Inappropriate ioctl for device [GNUPG:] FAILURE sign 83918950 gpg: signing failed: Inappropriate ioctl for device
```

This specific error usually happens in WSL when GPG tries to open pinentry (the program that asks for your passphrase), but VS Code / WSL doesn’t give it a proper TTY.

In other words: GPG can’t show the password prompt, so it fails.

Fix 1 — Allow TTY for the gpg prompt

Sometimes you just need to tell Git where the TTY is.

Add this:

$ export GPG_TTY=$(tty)

Make it permanent:

$ echo 'export GPG_TTY=$(tty)' >> ~/.bashrc

$ source ~/.bashrc

Test signing again:

$ echo test | gpg --clearsign

If a passphrase prompt appears inside the terminal, this fix worked.

Fix 2 — Force GPG to use pinentry-tty

WSL often cannot open the GUI or curses pinentry. Switching to the TTY version fixes it.

Run this inside WSL:

$ sudo apt install pinentry-tty

Then configure GPG:

$ echo "pinentry-program /usr/bin/pinentry-tty" >> ~/.gnupg/gpg-agent.conf

$ gpgconf --kill gpg-agent

Test signing again:

$ echo test | gpg --clearsign

If a passphrase prompt appears inside the terminal, this fix worked.

4. Why Verified Commits Matter

Security: Ensures the commit was actually made by the claimed author.

Trust: Important for open-source projects and collaboration.

Accountability: Makes tampering harder, especially in critical codebases.

5. Common Issues with Unverified Commits

Using the wrong email in Git commits (must match GitHub account).

Expired or revoked GPG key.

Commit made on a machine without your configured GPG key.

| Commit Type       | Signed with GPG Key? | Associated with GitHub Account? | Badge on GitHub |
|------------------|-------------------|-------------------------------|----------------|
| Verified          | ✅ Yes            | ✅ Yes                         | ✅ Verified     |
| Unverified        | ❌ No / ❌ Invalid | ❌ No / Mismatch               | ❌ Unverified   |
