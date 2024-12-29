#!/usr/bin/env fish

if command -qs anyenv
    eval (anyenv init - fish | source)
end

if command -qs goenv
    goenv rehash
end
