#!/usr/bin/env fish

if command -qs anyenv
    eval (anyenv init - | source)
end

if command -qs goenv
    goenv rehash
end
