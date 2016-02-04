# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
#PATH="$PATH:/home/pnagaraju/tools/bin"
#export SPLUNK_HOME=/home/pnagaraju/projects/install

# Source global definitions
if [ -f ~/.splunk_bashrc ]; then
	source ~/.splunk_bashrc
fi

# User specific aliases and functions
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Load mtime at bash start-up
echo "bashrc mtime: $(stat -c "%Y" ~/.reload_bashrc)" >&2
export BASHRC_MTIME=$(stat -c "%Y" ~/.reload_bashrc)

check_and_reload_bashrc() {
  if [ "$(stat -c "%Y" ~/.reload_bashrc)" != $BASHRC_MTIME ]; then
    export BASHRC_MTIME="$(stat -c "%Y" ~/.reload_bashrc)"
    echo "bashrc changed. re-sourcing..." >&2
    source ~/.bashrc
  fi
}

rbash() {
	touch ~/.reload_bashrc
}

isAlias() {
    type $1 | grep -iq alias
}

if isAlias "setcs"; then
    unalias setcs
fi 

setcs() {
    find . -regex '.*\.\(c\|cpp\|h\)$' -print > cscope.files
    sort cscope.files > cscope.files.sorted
    mv cscope.files.sorted cscope.files
    cscope -bq
    ctags -L cscope.files
}

PROMPT_COMMAND="check_and_reload_bashrc"
alias csr="cscope -d"
export PYTHONSTARTUP=~/.pythonrc
