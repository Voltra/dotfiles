if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

export TERM=xterm-256color
if [[ -f $THEME ]]; then
	export DEFAULT_USER=$(whoami)
	source $THEME
fi

installers=(vim-plug nvm youtube-dl)
chmod +x ~/.bash/installers/*.sh
for installer in "${installers[@]}"; do
	~/.bash/installers/$installer.sh 1> /dev/null
done

powerline-daemon -q
export POWERLINE_BASH_CONTINUATION=1
export POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
