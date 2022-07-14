# dotfiles
my new dotfiles using chezmoi

## Applications
Dotfile Manager: Chezmoi
Shell: zsh
Shell prompt: Spaceship ZSH with Fire Code font
Editor: Neovim

## Keybinds
To list zsh keymap names use `bindkey -l`
To list the bindings use `bindkey -M <keymap>`

use the neovim plugin which key
```
:WhichKey " show all mappings
:WhichKey <leader> " show all <leader> mappings
:WhichKey <leader> v " show all <leader> mappings for VISUAL mode
:WhichKey '' v " show ALL mappings for VISUAL mode
:WhichKey <leader>f show all mappings for leader followed by f
```

## Neovim Help

FzfLua <tab> provides a list of helpfull fzf functions e.g. `FzfLua help_tags`.

## LSP
To add new lsp server use `:LspInstall`
After adding an lsp server go to `$HOME/.config/nvim/lsp/lua/lsp.lua` and add the lanuage server setup.


## Windows Terminal Session Management
function is .zshrc file

```
wts **<tab>
wts-edit **<tab>
wts-new name_of_session
```
