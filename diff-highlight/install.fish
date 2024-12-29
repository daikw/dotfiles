#!/usr/bin/env fish

switch (uname)
case Darwin
    sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
case Linux
    sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
    sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
end