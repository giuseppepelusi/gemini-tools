#!/bin/bash

# Script to automate Liferay ticket setup
# Usage: ./scripts/setup-ticket.sh <TICKET-ID>

if [ -z "$1" ]; then
    echo "Error: No Ticket ID provided."
    echo "Usage: ./scripts/setup-ticket.sh <TICKET-ID>"
    exit 1
fi

TICKET_ID=$1

echo "Initializing environment for ticket: $TICKET_ID"

# 1. Create local branch
git checkout -b "$TICKET_ID"

# 2. Generate TICKET_CONTEXT.md template
cat <<EOF > TICKET_CONTEXT.md
# Ticket Context: $TICKET_ID

## Summary
(Fetch ticket details using Gemini Atlassian extension)

## Technical Analysis
(Perform codebase research and add analysis here)

## Affected Files
- 

## Verification Plan
- [ ] Integration Test created/updated
- [ ] DSLQuery conversion verified
EOF

echo "Success:"
echo " - Branch '$TICKET_ID' created."
echo " - 'TICKET_CONTEXT.md' generated."
echo "IMPORTANT: Do NOT commit TICKET_CONTEXT.md."
