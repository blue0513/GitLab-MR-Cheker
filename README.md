# GitLab-MR-Checker

Get MR Titles which You are assigned to !

## How It Works

WIP

## Quick Start on Terminal

#### 1. Fill the variables in `gitlab-mr-from-commit`

```sh
# Get it from gitlab
# See: https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html
PRIVATE_TOKEN='[YOUR PRIVATE TOKEN]'

# Get it from your project's setting page
# On the Edit Project page in GitLab, there is a Project ID field in the top right corner.
PROJECT_ID='[YOUR PROJECT ID]'

# It should be like `https://gitlab.com`
PROJECT_BASE_URL='[YOUR PROJECT BASE URL]'

# Directory should be `my-project/product1`
PROJECT_DIRECTORY='[YOUR PROJECT DIRECTORY]'
```

#### 2. Set the PATH

```sh
# In your .bashrc or .zshrc or so
# Set the PATH as bellow
export PATH="$HOME/gitlab-mr-from-commit:$PATH"
```

#### 3. Execute!!

```sh
# It will show MR Titles
$ gitlab-mr-check
```

## Start on Emacs

WIP
