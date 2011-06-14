# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

#local bashrc

if [[ -f ~/.local_bashrc.sh ]]; then
	source ~/.local_bashrc.sh
fi

if [[ -f ~/.ssh/agent ]]; then
	source ~/.ssh/agent
fi

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

check_last_command() {
	if [ $? != 0 ]; then
		echo 'FAILED '
	fi
}

export PS1="[\t] \[\e[01;32m\]\u@\h \[\e[01;33m\]\W \e[01;31m\$(check_last_command)\[\e[01;34m\]\[\e[00m\]\$(parse_git_branch) \$ "
export EDITOR=vim
export SVN_EDITOR=vim

system=`uname -s`;
if [[ $system == 'Linux' ]]; then
	alias ls='ls --color'
elif [[ $system == 'Darwin' ]]; then
	alias ls='ls -G'
fi
alias l='ls -lhrt'
alias la='ls -larth'

# Vi mode editing
set -o vi
