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
