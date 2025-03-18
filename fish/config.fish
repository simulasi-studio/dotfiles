# Disable Fish greeting
set fish_greeting ""

# Set terminal type
set -gx TERM xterm-256color

# Aliases
alias g git
alias z zoxide
command -qv nvim && alias vim nvim

if type -q eza
    alias ll "eza -l -g --icons --header"
    alias lla "ll -a"
    alias llg "eza -l -g --icons --header --git"
    alias lt "eza --tree -l -g --icons --header --git-ignore"
    alias ltg "eza --tree -l -g --icons --header --git --git-ignore"
end

# Editor
set -gx EDITOR nvim

# Add paths
fish_add_path ~/bin ~/.local/bin

# Init starship and zoxide prompt
starship init fish | source
zoxide init fish | source

# atuin
set -gx ATUIN_NOBIND true
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search

set -gx PATH $HOME/.fzf/bin $PATH

# FZF Configuration
#fzf_configure_bindings
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

# Keybindings for FZF
set -g FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window=down:3:hidden:wrap"
set -g FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"

#
# Solarized Osaka Theme
set -Ux fish_color_normal 839395
set -Ux fish_color_command 29a298
set -Ux fish_color_keyword d23681
set -Ux fish_color_quote b28500
set -Ux fish_color_redirection 839395
set -Ux fish_color_end c94c16
set -Ux fish_color_error db302d
set -Ux fish_color_param 6d71c4
set -Ux fish_color_comment 576d74
set -Ux fish_color_selection --background=1a6397
set -Ux fish_color_search_match --background=1a6397
set -Ux fish_color_operator 849900
set -Ux fish_color_escape d23681
set -Ux fish_color_autosuggestion 576d74

# Completion Pager Colors
set -Ux fish_pager_color_progress 576d74
set -Ux fish_pager_color_prefix 29a298
set -Ux fish_pager_color_completion 839395
set -Ux fish_pager_color_description 576d74
set -Ux fish_pager_color_selected_background --background=1a6397

# FZF Color Theme
set -Ux FZF_DEFAULT_OPTS "
  --highlight-line
  --info=inline-right
  --ansi
  --layout=reverse
  --border=none
  --color=bg+:#002c38
  --color=bg:#001419
  --color=border:#063540
  --color=fg:#9eabac
  --color=gutter:#001419
  --color=header:#c94c16
  --color=hl+:#c94c16
  --color=hl:#c94c16
  --color=info:#637981
  --color=marker:#c94c16
  --color=pointer:#c94c16
  --color=prompt:#c94c16
  --color=query:#9eabac:regular
  --color=scrollbar:#063540
  --color=separator:#063540
  --color=spinner:#c94c16
"

# Set BAT Theme
set -Ux BAT_THEME "Solarized (dark)"

# Alias bat to use theme
alias cat "bat --theme=Solarized (dark)"
alias batp "bat --theme=Solarized (dark) --style=plain"

set -U fish_user_paths /run/current-system/sw/bin $fish_user_paths
