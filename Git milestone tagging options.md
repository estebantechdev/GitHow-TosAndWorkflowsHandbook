# Git milestone tagging options

## Mark a point in your Git history without publishing a visible release on GitHub

You’ve got several clean ways to “mark” or “freeze” a point in your Git history **without publishing a visible release on GitHub**. Here are the best options, depending on what you want to achieve:

---

### 🟢 1. **Create a lightweight or annotated tag (but don’t make a GitHub release)**

You can **tag your milestone locally** and push it, but not turn it into a public “release.”

#### Example

```bash
# Create an annotated tag (recommended)
git tag -a milestone-2025-11 -m "Milestone reached: stable internal build"

# Push the tag
git push origin milestone-2025-11
```

This tag **will appear under “Tags”** on GitHub (in the “Releases” section → “Tags”),
but **not as a published Release** unless you explicitly create one via the GitHub UI.

If you want to keep it fully private (not even pushed):

```bash
git tag -a local-milestone -m "Internal milestone"
# don't push it
```

---

### 🟡 2. **Use branches instead of tags**

If you prefer not to tag at all, you can just create a **milestone branch**.

```bash
git checkout -b milestone-2025-11
git push origin milestone-2025-11
```

Later, you can delete it if it’s no longer relevant:

```bash
git push origin --delete milestone-2025-11
```

Branches can track ongoing milestone work or mark frozen snapshots for internal use.

---

### 🔵 3. **Use Git notes for invisible metadata**

If you want to **attach notes** to commits without altering tags or branches:

```bash
git notes add -m "Milestone: internal v1.3 pre-release" <commit-hash>
```

Notes are not shown on GitHub by default, but they stay in your repo history (you can push them with `git push origin refs/notes/*` if you want to share them internally).

---

### 🟣 4. **Use GitHub milestones (non-code markers)**

If your goal is **progress tracking**, not source freezing:

* Use **Issues → Milestones** in GitHub.
* Each milestone can group issues or PRs related to a specific stage or goal.
* No impact on Git tags or code history.

---

### 🔘 Summary

| Goal                                                 | Recommended Action                                   |
| ---------------------------------------------------- | ---------------------------------------------------- |
| Save a specific code snapshot (hidden from Releases) | Create an annotated tag, don’t make a GitHub Release |
| Keep a working or experimental branch                | Use a milestone branch                               |
| Add hidden metadata to commits                       | Use `git notes`                                      |
| Track feature goals or tasks                         | Use GitHub Milestones                                |

## Semantic versioning

Sure — **Semantic Versioning (SemVer)** is a standardized way to assign version numbers to software releases so that the version itself communicates what changed and how risky it might be to update.

The formal specification is **[SemVer 2.0.0](https://semver.org/)**, and it follows this pattern:

```
MAJOR.MINOR.PATCH
```

For example:

```
1.4.2
```

---

### 🔹 1. **MAJOR version** — breaking changes

Increase the **MAJOR** number when you make changes that **break compatibility** with previous versions.
That means someone upgrading might need to change their code, configs, or behavior.

**Example:**
`1.4.2 → 2.0.0`

> You changed an API endpoint or removed a function. It’s not backward-compatible.

---

### 🔹 2. **MINOR version** — new features (no breaking changes)

Increase the **MINOR** version when you **add functionality** that’s **backward-compatible**.
Old code keeps working, but new features are available.

**Example:**
`1.4.2 → 1.5.0`

> You added a new optional feature or endpoint, but nothing existing broke.

---

### 🔹 3. **PATCH version** — bug fixes only

Increase the **PATCH** number when you fix **bugs**, **security issues**, or make **minor improvements** that don’t change APIs or features.

**Example:**
`1.4.2 → 1.4.3`

> Fixed a crash, typo, or small UI glitch.

---

### 🔹 4. **Pre-release versions**

You can add suffixes for **development** or **testing versions**:

```
1.4.0-alpha
1.4.0-beta
1.4.0-rc.1   # “release candidate”
```

These are not stable yet — they tell others the version might still change.

---

### 🔹 5. **Build metadata**

You can also append build info after a `+`:

```
1.4.0+build20251111
```

It’s ignored in version precedence (it doesn’t affect ordering), but useful for internal tracking.

---

### 🔸 Example progression

| Stage                 | Version        | Change                           |
| --------------------- | -------------- | -------------------------------- |
| Initial release       | `1.0.0`        | Stable API baseline              |
| New feature added     | `1.1.0`        | Backward compatible              |
| Bug fix               | `1.1.1`        | Small patch                      |
| Breaking API redesign | `2.0.0`        | Incompatible change              |
| Experimental version  | `2.1.0-beta.1` | Test build before stable release |

---

### 🧭 Rule of thumb

If you follow SemVer:

* Don’t break backward compatibility in `1.x` → `1.x` updates.
* Reserve `0.x.y` for **early prototypes** — anything can change there.
* Communicate meaning through version numbers — so users can upgrade confidently.

### Identifying info

In the previous example:

```
1.4.0+build20251111
```

the part after the `+` is **build metadata**, and it’s completely up to you.
In your case:

* `2025` → year
* `11` → month
* `11` → day

So `build20251111` likely means **“build from November 11, 2025.”**

You can include any identifying info there — for example:

```
1.4.0+build20251111   # date-based
1.4.0+commitabc123    # git commit-based
1.4.0+mydroid-ci42    # CI build ID
```

It’s mainly for tracking **internal builds** or **automation logs** —
it doesn’t affect version comparison (e.g., `1.4.0` and `1.4.0+build20251111` are treated as the same version in SemVer ordering).

## Where and how to maintain explanation of the builds

Excellent question — version numbers (and especially build metadata) only give you a short label, but you need a place to **record what that build actually means**.

Here are the most common and practical ways to maintain that explanation:

---

### 🗂️ 1. **`CHANGELOG.md`**

The industry-standard way.

You keep a Markdown file in your repository that summarizes what changed in each version or build:

markdown file:

# Changelog

## [1.4.0+build20251111] – 2025-11-11
- Improved API response time by 15%
- Fixed timeout issue in `auth_service`
- Internal build for test deployment on staging

## [1.4.0] – 2025-10-30
- Added `--verbose` flag to CLI
- Improved error handling

End of file.

🟢 Advantages:

* Easy to read for humans
* Works locally and on GitHub
* Becomes part of version control history

If you follow [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), it’s even better structured.

---

### 🧾 2. **Git Tag Annotations**

When you create your tag, you can embed the explanation directly in it:

```bash
git tag -a v1.4.0+build20251111 -m "Staging build with API performance improvements and timeout fix"
git push origin v1.4.0+build20251111
```

Later, anyone can read it with:

```bash
git show v1.4.0+build20251111
```

🟢 Great for: keeping a permanent record in Git itself (no separate file needed).
🔴 Not as readable in GitHub’s web UI unless you look under **Tags**.

---

### 🧰 3. **GitHub Releases (optional, even if private)**

If you want to write rich Markdown release notes **without making it public**, you can still create a **draft release** or a **private release** on GitHub and not publish it.

This lets you attach:

* Descriptions
* Binary artifacts or ZIPs
* Links to CI builds

🟢 Good for: internal teams using GitHub for deployment
🔴 Not ideal if you don’t want anything visible under “Releases.”

---

### ⚙️ 4. **In CI/CD metadata**

If you have automated builds (GitHub Actions, Jenkins, etc.), you can store explanations as:

* CI build logs or artifacts
* A text or JSON file uploaded to your internal server or artifact store
* A record in your internal dashboard (e.g., “Build 20251111 → commit abc123 → staging server”)

---

### 🗃️ 5. **Dedicated documentation or wiki**

If your project has a **docs folder** or a **GitHub Wiki**, you can create a page:

```
docs/builds/2025-11-11.md
```

with details like:

* Git commit hash
* Components included
* Environment tested
* Known issues

---

### ✅ Recommended combo for most dev teams:

* Use `CHANGELOG.md` for a human-readable history
* Use annotated git tags for quick technical traceability
* Optionally link your CI build number in the changelog

## a template CHANGELOG.md tailored for builds that include SemVer metadata (like +build20251111)

Perfect — here’s a clean and professional **`CHANGELOG.md` template** designed for projects using **Semantic Versioning** plus **build metadata** (e.g., `+build20251111`).

It follows the *Keep a Changelog* style but includes a special section for internal or CI builds.

---

### 📄 **`CHANGELOG.md`**

```markdown
# Changelog
All notable changes to this project will be documented in this file.

The format follows [Semantic Versioning](https://semver.org/)  
and this changelog is structured according to [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [Unreleased]
- Planned updates and upcoming changes go here.

---

## [1.4.0+build20251111] – 2025-11-11
**Internal Build**  
_Commit:_ `abc1234`  
_CI Pipeline:_ `mydroid-ci #42`  
_Environment:_ Staging

### Added
- API latency monitor added to `metrics.py`
- Logging improvements for request tracing

### Changed
- Optimized token validation process
- Updated dependency `requests` to `2.32.0`

### Fixed
- Timeout issue in `auth_service`
- Incorrect response header in `/health` endpoint

### Notes
- This build is used for pre-production testing.
- Expected to become version `1.4.1` after validation.

---

## [1.4.0] – 2025-10-30
### Added
- Introduced CLI flag `--verbose` for detailed logs
- Added support for configuration via environment variables

### Fixed
- Minor bug in startup script causing redundant logging

---

## [1.3.2] – 2025-09-22
### Fixed
- Security patch for API token expiration
- Race condition in file upload handler

---

## [1.0.0] – 2024-12-01
Initial stable release.
```

---

### 🧭 How to Use It

1. **Each release or build** gets its own section.

   * Stable versions: `1.4.0`
   * Internal builds: `1.4.0+build20251111`
2. **Add commit hash and environment info** to track exactly what was deployed or tested.
3. **Group changes** under “Added,” “Changed,” “Fixed,” etc.
4. Leave an `[Unreleased]` section at the top to stage upcoming work before tagging.

---

### 💡 Tip

If you want your changelog to automatically fill with commit messages, you can later use a tool like:

* [`git-chglog`](https://github.com/git-chglog/git-chglog)
* [`standard-version`](https://github.com/conventional-changelog/standard-version)
* or a simple Python/Bash script that extracts commits between tags.

The `CHANGELOG.md` file should live in the **root directory** of your repository — right next to files like:

```
README.md
LICENSE
CHANGELOG.md
.gitignore
src/
```

That’s the **standard location** recognized by most tools, and it makes it easy for collaborators (and GitHub itself) to find it immediately.

---

### 🧭 Why the root directory?

* **Visibility:** It appears on the main page of your repo, below the README.
* **Consistency:** Package managers and automation tools (like `git-chglog`, `release-please`, or CI scripts) expect it there.
* **Documentation standard:** It keeps your top-level project docs (`README`, `LICENSE`, `CHANGELOG`) grouped together for clarity.

---

If you ever split your repo into submodules or apps (like *client/*, *server/*, *routines/*),
you can still keep:

* one **global changelog** at the root, or
* smaller component-specific ones (e.g. `client/CHANGELOG.md`, `server/CHANGELOG.md`)

depending on how separately you maintain those modules.

## Hybrid structure outline

Here’s a clean and scalable setup tailored for **multi-component projects** like your Commbase system, which includes Bash routines, a Flask API, and web interfaces.

---

## 🗂️ Recommended Structure

```
commbase/
├── CHANGELOG.md                # Global changelog (summary across all components)
├── client/
│   ├── index.html
│   ├── CHANGELOG.md            # Frontend/UI-specific changelog
├── server/
│   ├── app.py
│   ├── CHANGELOG.md            # API / backend-specific changelog
├── routines/
│   ├── libcommbase/
│   ├── CHANGELOG.md            # Bash routines changelog
└── README.md
```

---

## 📘 1. Root `CHANGELOG.md` (global summary)

This one highlights **system-wide milestones**, version numbers, and integration events.

Example:

markdown file:

# Changelog – Commbase System

All notable cross-component changes are documented here.
Each submodule has its own detailed changelog for internal changes.

---

## [1.4.0+build20251111] – 2025-11-11
### Summary
- Unified API endpoint across Bash and Flask components.
- Improved communication between client and server via HTTP mode.
- Internal pre-release build for staging.

### Components Updated
- client: v1.3.0 → v1.4.0
- server: v1.2.5 → v1.3.0
- routines: v1.0.8 → v1.1.0

end of file.

---

## 🧩 2. Example Component `CHANGELOG.md`

Each submodule keeps its **own independent log**, focusing only on its domain.

### `server/CHANGELOG.md`

markdown file

# Changelog – Commbase Server (Flask API)

## [1.3.0] – 2025-11-11
### Added
- New `/exec` route supports Python and Bash functions.
- Integrated logging middleware for API requests.

### Changed
- Refactored Flask blueprint registration for modularity.

### Fixed
- Resolved permission issue when invoking routines from Flask.

---

## [1.2.5] – 2025-10-30
### Fixed
- Timeout issue in POST requests.

end of file.

### `routines/CHANGELOG.md`

markdown file:

# Changelog – Commbase Routines (Bash library)

## [1.1.0] – 2025-11-11
### Added
- Added new `http_server.sh` for unified API communication.

### Changed
- Updated echo outputs for consistent JSON responses.

End of file.

---

## 🧭 Benefits of This Hybrid Structure

| Feature                  | Description                                                                            |
| ------------------------ | -------------------------------------------------------------------------------------- |
| 🔍 **Traceability**      | Each module can evolve at its own pace with version tags like `server-v1.3.0`          |
| 🧱 **Modularity**        | Ideal for projects that combine multiple languages or runtimes (Bash + Flask + HTML)   |
| 🪶 **Clarity**           | The root changelog gives management-level context; sublogs give developer-level detail |
| 🔗 **Integration-ready** | CI/CD pipelines can automatically reference the root changelog or individual ones      |

---

## 💡 Optional Automation Idea

You can later automate changelog aggregation by running a simple script that merges all submodule changelogs into the root one before tagging a global build:

```bash
python tools/merge_changelogs.py > CHANGELOG.md
```

That script can:

* Read each `*/CHANGELOG.md`
* Extract the latest version sections
* Merge them under a unified timestamped header

---

## How to tag previous commits?

You can **tag any past commit** in Git, not just the most recent one.

Tags are just **labels attached to specific commit hashes**, so you can place them wherever you want in your project history.

---

### 🧭 Basic example

Let’s say you want to tag a commit from a week ago.

1. **Find the commit hash:**

   ```bash
   git log --oneline
   ```

   Example output:

   ```
   a8f9b17 Fix API timeout
   3f1c2e4 Add new Flask route
   7d5e0b1 Merge client improvements
   ```

   Suppose you want to tag `3f1c2e4`.

2. **Create an annotated tag for that commit:**

   ```bash
   git tag -a v1.3.0 -m "Version 1.3.0 – Added new Flask route" 3f1c2e4
   ```

3. **Push the tag to the remote:**

   ```bash
   git push origin v1.3.0
   ```

That’s it — now your `v1.3.0` tag points to that older commit.

---

### 🧾 Notes

* You can tag **multiple older commits** this way (for example, to retroactively version your history).
* To see which commit a tag points to:

  ```bash
  git show v1.3.0
  ```
* If you want to tag locally but **not push** it (e.g., internal use only), just skip the `git push` step.
* You can later rename or move a tag:

  ```bash
  git tag -d v1.3.0        # delete local tag
  git push origin :v1.3.0  # delete remote tag
  git tag -a v1.3.0 7d5e0b1 -m "Corrected tag location"
  git push origin v1.3.0
  ```

---

### 💡 Tip

When tagging previous commits for documentation or changelogs:

* Use the **date of the original commit** in the changelog entry, not the day you created the tag.
* You can even use SemVer with build metadata for older milestones:

  ```bash
  git tag -a v1.2.0+build20250915 -m "Internal milestone from Sep 15, 2025" <commit>
  ```

## A quick workflow to retroactively tag multiple past commits and build a matching CHANGELOG

A quick workflow to retroactively tag multiple past commits (e.g., v1.0.0, v1.1.0, v1.2.0) and build a matching CHANGELOG.md

Here’s a clean, step-by-step workflow to **retroactively tag past commits** and automatically generate a matching `CHANGELOG.md`.
This is great when you’ve already made several milestones but didn’t tag them at the time.

---

## 🧭 1. Identify past commits

List your history in a compact form:

```bash
git log --oneline
```

Example output:

```
d53c4a1 Add new HTTP interface for routines
a4b7c3f Flask API executes Bash functions
d1a6e0b Improve logging format
5e2f11c Initial project structure
```

---

## 🏷️ 2. Tag the key milestones

Let’s say you want to tag these:

| Commit    | Tag                    | Description                            |
| --------- | ---------------------- | -------------------------------------- |
| `5e2f11c` | `v1.0.0`               | First functional release               |
| `a4b7c3f` | `v1.1.0`               | API now runs Bash routines             |
| `d53c4a1` | `v1.2.0+build20251111` | Internal build with new HTTP interface |

Commands:

```bash
git tag -a v1.0.0 -m "Initial functional release" 5e2f11c
git tag -a v1.1.0 -m "Added Flask API to run Bash routines" a4b7c3f
git tag -a v1.2.0+build20251111 -m "Internal build with new HTTP interface" d53c4a1
```

Push them (optional):

```bash
git push origin --tags
```

---

## 🧾 3. Generate or update your `CHANGELOG.md`

Create one in your project root if it doesn’t exist:

```bash
touch CHANGELOG.md
```

Then fill it manually or generate automatically with commit messages between tags.

---

### 🧰 Option A – Manual (recommended for clarity)

```markdown
# Changelog

## [1.2.0+build20251111] – 2025-11-11
- Internal build with new HTTP interface for routines.

## [1.1.0] – 2025-10-20
- Added Flask API for executing Bash functions.

## [1.0.0] – 2025-09-01
- Initial functional release with core Bash library.
```

---

### ⚙️ Option B – Automatic from Git logs

Quick command to collect changes between tags:

```bash
git log --pretty=format:"- %s" v1.1.0..v1.2.0+build20251111 > tmp.log
```

You can repeat that for each range (for example, `v1.0.0..v1.1.0`)
and paste it under the correct section in your changelog.

---

### 🧩 Tip: Script it once

You can make a helper script (e.g., `tools/update_changelog.sh`):

```bash
#!/bin/bash
TAGS=($(git tag --sort=-creatordate))
echo "# Changelog" > CHANGELOG.md
for ((i=0; i<${#TAGS[@]}-1; i++)); do
  CUR=${TAGS[$i]}
  PRE=${TAGS[$i+1]}
  echo -e "\n## [$CUR]" >> CHANGELOG.md
  git log --pretty=format:"- %s" $PRE..$CUR >> CHANGELOG.md
  echo -e "\n" >> CHANGELOG.md
done
```

Run it any time to rebuild your changelog from tag history.

---

## ✅ Summary

| Step | Action                                                    |
| ---- | --------------------------------------------------------- |
| 1️⃣  | Find the commit hashes you want to mark                   |
| 2️⃣  | Use `git tag -a` with the commit hash                     |
| 3️⃣  | Optionally push tags to remote                            |
| 4️⃣  | Document changes in `CHANGELOG.md` manually or via script |

---

Would you like me to adapt that Bash script to include **dates and SemVer build metadata** (like `+build20251111`) automatically when creating the changelog entries?

## Adapt the previous Bash script to include dates and SemVer build metadata automatically when creating the changelog entries

Adapt the Bash script to include dates and SemVer build metadata (like +build20251111) automatically when creating the changelog entries.

Here’s a ready-to-use **Bash script** that automatically builds a `CHANGELOG.md` by reading all your Git tags (including Semantic Versioning with build metadata like `+build20251111`), grouping commits between versions, and adding **dates** automatically.

It’s designed to be dropped into your repository under a folder like `tools/`.

---

### 🧩 **`tools/update_changelog.sh`**

```bash
#!/bin/bash
# ----------------------------------------------
# Generate CHANGELOG.md automatically from Git tags
# Supports Semantic Versioning + build metadata
# ----------------------------------------------

OUTFILE="CHANGELOG.md"

echo "# Changelog" > "$OUTFILE"
echo "All notable changes to this project are documented in this file." >> "$OUTFILE"
echo "" >> "$OUTFILE"

# Sort tags by creation date (oldest first)
TAGS=($(git tag --sort=creatordate))

# If no tags, exit
if [ ${#TAGS[@]} -eq 0 ]; then
  echo "No tags found. Please tag at least one commit first."
  exit 1
fi

# Loop through tags in reverse (latest first)
for ((i=${#TAGS[@]}-1; i>=0; i--)); do
  CUR=${TAGS[$i]}
  PREV_INDEX=$((i-1))

  # Get tag date (the date the commit was created)
  TAG_DATE=$(git log -1 --format=%ad --date=short "$CUR")

  echo "## [$CUR] – $TAG_DATE" >> "$OUTFILE"

  if [ $PREV_INDEX -ge 0 ]; then
    PREV=${TAGS[$PREV_INDEX]}
    git log --pretty=format:"- %s" "$PREV..$CUR" >> "$OUTFILE"
  else
    # First tag — show all commits up to it
    git log --pretty=format:"- %s" "$CUR" >> "$OUTFILE"
  fi

  echo -e "\n" >> "$OUTFILE"
done

echo "✅ Changelog generated in $OUTFILE"
```

---

### 🧭 How to Use It

1. Save it as:

   ```
   tools/update_changelog.sh
   ```
2. Make it executable:

   ```bash
   chmod +x tools/update_changelog.sh
   ```
3. Run it from the root of your repository:

   ```bash
   ./tools/update_changelog.sh
   ```
4. It will create or overwrite `CHANGELOG.md` in your root directory, formatted like this:

markdown file:

# Changelog
All notable changes to this project are documented in this file.

## [v1.2.0+build20251111] – 2025-11-11
- Add new HTTP interface for routines
- Improve error handling in Bash calls

## [v1.1.0] – 2025-10-20
- Added Flask API for executing Bash functions
- Added logging middleware

## [v1.0.0] – 2025-09-01
- Initial functional release

End of file.

---

### ⚙️ Optional Enhancements

You can expand it to:

* Include commit **authors** (`--pretty=format:"- %s (%an)"`)
* Filter out merge commits (`--no-merges`)
* Append to an existing changelog instead of overwriting

---

## Expand the changelog generator to filter out merge commits (--no-merges)

Excellent — here’s your improved version of the changelog generator, now filtering out **merge commits** (so it only lists meaningful changes).
Everything else works the same — it still supports Semantic Versioning tags, build metadata (`+build20251111`), and automatic date generation.

---

### 🧩 **`tools/update_changelog.sh`**

```bash
#!/bin/bash
# ------------------------------------------------------------
# Auto-generate CHANGELOG.md from Git tags
# Filters out merge commits (--no-merges)
# Supports Semantic Versioning + build metadata
# ------------------------------------------------------------

OUTFILE="CHANGELOG.md"

echo "# Changelog" > "$OUTFILE"
echo "All notable changes to this project are documented in this file." >> "$OUTFILE"
echo "" >> "$OUTFILE"

# Collect tags sorted by creation date (oldest first)
TAGS=($(git tag --sort=creatordate))

# If there are no tags, stop
if [ ${#TAGS[@]} -eq 0 ]; then
  echo "No tags found. Please create at least one tag first."
  exit 1
fi

# Loop through tags from newest to oldest
for ((i=${#TAGS[@]}-1; i>=0; i--)); do
  CUR=${TAGS[$i]}
  PREV_INDEX=$((i-1))

  # Get commit date for this tag
  TAG_DATE=$(git log -1 --format=%ad --date=short "$CUR")

  echo "## [$CUR] – $TAG_DATE" >> "$OUTFILE"

  if [ $PREV_INDEX -ge 0 ]; then
    PREV=${TAGS[$PREV_INDEX]}
    # List commits between this tag and the previous one, excluding merges
    git log --no-merges --pretty=format:"- %s" "$PREV..$CUR" >> "$OUTFILE"
  else
    # For the very first tag, show all commits up to it
    git log --no-merges --pretty=format:"- %s" "$CUR" >> "$OUTFILE"
  fi

  echo -e "\n" >> "$OUTFILE"
done

echo "✅ Changelog generated successfully at $OUTFILE"
```

---

### 🧭 How to Use It

1. Save it to your repo, e.g.:

   ```
   tools/update_changelog.sh
   ```

2. Make it executable:

   ```bash
   chmod +x tools/update_changelog.sh
   ```

3. Run from your project root:

   ```bash
   ./tools/update_changelog.sh
   ```

---

### 📘 Example Output

markdown file:

# Changelog
All notable changes to this project are documented in this file.

## [v1.2.0+build20251111] – 2025-11-11
- Add new HTTP interface for routines
- Improve error handling in Bash calls

## [v1.1.0] – 2025-10-20
- Added Flask API for executing Bash functions
- Added logging middleware

## [v1.0.0] – 2025-09-01
- Initial functional release

End of file.

Merge commits like `Merge branch 'feature/api' into main` will **not** appear in this changelog — keeping it concise and human-friendly.
