# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

#local bashrc

if [[ -f ~/.bash/local_bashrc.sh ]]; then
	source ~/.bash/local_bashrc.sh
else
	echo "~/.bash/local_bashrc.sh does not exist"
fi

if [[ -f ~/.ssh/agent ]]; then
	source ~/.ssh/agent
fi

if [[ -f ~/.git_completion ]]; then
	source ~/.git_completion
fi

# Prompt section
if [[ -f ~/.bash/prompt.sh ]]; then
	source ~/.bash/prompt.sh
else
	echo "~/.bash/prompt.sh does not exist, using default prompt"
	export PS1="[\t] \[\e[01;32m\]\u@\h \[\e[01;33m\]\W \[\e[01;34m\]\[\e[00m\] \$ " #default prompt
fi
# end prompt section

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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
