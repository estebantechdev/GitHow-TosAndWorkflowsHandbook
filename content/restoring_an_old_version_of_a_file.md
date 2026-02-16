# Restoring an old version of a file

git checkout -- filename

To revert to a version from a specific commit:
git checkout dc9d8fac mental_health_survey.csv

This was the second to last commit, so another approach is:
git checkout HEAD~1 mental_health_survey.csv
