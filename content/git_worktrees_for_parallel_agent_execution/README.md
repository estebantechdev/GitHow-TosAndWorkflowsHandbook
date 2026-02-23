# Git Worktrees for Parallel Agent Execution.md

**Git Worktrees for parallel agent execution** means:

You use Git’s *worktree* feature to create multiple isolated working directories from the same repository, so different AI agents (or developers) can work on separate features **at the same time** without interfering with each other.

## What is a Git Worktree?

A **git worktree** lets you check out different branches of the same repository into separate folders — all sharing the same `.git` history.

Instead of doing this:

```output
repo/
  (switch branch constantly)
```

You can do this:

```output
repo-main/        → main branch
repo-feature-A/   → feature-a branch
repo-feature-B/   → feature-b branch
```

All connected to the same Git repository.

## Why This Matters for AI Agents

When you run multiple agents (e.g., Backend Agent, Frontend Agent, Bugfix Agent), they:

- Write files

- Run tests

- Modify branches

- Install dependencies

If they share the same folder, they:

- Overwrite each other’s changes

- Create branch conflicts

- Pollute test environments

Worktrees prevent this.

Each agent gets:

- Its own branch

- Its own directory

- Its own isolated execution context

But all still share the same Git history.

## In an SDD + MCP Context

When your workflow includes:

- `new`

- `ff`

- `apply`

- `verify`

- `archive`

Each feature change can be assigned to its own worktree.

That enables:

- True parallel feature development

- Clean validation per spec

- No branch contamination

- Deterministic CI runs

## Practical Example: A clean enterprise workflow diagram using worktrees + SDD commands

### 🏗️ Enterprise SDD + Worktree Architecture

Here’s a clean **enterprise workflow model** combining:

- **Spec-Driven Development (SDD)**

- **Git Worktrees**

- **Parallel AI Subagents**

- **MCP integrations**

#### 1. Main Repository Structure

You maintain a single canonical repository:

```output
platform/
  specs/
  src/
  context/
  package.json
```

This is your **Source of Truth**.

---

#### 2. Feature Initiation (Product Strategist Agent)

Command:

```shell
enrich PROJ-142
new
```

What happens:

- Jira ticket is enriched

- Spec artifacts are generated

- A feature branch is created:


```shell
feature/PROJ-142-login-rate-limit
```

#### 3. Create an Isolated Worktree

From root repo:

```shell
git worktree add ../wt-PROJ-142 feature/PROJ-142-login-rate-limit
```

So Git creates the new worktree beside your repo, not inside it.

Now you have:

```
platform/              → main branch
wt-PROJ-142/           → feature branch
```

This folder is assigned to the AI agent responsible for implementation.

### 🤖 Parallel Agent Execution Model

You can now spin up multiple worktrees:

```shell
git worktree add ../wt-PROJ-201 feature/PROJ-201-payment-retry
git worktree add ../wt-PROJ-333 feature/PROJ-333-2fa-auth
```

Result:

```output
wt-PROJ-142   → Backend agent working on login
wt-PROJ-201   → Backend agent working on payments
wt-PROJ-333   → Frontend agent working on 2FA
```

Each worktree:

- Has its own branch

- Has its own `node_modules`

- Runs its own tests

- Can execute `apply` and `verify` independently

Zero interference.

### 🔁 Full SDD Lifecycle Per Worktree

Inside each worktree:

#### Step 1 – Generate Artifacts

```shell
ff
```

Generates:

- Proposal

- Spec (BDD)

- Design decisions

- Implementation checklist

#### Step 2 – Implementation

```shell
apply
```

Agent:

- Writes failing tests

- Implements logic

- Follows DDD

- Checks off tasks

#### Step 3 – Automated Audit

```shell
verify
```

System checks:

- 100% task completion

- 90%+ test coverage

- HTTP code compliance

- Security validation (SQLi/XSS)

- Architectural coherence

#### Step 4 – Archive as Delta

```shell
archive
```

Updates:

```output
specs/authentication.md
```

Adds Delta:

```output
+ Login rate limit rules
+ 429 error handling
```

Live documentation updated.

### 🧠 Why Worktrees Are Critical at Scale

Without worktrees:

- Agents fight over the same branch

- CI pipelines conflict

- Dependencies override each other

- Specs get out of sync

- Validation becomes nondeterministic

With worktrees:

| Risk               | Without Worktrees | With Worktrees     |
| ------------------ | ----------------- | ------------------ |
| Branch collisions  | High              | Zero               |
| Test contamination | Likely            | Isolated           |
| Spec drift         | Frequent          | Controlled         |
| CI reliability     | Fragile           | Deterministic      |
| Parallel velocity  | Limited           | Horizontal scaling |

### 🏢 Enterprise Pattern (50–500 Engineers)

At scale:

- Each feature = 1 branch

- Each branch = 1 worktree

- Each worktree = 1 AI execution context

- Each context = full SDD lifecycle

This enables:

- Horizontal AI scaling

- Deterministic validation

- Modular PR generation

- Reduced technical debt

### 🧩 Advanced Pattern (Optional)

You can containerize each worktree:

```output
wt-PROJ-142 → Docker container A
wt-PROJ-201 → Docker container B
wt-PROJ-333 → Docker container C
```

Now you achieve:

- Full environment isolation

- Independent runtime versions

- Parallel CI simulation locally

### 🎯 The Core Idea

> Worktrees are not just a Git trick.

> They are infrastructure for deterministic parallel AI engineering.

They allow SDD to function as a production-grade orchestration system instead of a prompt experiment.
