alias c='clear'
alias rm='trash -v'
alias ls='lsd'
alias ll='lsd -alh'
alias vi='hx'
alias cat='bat'
alias grep='rg'
alias trim="awk '{\$1=\$1;print}'"

# GIT ALIASES -----------------------------------------------------------------
alias gcp='git cherry-pick'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias grs='git restore --staged'
alias gu='git reset --soft HEAD~1'
alias gpr='git remote prune origin'
alias ff='gpr && git pull --ff-only'
alias grd='git fetch origin && git rebase origin/master'
alias gbf='git branch | head -1 | xargs' # top branch
alias gl=pretty_git_log
alias gla=pretty_git_log_all
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias gcan='gc --amend --no-edit'

alias gp="git push -u 2>&1 | tee >(cat) | grep \"pull/new\" | awk '{print \$2}' | xargs open"
alias gpf='git push --force-with-lease'

alias gg='git branch | fzf | xargs git checkout'
alias gup='git branch --set-upstream-to=origin/$(git-current-branch) $(git-current-branch)'

function unmount_all {
    diskutil list |
    grep external |
    cut -d ' ' -f 1 |
    while read file
    do
        diskutil unmountDisk "$file"
    done
}

function mff ()
{
    local curr_branch=`git-current-branch`
    gco master
    ff
    gco $curr_branch
}

function dclear () {
    docker ps -a -q | xargs docker kill -f
    docker ps -a -q | xargs docker rm -f
    docker images | grep "api\|none" | awk '{print $3}' | xargs docker rmi -f
    docker volume prune -f
}

alias docker-clear=dclear

function dreset () {
    dclear
    docker images -q | xargs docker rmi -f
    docker volume rm $(docker volume ls |awk '{print $2}')
    rm -rf ~/Library/Containers/com.docker.docker/Data/*
    docker system prune -a
}
