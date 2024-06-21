fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/share/meks_nvim/mason/bin/

if status is-interactive
# Commands to run in interactive sessions can go here
  function fish_user_key_bindings
    fish_vi_key_bindings
  end

  starship init fish | source
  # TODO: learn fish, display random message, lol
  set fish_greeting "hello meks, do awesome"
end

# source /usr/local/opt/asdf/libexec/asdf.fish
set -gx STOW_DIR ~/.dotfiles
set -gx ERL_FLAGS "-kernel shell_history enabled"
set -Ux ERL_AFLAGS "-kernel shell_history enabled"
set -Ux EDITOR nvim
source /opt/homebrew/opt/asdf/libexec/asdf.fish

direnv hook fish | source

# git aliases
alias g='git'

# docker aliases
# stops the container
alias dcs='docker-compose -f .docker/docker-compose.yml --env-file .docker/.env stop postgres'
# starts the container
alias dcu='docker-compose -f .docker/docker-compose.yml --env-file .docker/.env up -d postgres'
# lists current running containers
alias dps='docker ps'

# --add could also be -a
# abbr will expand the command out when you type it
# this will open the new meks_nvim instead of my base nvim that is tied to my dotfiles.
abbr --add meks_nvim NVIM_APPNAME=meks_nvim nvim
