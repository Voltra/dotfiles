#!/bin/bash

## Git
alias git-add="git add ."
alias git-commit="git commit -a -m"
alias git-push="git push origin master"
alias git-pull="git pull origin master"

alias git-s="git status"
alias git-d="git diff"
alias git-crlf="git config --global core.safecrlf"
alias git-rm="git rm -r --cached"
alias git-ac="git-add && git-commit"

alias git-b="git rev-parse --abbrev-ref HEAD"
alias gpush='git push origin $(git-b)'
alias gpull='git pull origin $(git-b)'

alias gf="git flow"
alias gffs="gf feature start"
alias gffp="gf feature publish"
alias gfff="gf feature finish -k"
alias gfrs="gf release start"
alias gfrf="gf release finish"
alias gfhs="gf hotfix start"
alias gfhf="gf hotfix finish"

## Specialization
alias clipboard="clip.exe" # adapt this
alias explorer="explorer.exe" # adapt this
alias gui="explorer ."
alias openGui="explorer"
alias cc="gcc"
alias cd="pushd"
alias rename="mv"
alias makeSymLink="ln -s"
alias chmodsh="chmod +x *.sh"
alias artisan="php artisan"
alias osquery="osqueryi"
alias jq='\jq -C'
alias adonis="node ace"
alias tree='\tree -I node_modules'

## Scripts
scripts=(tac split_by)
for script in "${scripts[@]}"; do
	alias $script="~/.bash/scripts/$script.sh"
done
chmod +x ~/.bash/scripts/*.sh
