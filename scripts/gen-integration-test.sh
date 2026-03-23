#!/bin/bash

STAGED_FILES=$(git diff --cached --name-only)

for FILE in $STAGED_FILES; do
    echo "Analyzing dependencies for $FILE..."
    
    CONTEXT=$(grep -E "public|protected|private|import" "$FILE")

    gemini ask "
    Based on this class context:
    $CONTEXT
    
    Generate a Mockito-based Integration Test.
    Rules:
    - Respect Liferay Dependency Injection patterns.
    - Mock all external services.
    - Focus on validating the logic of the modified methods.
    " > "src/test/java/${FILE#src/main/java/}Test.java"
done
