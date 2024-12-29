if status is-interactive
    # Commands to run in interactive sessions can go here
    echo "Your session is configured by dotfiles."
    echo "  see also: https://github.com/daikw/dotfiles.fish"
end

alias dc="docker compose"
fish_add_path $DOTFILES/bin $HOME/.bin $HOME/.local/bin
fish_add_path "$HOME/.rye/shims"

# set LD_LIBRARY_PATH /usr/local/cuda/lib64

# set -gx PATH $PATH $HOME/.krew/bin

# if pbcopy (for Darwin) not found, use xsel as a fallback
switch (uname)
case Darwin
case Linux
    if not command -qs pbcopy
        alias pbcopy="xsel --clipboard --input"
    end
    if not command -qs pbpaste
        alias pbpaste="xsel --clipboard --output"
    end
end

# use ssh-agent service
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
