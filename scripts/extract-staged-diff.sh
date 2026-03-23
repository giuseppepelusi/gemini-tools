#!/bin/bash

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR | grep ".java")

if [ -z "$STAGED_FILES" ]; then
    echo "No staged Java files found."
    exit 1
fi

DIFF_FILE="staged_changes.diff"
git diff --cached > "$DIFF_FILE"

echo "Staged changes extracted to $DIFF_FILE"
