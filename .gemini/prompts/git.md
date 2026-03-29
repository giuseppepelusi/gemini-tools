# Git Standards & Toolchain

## Commit Message Protocol
Format messages as `<TICKET-ID> <Minimal Description>` (e.g., `LPD-79040 Fix`). 
*   **NO** colons (:) after the ticket number. 
*   Exactly **ONE** space between the ticket number and the message. 
*   Keep the description as concise as possible.

## Git Hygiene
*   Always use `git status` and `git diff` to verify changes before staging.
*   **CRITICAL**: Never add `TICKET_CONTEXT.md` or `GEMINI.md` to a git commit.
*   Do not stage or commit your changes unless explicitly instructed to commit.

## Tooling
*   **Mandatory Plan Mode**: For any new application or architectural change, use `enter_plan_mode` to obtain design approval before execution.
