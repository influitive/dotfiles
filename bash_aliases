# ALIASES
#    These will override the aliases defined by BASH-IT
#    type `alias` to see all aliases

# general commands
alias rr='bundle exec rake routes | grep'
alias ali='vim ~/.bash_aliases'
alias al='alias | grep '
alias reload='. ~/.bashrc'
alias hub='cd ~/Code/infl/hub'
alias dots='cd ~/Code/infl/devops/dotfiles'
alias servers='for repo in waldo waldo4j narci; do docker pull docker.influitive.io/library/$repo:latest; done && foreman start -f Procfile-dev'
alias kill_servers='ps aux | grep -E "([r]uby|[s]pring|[s]idekiq|[g]ulp)" | perl -lane "print \$F[1]" | xargs kill -9 '
alias ea="EXTERNAL_ACCESS=True "

#sublime
alias sublime_folder='cd /Users/dev/Library/Application\ Support/Sublime\ Text\ 2\Packages'

#ruby
alias irbs="irb --simple-prompt"

#installerator
alias installerator='pushd ~/Code/infl/devops/installerator && bundle exec soloist && popd'

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
alias gfuckit='git reset; git checkout .; git clean -fd'
alias gpd="git push origin development"
alias glg='git log --color --decorate --oneline --graph'
alias 10='gll -n10 --graph'
alias 20='gll -n20 --graph'
alias 40='gll -n40 --graph'
alias gll="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias pull='git pull --rebase '
alias gfh='git log --pretty=short -u -L '
alias gm='git merge'
alias grs='git reset --soft'
alias pbm='git pull && bundle && bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias pbmn='git pull && bundle && bundle exec rake db:migrate && bundle exec rake db:test:prepare && npm install'

# rails development
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias rk='bundle exec rake'
alias rs='bin/rspec -f d'
alias rsa='bundle exec rspec spec --tag ~slow --tag ~type:feature'
alias rsai='bundle exec rspec spec'
alias bm='bundle && bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias bmn='bundle && bundle exec rake db:migrate && bundle exec rake db:test:prepare && npm install'

# postgres commands
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias restore_prod="createdb prod_data; pg_restore -d prod_data -xOv -F c  -C -n hstore -n public -n SCHEMA_TO_LOAD ~/Downloads/SOME_FILE.dump"

# rails
alias migrate='bundle exec rake db:migrate db:test:prepare; echo flushall | redis-cli; '
alias redo='bundle exec rake db:migrate:redo'
alias r="./bin/rails "
alias be="bundle exec "

# docker
alias dc='docker-compose '
alias dc-run='dc run --rm '

alias web-run='dc-run web '
alias web-bundle='web-run bundle '
alias web-rails='web-bundle exec rails '
alias web-rake='web-bundle exec rake '
alias web-rspec='web-bundle exec rspec '
alias web-hanami='web-bundle exec hanami '

alias wh='web-hanami '
alias wr='web-rails '

alias docker-update-clock='docker run -it --rm --privileged --pid=host debian nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)'

fs() {
  echo "-----Updating Waldo-----"
  cd ~/Code/infl/waldo && git pull && bundle
  echo "-----Updating Api-----"
    cd ~/Code/infl/api
    git pull && bundle
  echo "-----Updating Discussions-----"
    cd ~/Code/infl/discussions
    git pull && bundle
    npm install && ./node_modules/.bin/gulp build
    be rake db:migrate
  echo "-----Updating Narci-----"
    cd ~/Code/infl/narci-service
    git pull && bundle
    be rake db:migrate
  echo "-----Updating Hub-----"
    cd ~/Code/infl/hub
    git pull && bundle
    npm install && ./node_modules/.bin/gulp build
    be rake db:migrate db:test:prepare
  echo "-----Starting Server-----"
    foreman start -f Procfile-dev
}

# emacs
alias e='emacsclient -t'
alias ec='emacsclient --no-wait -c'
