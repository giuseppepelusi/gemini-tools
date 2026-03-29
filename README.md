## Setup AI Tools

### 1. Clone the Toolset
First, clone this repository to your local machine:

```bash
git clone git@github.com:giuseppepelusi/gemini-tools.git
cd gemini-tools
```
### 2. Install to your Project
Run the following command from within the gemini-tools directory, replacing /path/to/your-target-project with the actual path to the repository where you want to use the AI tools:

```bash
# This copies the rulesets and the entry point to your project
cp -r .gemini GEMINI.md /path/to/your-target-project/
```

## Structure

- **`GEMINI.md`**: Root entry point. Uses `@` syntax to import all prompt rulesets.
- **`.gemini/prompts/`**:
    - `architecture.md`: Core Liferay & OSGi engineering standards.
    - `testing.md`: Strict protocol for generating reproduction tests.
    - `git.md`: Git hygiene and commit message standards.
    - `workflow.md`: Ticket lifecycle automation rules.
- **`.gemini/scripts/`**: Automation helpers.
    - `setup-ticket.sh`: Branch and context initialization.
    - `commit.sh`: Standardized Liferay commit helper.

## Usage

When starting a new task, tell Gemini:
> "Research ticket LPD-XXXXX and initialize the workspace."

Gemini will automatically follow the defined workflow to create branches, initialize context, and enforce engineering standards during implementation.
