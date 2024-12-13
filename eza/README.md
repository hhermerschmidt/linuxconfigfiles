# eza

A modern replacement for `ls`

- Copy theme file to `~/.config/eza`
- Add aliases to `zshrc`:

```zsh
# ~/.zshrc

alias ls='eza'
alias l='eza -lbF --git --icons=auto --no-user --no-permissions'
alias ll='eza -lbF --git --icons=auto'
alias la='eza -lbaF --git --color-scale --icons=auto'
```
