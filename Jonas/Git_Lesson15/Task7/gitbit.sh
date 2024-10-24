#!/bin/bash

# Check if a commit message is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <commit-message>"
  exit 1
fi

# Define variables
COMMIT_MESSAGE=$1
FEATURE_BRANCH="feature-branch-$(date +%Y%m%d%H%M%S)"

# Pull the latest code from the main branch
git checkout main
git pull origin main

# Create a new feature branch
echo "Creating a new branch: $FEATURE_BRANCH"
git checkout -b $FEATURE_BRANCH

# Add a new file (for demo purposes)
NEW_FILE="newfile.txt"
echo "This is a new file created in $FEATURE_BRANCH" > $NEW_FILE
git add $NEW_FILE

# Commit the changes with the provided message
git commit -m "$COMMIT_MESSAGE"

# Switch back to the main branch and merge the new feature branch
git checkout main
git merge $FEATURE_BRANCH

# Push the main branch to the remote
git push origin main

# Optionally delete the feature branch (both locally and remotely)
git branch -d $FEATURE_BRANCH
echo "Merged and deleted $FEATURE_BRANCH locally"
