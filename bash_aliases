# ALIASES
#    These will override the aliases defined by BASH-IT
#    type `alias` to see all aliases

# general commands
alias rr='bundle exec rake routes | grep'
alias ali='vi ~/.bash_aliases'
alias reload='. ~/.bashrc'
alias infl='cd ~/Code/infl'

#postgres
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop'

#sublime
alias sublime_folder='cd /Users/dev/Library/Application\ Support/Sublime\ Text\ 2\Packages'

#ruby
alias irbs="irb --simple-prompt"

#git commands
alias gca='git commit -a --amend --no-edit'
alias gc="git commit -m "
alias gco="git checkout "
alias dev="git checkout development"
alias gb="git branch -v"
alias gs="git status --short"
alias gd='git diff'
alias gdc='git diff --cached'
alias gah="git add --patch"
alias ga="git add "
alias gaa="git add . --all "
alias gu="git reset HEAD "
alias gpd="git push origin development"
alias glg='git log --color --decorate --oneline --graph'
alias gll="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias pull='git pull --rebase '
alias git_reset_my_branch='git reset --hard HEAD'
alias gm='git merge'

# rails development
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias rk='bundle exec rake'
alias rs='bundle exec rspec -f d'
alias rsa='bundle exec rspec spec --tag ~slow --tag ~type:feature'
alias rsai='bundle exec rspec spec'
alias zrs='zeus rspec -f d '


# postgres commands
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# rails
alias migrate='bundle exec rake apartment:migrate db:test:prepare'
alias redo='bundle exec rake apartment:migrate:redo'
alias r="bundle exec rails"
alias be="bundle exec "

