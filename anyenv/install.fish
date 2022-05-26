#!/usr/bin/env fish

fish_add_path $HOME/.anyenv/bin

if ! test -d $HOME/.config/anyenv/anyenv-install
    anyenv install --init
end
