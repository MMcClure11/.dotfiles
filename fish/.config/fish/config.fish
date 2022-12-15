if status is-interactive
    # Commands to run in interactive sessions can go here
end

# source /usr/local/opt/asdf/libexec/asdf.fish
set -gx STOW_DIR ~/.dotfiles
set -gx ERL_FLAGS "-kernel shell_history enabled"
source /opt/homebrew/opt/asdf/libexec/asdf.fish

source /opt/homebrew/opt/asdf/libexec/asdf.fish
direnv hook fish | source