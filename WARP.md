# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This repository contains curated configuration files for a modern command-line environment, focusing on shell customization and terminal tools. It's organized by tool type with each directory containing configuration files and setup instructions.

## Architecture and Structure

### Organization Pattern
- Each tool has its own directory containing:
  - Configuration files (e.g., `kitty.conf`, `.zshrc`, `starship.toml`)
  - `README.md` with setup instructions and tool-specific notes
  - Additional resources (fonts, themes, scripts)

### Key Components

#### Shell Environment (zsh/)
- **`.zshrc`**: Main shell configuration with aliases, key bindings, and tool integrations
- **`.zshenv`**: Environment variables (minimal, primarily Rust/Cargo setup)
- Modern replacements for core commands: `eza` for `ls`, `bat` for `cat`, `zoxide` for `cd`
- History management with extensive configuration for shared history and deduplication

#### Terminal Emulator (kitty/)
- **`kitty.conf`**: Terminal configuration with Fragment Mono font, color scheme, and window management
- Custom fonts included: `FragmentMono-Regular.ttf` and `FragmentMono-Italic.ttf`
- Optimized for development with proper margins and tab styling

#### Prompt (starship/)
- **`starship.toml`**: Complex multi-segment prompt configuration
- Shows shell indicator, directory, Git status, language versions (Node.js, Python, Rust, Go, PHP)
- Custom Perforce integration for enterprise environments
- Color-coded segments with powerline-style transitions

#### File Management (ranger/)
- Console file manager with vim-like keybindings
- Configured for kitty terminal integration
- Includes custom `scope.sh` for file preview functionality

#### Enhanced Tools Integration
- **fzf**: Fuzzy finder with custom key bindings and completion
- **eza**: Modern `ls` replacement with Git integration and icons
- **bat**: Syntax-highlighted `cat` replacement
- **zoxide**: Smart directory jumper replacing `cd`
- **delta**: Enhanced Git diff viewer

## Common Development Tasks

### Setting Up the Environment
```bash
# Each tool directory contains setup instructions
# Generally involves copying config files to appropriate locations:
# kitty config -> ~/.config/kitty/
# zsh configs -> ~/
# starship config -> ~/.config/
# fzf configs -> ~/.config/fzf/
```

### Managing Configurations
```bash
# View current shell aliases and functions
alias
function

# Reload zsh configuration
source ~/.zshrc

# Test starship prompt
starship config

# Preview files with enhanced tools
bat filename           # syntax-highlighted cat
eza -la               # enhanced ls with Git status
fvim                  # fuzzy find and edit with vim
```

### Tool-Specific Commands
```bash
# File navigation
z <directory>         # smart cd with zoxide
ranger               # console file manager

# Git integration
delta <file>         # enhanced diff viewing
# Git status integrated into eza and starship prompt

# History and search
# fzf integration for command history (Ctrl+R)
# Atuin for magical shell history (if installed)
```

## Configuration Dependencies

### Required Tools
The configurations assume these tools are installed:
- `zsh` as the shell
- `starship` for prompt
- `eza`, `bat`, `zoxide`, `fzf` for enhanced commands
- `kitty` terminal emulator
- `ranger` file manager
- `delta` for Git diffs

### Optional Integrations
- `pyenv` for Python version management (configured in `.zshrc`)
- `juliaup` for Julia language support
- Custom corporate proxy settings for Go development
- Perforce integration in starship prompt

## Important Notes

- The `.zshrc` contains extensive history configuration and key bindings
- VI mode is enabled in zsh (`bindkey -v` at end of `.zshrc`)
- Corporate environment adaptations present (Go proxy, Perforce integration)
- Font dependencies: Fragment Mono font files included for kitty
- Color schemes and themes are carefully coordinated across tools
- SSH context detection for editor selection (vim for SSH, code for local)

## File Relationships

- `zsh/.zshrc` sources `fzf` configs and initializes `zoxide`
- `kitty/kitty.conf` references Fragment Mono fonts in the same directory
- `starship/starship.toml` includes custom Perforce module for enterprise use
- `ranger/scope.sh` handles file preview integration with kitty terminal
- All tools share consistent color schemes and visual styling
