# delta

[delta](https://github.com/dandavison/delta) is a syntax-highlighting pager for git, diff, grep, and blame output.

- Installation via package manager
- Configure `git` for usage with delta:

```zsh
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
```

- Add delta configuration to `.gitconfig` file

```toml
[delta]
    navigate = true
    side-by-side = true
    line-numbers = true
```
