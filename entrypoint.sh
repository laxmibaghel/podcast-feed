#!/bin/bash

echo "****************************************************************"

# Configure Git
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Run the Python script
python3 /usr/bin/feed.py

# Add all changes to the staging area
git add -A

# Check if there are changes to commit
if git diff-index --quiet HEAD; then
  echo "No changes to commit"
else
  git commit -m "Update feed"
  git push --set-upstream origin main
fi

echo "****************************************************************"
