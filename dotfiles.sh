#!/bin/zsh

git_cmd=(/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME)
if [[ $# == 0 ]]; then
	commit_msg="Updated some config files"
	head -n -1 ~/.config_files | fzf | xargs -I % ${git_cmd} add %
	${git_cmd} commit -m "$commit_msg"; ${git_cmd} push
else
	${git_cmd} $*
fi
