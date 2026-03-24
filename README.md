## gemini-tools setup

### 1. Copy rules to Liferay Portal

```bash
# Clone this repository
git clone git@github.com:giuseppepelusi/gemini-tools.git

# Move into it
cd gemini-tools

# Replace [path-to-portal] with your actual liferay-portal directory path
cp rules/GEMINI.md [path-to-portal]/GEMINI.md
```

### 2. Configure global Git ignore

```bash
# Create the global ignore file if it does not exist
touch ~/.gitignore_global

# Add AI tools and temporary context files to the ignore list
echo "GEMINI.md" >> ~/.gitignore_global
echo "TICKET_CONTEXT.md" >> ~/.gitignore_global
echo "scripts/" >> ~/.gitignore_global

# Tell Git to use this file globally
git config --global core.excludesfile ~/.gitignore_global
```