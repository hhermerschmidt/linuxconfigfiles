# fzf

A general purpose command-line fuzzy finder

- Copy config files (`completion.zsh`, `key-bindings.zsh`) to `~/.config/fzf`
- Source config files via `zshrc`:

```zsh
# ~/.zshrc

source ~/.config/fzf/key-bindings.zsh
source ~/.config/fzf/completion.zsh
```

- Enable preview using `vim`:

```zsh
# ~/.zshrc

alias  fvim='vim $(fzf --preview="bat --color=always --theme=OneHalfDark --style=numbers {}")'
```
