# ALIASES
#    These will override the aliases defined by BASH-IT
#    type `alias` to see all aliases

# general commands
alias rr='bundle exec rake routes | grep'
alias ali='vi ~/.bash_aliases'
alias al='alias | grep '
alias reload='. ~/.bashrc'
alias hub='cd ~/Code/infl/hub'
alias dots='cd ~/Code/infl/devops/dotfiles'
alias v='vagrant '
alias servers='foreman start -f Procfile-dev'

# Vagrant 
alias v='Vagrant '

#postgres
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop'

#sublime
alias sublime_folder='cd /Users/dev/Library/Application\ Support/Sublime\ Text\ 2\Packages'

#ruby
alias irbs="irb --simple-prompt"

#git commands
alias gbn="git co -b "
alias gca='git commit -a --amend --no-edit'
alias gc="git commit -m "
alias gco="git checkout "
alias dev="git checkout development"
alias gb="git branch -v"
alias gs="git status --short"
alias gd='git diff'
alias gdc='git diff --cached'
alias gap="git add --patch"
alias ga="git add "
alias gaa="git add . --all "
alias gu="git reset HEAD "
alias gpd="git push origin development"
alias glg='git log --color --decorate --oneline --graph'
alias 10='glg -n10'
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
alias z='zeus '


# postgres commands
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias restore_prod="createdb prod_data; pg_restore -d prod_data -xOv -F c  -C -n hstore -n public -n SCHEMA_TO_LOAD ~/Downloads/SOME_FILE.dump"
# rails
alias migrate='bundle exec rake apartment:migrate db:test:prepare'
alias redo='bundle exec rake apartment:migrate:redo'
alias r="bundle exec rails"
alias be="bundle exec "

