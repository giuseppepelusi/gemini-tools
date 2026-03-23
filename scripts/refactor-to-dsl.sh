#!/bin/bash

DIFF_CONTENT=$(git diff --cached)

gemini ask "
Act as a Liferay Engineering Assistant. 
Analyze the following Java code changes:
$DIFF_CONTENT

Task:
1. Identify any legacy SQL query strings.
2. Convert them to Liferay DSLQuery technology.
3. CRITICAL: Do not change any method signatures.
4. Output only the refactored code block.
" --temperature 0.2 
