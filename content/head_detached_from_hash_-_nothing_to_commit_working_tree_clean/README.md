# HEAD detached from HASH - nothing to commit, working tree clean

## This is not an error

Technically, this is **not an error** — it’s a repository state.

You get:

```output
HEAD detached from 1530afc
nothing to commit, working tree clean
```

when you are **checked out to a commit instead of a branch**, and there are no uncommitted changes.

This is called a **detached HEAD** state. It’s not an error, but if you make new commits here and then switch branches, those commits can become hard to find.

## What leads to it

Here are the most common actions (often accidental) that lead to it:

### 1️⃣ Checking out a specific commit

```shell
git checkout 1530afc
```

or

```shell
git switch --detach 1530afc
```

This is the most common cause.

You are now “looking at history” instead of being on a branch.


### 2️⃣ Checking out a remote branch incorrectly

```shell
git checkout origin/main
```

Instead of:

```shell
git checkout -b main origin/main
```

or:

```shell
git switch main
```

When you checkout `origin/main` directly, you are checking out a **remote tracking reference**, not a local branch — so HEAD becomes detached.

### 3️⃣ Checking out a tag

```shell
git checkout v1.0.0
```

Tags point to commits, not branches. So this also causes a detached HEAD.

### 4️⃣ Using git bisect

If you run:

```shell
git bisect start
```

Git will automatically move you between commits, which temporarily detaches HEAD.

### 5️⃣ Using git worktree incorrectly

For example:

```shell
git worktree add ../test 1530afc
```

If you attach the worktree directly to a commit instead of a branch, it will be detached.

### 6️⃣ Submodules

When entering a submodule directory, it is common to see a detached HEAD because submodules are usually checked out at a specific commit.

## Important Clarification

This state is only dangerous if:

- You make commits

- Then switch branches

- Without creating a branch first

If you see:

```output
nothing to commit, working tree clean
```

you are completely safe.

## How to Prevent It

Instead of checking out commits directly:

✔ Use branches

✔ Create a branch before experimenting

✔ Use `git switch -c new-branch` when exploring

Also, check out the topic:  
Restoring an old version of a file

## What can yo do if you are in that situation

Since your working tree is clean, **you are safe** — you haven’t lost anything. You just need to re-attach HEAD to a branch.

### If you only want to go back to your previous branch

```shell
git switch -
```

or

```shell
git checkout -
```

This returns you to the branch you were on before.

### If you want to keep working from this commit

Create a new branch from where you are:

```bash
git switch -c new-branch-name
```

Now HEAD is attached to a branch and anything you commit will be saved normally.

### If you want to return to an existing branch

List branches:

```bash
git branch
```

Then switch:

```bash
git switch main
```

(or `master`, `develop`, etc.)

#### Key idea

- **Detached HEAD = viewing history**

- **Create or switch to a branch = normal work**

- You only “lose” work if you make commits while detached *and then leave without creating a branch.*
