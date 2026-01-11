---
name: generating-commit-messages
description: Generates clear commit messages from git diffs. Use when writing commit messages or reviewing staged changes.
---

# Generating Commit Messages

## Instructions

1. Run `git diff --staged` to see changes
2. I'll suggest a commit message with:
   - Summary under 50 characters
   - Detailed description
   - Affected components

## Best practices

- Use present tense
- Explain what and why, not how
- use “Conventional Commits” style from Angularjs as below
```
<type>(<scope>): <subject>
<空行>
<body>
<空行>
<footer>
```

## Examples
```
feat(auth): 增加微信第三方登录功能

通过 OAuth2.0 接口实现用户微信授权登录。

Closes #123
```