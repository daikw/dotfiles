#!/usr/bin/env fish
source $DOTFILES/script/common.fish

set PLUGINS_REPO "$HOME/.claude/repos/claude-code-plugins"
set PLUGINS_REMOTE "https://github.com/daikw/claude-code-plugins.git"

# Clone or update the plugins repo
if test -d $PLUGINS_REPO
    git -C $PLUGINS_REPO pull --ff-only 2>/dev/null
        or info "claude-code-plugins: pull failed, using existing"
else
    mkdir -p (dirname $PLUGINS_REPO)
    git clone $PLUGINS_REMOTE $PLUGINS_REPO
        or begin; info "failed to clone claude-code-plugins, skipping"; return; end
end

# Install general rules
if test -x $PLUGINS_REPO/install-rules.sh
    bash $PLUGINS_REPO/install-rules.sh general
        and success "claude rules (general)"
        or info "claude rules install failed"
end

# Symlink CLAUDE.md
set CLAUDE_MD_SRC (status dirname)/CLAUDE.md
set CLAUDE_MD_DST "$HOME/.claude/CLAUDE.md"

if test -f $CLAUDE_MD_SRC
    mkdir -p $HOME/.claude
    if test -f $CLAUDE_MD_DST; and not test -L $CLAUDE_MD_DST
        mv $CLAUDE_MD_DST $CLAUDE_MD_DST.backup
            and success "backed up existing CLAUDE.md"
    end
    ln -sf $CLAUDE_MD_SRC $CLAUDE_MD_DST
        and success "claude CLAUDE.md"
        or info "claude CLAUDE.md symlink failed"
end
