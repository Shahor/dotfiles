# prompt.sh
# inspired by https://bitbucket.org/delroth/configs/src/84e671b03307/.bash/prompt.sh

# Enables/disables bold
bold='\[\e[1m\]'
nobold='\[\e[22m\]'

# Resets all styles
reset='\[\e[0m\]'

# n = \n
n='\n'

# hc = Host color
# sc = Separator color
# dc = Dir color
# pc = Prompt color
# err = Error color
hc='\[\e[32m\]'
sc='\[\e[31m\]'
dc='\[\e[33m\]'
pc='\[\e[34m\]'
err='\[\e[31m\]'
git='\[\e[35m\]'

# Utils functions
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

check_last_command() {
	if [ $? != 0 ]; then
		echo "----- FAILED -----"
	fi
}

l2="$pc\$> $reset"

l1_start="$bold$hc\u$sc@$hc\H $dc\w $git\$(parse_git_branch)$reset"
l1_end="$pc\D{%y-%m-%d %H:%M:%S}"

export PS1="$err\$(check_last_command)$reset$n$l1_start $l1_end$n$l2"
