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

#fish_add_path $DOTFILES/bin $HOME/.bin $HOME/.local/bin

starship init fish | source

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


# Added by Windsurf
# fish_add_path /Users/daikiwatanabe/.codeium/windsurf/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/daikiwatanabe/.lmstudio/bin
# End of LM Studio CLI section

abbr c "claude"
abbr ccc "claude --continue"
abbr brc "CLAUDE_CODE_USE_BEDROCK=1 claude"
abbr brccc "CLAUDE_CODE_USE_BEDROCK=1 claude --continue"


# qlty
set --export QLTY_INSTALL "$HOME/.qlty"
set --export PATH $QLTY_INSTALL/bin $PATH
/Users/daikiwatanabe/.local/bin/mise activate fish | source

#set -e GOPATH
set GOPATH "$HOME/go"


# Agent Persona
function zundamon
    #set -l prompt (tail -n +5 ~/.claude/personas/zundamon.md | string collect)
    sed -i "" "s/\"tengu_copper_bridge\": true/\"tengu_copper_bridge\": false/" ~/.claude.json 2>/dev/null
    claude --append-system-prompt "$prompt" --dangerously-skip-permissions $argv
end
function anneli
    sed -i "" "s/\"tengu_copper_bridge\": true/\"tengu_copper_bridge\": false/" ~/.claude.json 2>/dev/null
    claude --enable-auto-mode $argv
end
function elu
    set -l prompt (tail -n +5 ~/.agents/personas/elu.md | string collect)
    codex --dangerously-bypass-approvals-and-sandbox "'"$prompt"'" $argv
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daikiwatanabe/.local/bin/google-cloud-sdk/path.fish.inc' ]; . '/Users/daikiwatanabe/.local/bin/google-cloud-sdk/path.fish.inc'; end

# pnpm
set -gx PNPM_HOME "/Users/daikiwatanabe/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
