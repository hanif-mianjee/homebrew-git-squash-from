# git-squash-from

A CLI tool to interactively squash Git commits with smart message formatting.

## Features

- 🎯 **Interactive commit selection** - Choose which commit to squash into
- 📝 **Custom commit messages** - Optionally provide a custom message or use the selected commit's message
- 🔄 **Preserves commit history** - All squashed commits are listed with their hashes in the final message
- 🌳 **Root commit support** - Can squash all commits including the first one
- 💬 **Multi-line message support** - Preserves line breaks and formatting when squashing already-squashed commits

## Installation

To install the tool using Homebrew, run the following commands:

```bash
brew tap hanif-mianjee/homebrew-git-squash-from
brew install git-squash-from
```

## Usage

### Basic Usage

To squash the last N commits:

```bash
git squash-from <count>
```

Example:
```bash
git squash-from 5 # Displays last 5 commits
```

### Interactive Workflow

1. **Select commits to view:**
   ```
   📜 Select a commit to squash everything into:
   1) a524b8f Fifth commit
   2) ef3798f Fourth commit
   3) 1a6c6d8 Third commit
   4) facfca7 Second commit
   5) cbfcdf1 First commit
   Enter number [1-5]: 3
   ```

2. **Provide custom message (optional):**
   ```
   💬 Enter custom message for squashed commit
      (Press Enter to use: "Third commit")
   Message: OM-1200 Major refactor
   ```
   - Press **Enter** to use the default message
   - Type a **custom message** to use as the first line

3. **Result:**
   
   With custom message:
   ```
   OM-1200 Major refactor
   * 1a6c6d8 Third commit
   * ef3798f Fourth commit
   * a524b8f Fifth commit
   ```
   
   Without custom message (just pressed Enter):
   ```
   Third commit
   * ef3798f Fourth commit
   * a524b8f Fifth commit
   ```

### Squashing from Root

Select the last commit in the list to squash all commits including the root:

```bash
git squash-from 10
# Select option 10 to squash all commits from the beginning
```

## Examples

### Cleaning up feature branch

```bash
# You have 8 commits on your feature branch
git squash-from 8

# Select commit #1 (most recent meaningful commit)
# Add custom message: "feat: implement user authentication"
# Result: One commit with all changes, listing all original commits
```

### Preparing for PR

```bash
# Squash last 5 WIP commits
git squash-from 5

# Select commit #2 (your main feature commit)
# Press Enter to keep its message as the main message
# All commits preserved in the message body with hashes
```

### Re-squashing (Adding commits after a squash)

The tool preserves formatting when squashing already-squashed commits. This allows you to add new commits and re-squash seamlessly.

**Scenario:** You've already squashed commits, then added more work.

```bash
# Initial squash
git squash-from 4
# Selected commit #1, custom message: "feat: user authentication"
# Result:
#   feat: user authentication
#   * a524b8f Initial auth setup
#   * ef3798f Add login form
#   * 1a6c6d8 Add validation

# Later: Add new commits
git commit -m "fix: password validation bug"
git commit -m "docs: update auth docs"

# Re-squash everything together
git squash-from 3
# Select commit #3 (the original squashed commit)
# Result:
#   feat: user authentication
#   * a524b8f Initial auth setup
#   * ef3798f Add login form
#   * 1a6c6d8 Add validation
#   * 9c5f2a1 fix: password validation bug
#   * 7b3e8d4 docs: update auth docs
```

**What happens:**
- ✅ All line breaks and formatting from the previous squash are preserved
- ✅ New commits are appended with their hashes
- ✅ You can add a new custom message or keep the existing one
- ✅ Full commit history is maintained throughout multiple squashes

**Result format:**
```
[Custom message or selected commit message]
* hash1 First squashed commit
* hash2 Second squashed commit
  Additional lines from multi-line commit messages
* hash3 Third squashed commit
* hash4 New commit you just added
* hash5 Another new commit
```

## Publishing a New Version

To publish a new version, follow these steps:

1. Push your changes to the repository.
2. Create a new tag for the version.
3. Update the Homebrew Formula using a command like the following:

   ```bash
   curl -Ls https://github.com/hanif-mianjee/git-squash-from/archive/refs/tags/v0.1.1.tar.gz | shasum -a 256
   ```
