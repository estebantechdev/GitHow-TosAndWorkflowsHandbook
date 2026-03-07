# Following The Spirit Of Semantic Versioning

## Content

[Why Developers Tag Versions](#why-developers-tag-versions)  

[Semantic Versioning: Structure Of The Version Number](#semantic-versioning-structure-of-the-version-number)

[First Versioning Approach](#first-versioning-approach)

[Second Versioning Approach](#second-versioning-approach)

[Versioning at API-breaking Changes](#versioning-at-api-breaking-changes)

## Why Developers Tag Versions

Tagging versions (for example in Git) helps to:

- Mark important milestones

- Create reproducible builds

- Reference specific states of the code

- Make it easier for users to download a stable snapshot

## Semantic Versioning: Structure Of The Version Number

Semantic version numbers use the format:

`MAJOR.MINOR.PATCH`

## First Versioning Approach

The following sequence (proggresion) fits well with Semantic Versioning. It is a common and reasonable interpretation of how versions evolve before a stable release.

| Version   | Typical meaning                                                                       |
| --------- | ------------------------------------------------------------------------------------- |
| **0.0.1** | First tagged snapshot of the project. Earliest experimental version. Early prototype. |
| **0.0.2** | Small fixes or adjustments. Early development but somewhat usable.                    |
| **0.1.0** | First release with usable features. First feature release.                            |
| **0.2.0** | Additional features added                                                             |
| **0.5.0** | Growing project                                                                       |
| **0.9.0** | Near stable                                                                           |
| **1.0.0** | First stable public **release**                                                       |

### Version 0.0.1

In 0.0.1:

- 0 (MAJOR) → The project is not yet stable. Breaking changes are expected.

- 0 (MINOR) → No feature releases yet.

- 1 (PATCH) → First small change or first recorded revision.

Tagging a project with version 0.0.1 means you are marking a very early version of the software in its development history. This tag usually follows the conventions of semantic versioning (often called Semantic Versioning).

### What 0.0.1 Typically Signals

Developers usually use this version to indicate:

The first tracked version of the project.

The project is experimental or under initial development.

The API and features are not stable.

It may only be intended for internal testing or early commits.

### Meaning Of 0.0.1

0.x.x versions indicate that the software is initial development.

Specifically:

- The project is unstable

- Anything can change at any time

- There is no guarantee of backward compatibility

- It is usually experimental or internal

- So 0.0.1 typically means:  
  “This is the very first version of the project and it is still highly experimental.”

### Version 0.1.0

Under Semantic Versioning, 0.1.0 is not equivalent to 1.0.0.

### Meaning Of 0.1.0

Version 0.1.0 typically indicates:

- The project is still in early development

- Features may exist and the software may be usable

- Breaking changes can still happen at any time

- Stability is not guaranteed

It often represents the first feature release after initial prototypes.

### Version 1.0.0

You can absolutely use 1.0.0 as the first stable public release even if your project does not have an API.

The rules from Semantic Versioning are often explained using APIs, but they actually apply to any software project (CLI tools, libraries, websites, scripts, desktop apps, etc.).

### What 1.0.0 Means In General

Version 1.0.0 simply indicates:

- The software is stable. The project has reached a stable release.

- The core functionality is complete. Behavior is expected to remain consistent.

- You consider the project ready for public use. The functionality is considered complete enough for public use.

- Future breaking changes will increase the MAJOR version. Breaking changes will require a major version increase (e.g., 2.0.0).

So for a project without an API, the meaning becomes:

| Version change    | Meaning                                                           |
| ----------------- | ----------------------------------------------------------------- |
| **PATCH (1.0.1)** | Bug fixes.                                                        |
| **MINOR (1.1.0)** | New features added but existing behavior still works.             |
| **MAJOR (2.0.0)** | Breaking changes to behavior, structure, CLI flags, configs, etc. |

Example (CLI or tool project):

```bash
0.0.1  initial prototype
0.1.0  basic functionality works
0.5.0  more features added
0.9.0  nearly complete
1.0.0  first stable public release
```

### APIs In Semantic Versioning

An important semantic versioning principle is:

Major version 0 means the public API should not be considered stable.

✅ Simple rule:

Before 1.0.0 → anything can break

After 1.0.0 → only major versions break the API

Even **if your project does not have a formal API**, the same idea applies to its behavior, commands, configuration, or outputs.

### What Counts As A Breaking Change Without An API

Even without an API, breaking changes can include things like:

- Changing command-line options

- Changing configuration file format

- Changing output format

- Removing features

- Changing expected inputs or behavior

## Second Versioning Approach

You can make a public release of version 0.2.0 while still following Semantic Versioning.

### What a public 0.2.0 release means

A public release with a 0.x version typically means:

- The software is available to users

- The project is still under active development

- Breaking changes may still occur

- The interface or behavior is not yet guaranteed to stay stable

Many projects publish several 0.x public releases before reaching 1.0.0.

### Example progression with public releases

A project might evolve like this:

```
0.1.0  first public preview
0.2.0  more features added
0.3.0  improvements and refactoring
0.9.0  nearly stable
1.0.0  first stable release
```

### Real-world practice

It is extremely common for open-source projects on platforms like GitHub to publish many 0.x releases publicly so users can:

- Test features

- Report bugs

- Give feedback

### Key idea

1.0.0 is not required for something to be public.

✅ Public release simply means the software is available to users.
1.0.0 means the developers consider the software stable.

So releasing 0.2.0 publicly is completely normal.

## Versioning at API-breaking Changes

| Change type | Version example | Meaning                                       |
| ----------- | --------------- | --------------------------------------------- |
| **PATCH**   | `1.0.1`         | Bug fixes only — no API changes               |
| **MINOR**   | `1.1.0`         | New features added — existing API still works |
| **MAJOR**   | `2.0.0`         | **Breaking API changes allowed**              |

So API-breaking behavior occurs when the MAJOR number increases:

1.x.x → 2.0.0

2.x.x → 3.0.0

### Important Exception: Versions 0.x.x (Second Versioning Approach)

Before 1.0.0, semantic versioning states that the project is unstable. That means:

Any version change may break the API

Even a patch change can introduce breaking changes

Example:

0.1.0 → 0.1.1   (could break API)

0.1.0 → 0.2.0   (could break API)
