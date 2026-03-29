# Liferay Workflow Automation Protocol

When a Jira ticket ID (e.g., "LPD-12345") is provided, follow this lifecycle:

1. **Research & Context Retrieval**:
    * Fetch ticket details (Summary, Description, AC) using the Atlassian extension.
    * Research the codebase to identify the root cause or feature entry point.
2. **Branch Management**:
    * Create a local branch: `git checkout -b <TICKET-ID>`.
3. **Context Initialization**:
    * Generate `TICKET_CONTEXT.md` in the branch root. 
    * Include: Ticket summary, technical analysis, and the list of Java files to modify.
    * **CRITICAL**: Never add `TICKET_CONTEXT.md` or `GEMINI.md` to a git commit.
4. **Implementation & Validation**:
    * Apply changes locally following Liferay standards (see `LIFERAY.md`).
    * Create/Update Integration Tests to verify the fix/feature.
    * **Constraint**: Keep all work local. Do not push to remote or update Jira statuses unless explicitly instructed.
