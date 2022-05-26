#!/usr/bin/env fish
if ! command -qs tig
	exit
end

ln -sf $DOTFILES/tig/.tigrc.symlink ~/.tigrc
