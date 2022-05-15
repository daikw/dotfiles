fish_add_path $HOME/.anyenv/bin

if command -qs anyenv
    eval (anyenv init - | source)
end

if ! test -f $HOME/.config/anyenv/anyenv-install
    anyenv install --init
end
