if status is-interactive
    # Commands to run in interactive sessions can go here
    echo "Your session is configured by dotfiles."
    echo "  see also: https://github.com/daikw/dotfiles.fish"
end

eval (/opt/homebrew/bin/brew shellenv)

# flutter
#fish_add_path $HOME/Applications/flutter/bin
#fish_add_path $HOME/.gem/bin

string match -q "$TERM_PROGRAM" "cursor"
and . (code -- --locate-shell-integration-path fish)

#fish_add_path $HOME/.anyenv/envs/rbenv/shims $HOME/.anyenv/envs/rbenv/bin

#fish_add_path $DOTFILES/bin $HOME/.bin $HOME/.local/bin
#set -x GOENV_ROOT $HOME/.anyenv/envs/goenv
#fish_add_path $GOENV_ROOT/bin $GOENV_ROOT/shims $GOROOT/bin
#goenv init - | source

starship init fish | source
#status --is-interactive; and source (anyenv init - --no-rehash|psub)

# git
abbr g "git"
abbr ga "git add"
abbr gc "git commit"
abbr gcm 'git commit -m'
abbr gca "git commit --amend"
abbr gpsh "git push origin HEAD"
abbr gdif "git diff"
abbr gchk "git checkout"
abbr gust "git restore --staged"
abbr gsav "git stash save -u"
abbr gp "git stash pop"
abbr glst "git stash list"
abbr gw "git switch"
abbr gb "git branch --sort=-committerdate"
## https://techracho.bpsinc.jp/jhonda/2018_12_13/66486
## https://yuu.1000quu.com/git_alias_and_zsh_setting
abbr gst "git status --short --branch"
### Show git log in compact form
abbr gl "git log --oneline --decorate=short --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>' -10"
### Show git log with number of modified lines
abbr glli "git log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
### Show git log with visual graph of branch
abbr glgr "git log --graph --oneline --decorate=short --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>'"
## latexdiff with git

alias python=python3

export AWS_DEFAULT_PROFILE=akerun

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/daikiwatanabe/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daikiwatanabe/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/daikiwatanabe/Downloads/google-cloud-sdk/path.fish.inc'; end

# Added by Windsurf
# fish_add_path /Users/daikiwatanabe/.codeium/windsurf/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/daikiwatanabe/.lmstudio/bin
# End of LM Studio CLI section


alias c=claude
alias ccc='claude --continue'


# qlty
set --export QLTY_INSTALL "$HOME/.qlty"
set --export PATH $QLTY_INSTALL/bin $PATH
/Users/daikiwatanabe/.local/bin/mise activate fish | source
