# Restoring an old version of a file

## Restore

```shell
git checkout -- filename
```

## To revert to a version from a specific commit:

You could want to come back to the last commit if you forget to checkout a specific file, which would lead you to get the blocking message:

```output
HEAD detached from 1530afc
nothing to commit, working tree clean
```

For more information, check out the topic:  
HEAD detached from HASH - nothing to commit, working tree clean

First of all, copy the last commit hash, so you will be able to come back to the current repo state:

```shell
git log
```

And to revert the file state:

```shell
git checkout dc9d8fac mental_health_survey.csv
```

In case that this was the second to last commit, another approach is:

```shell
git checkout HEAD~1 mental_health_survey.csv
```
