if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

export TERM=xterm-256color
if [[ -f $THEME ]]; then
	export DEFAULT_USER=$(whoami)
	source $THEME
fi

installers=(vim-plug nvm)
chmodh +x ~/.bash/installers/*.sh
for installer in "${installers[@]}"; do
	~/.bash/installers/$installer.sh 1> /dev/null
done
