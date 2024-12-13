# zsh

Z shell

> Default behavior dictates the following order for ZSH startup files:
> 
> - `/etc/zshenv`
> - `~/.zshenv`
> - `/etc/zprofile` (if login shell)
> - `~/.zprofile`   (if login shell)
> - `/etc/zshrc`    (if interactive)
> - `~/.zshrc`      (if interactive)
> - `/etc/zlogin`   (if login shell)
> - `~/.zlogin`     (if login shell)
> 
> **Notes:**
> 
> - `zshenv` is the place to set *env*ironment variables
> - `zshrc` is the place for aliases, functions etc
>
> Setting environment variables in `zshenv` means that they'll be present for
> non-interactive uses (think cron commands). This is what you want.
>
> [Reference](https://gist.githubusercontent.com/pbrisbin/45654dc74787c18e858c/raw/191700523521f8579453a3e00476ed3c14a24354/headache.md)
