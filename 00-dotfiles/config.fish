if status is-interactive
    # Commands to run in interactive sessions can go here
    echo "Your session is configured by dotfiles."
    echo "  see also: https://github.com/daikw/dotfiles.fish"
end

fish_add_path $DOTFILES/bin $HOME/.bin $HOME/.local/bin
