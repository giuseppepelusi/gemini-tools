#!/bin/bash

# Script to automate Liferay-standardized commits
# Usage: ./scripts/commit.sh <TICKET-ID> <Message>

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Insufficient arguments."
    echo "Usage: ./scripts/commit.sh <TICKET-ID> \"<Commit Message>\""
    exit 1
fi

TICKET_ID=$1
SHIFT_MSG="$2"

# Ensure the message follows the protocol: <TICKET-ID> <Message> (No colons)
FORMATTED_MSG="$TICKET_ID $SHIFT_MSG"

echo "Attempting commit with message: $FORMATTED_MSG"

# Standard git check before committing
git status

# Commit
git commit -m "$FORMATTED_MSG"
