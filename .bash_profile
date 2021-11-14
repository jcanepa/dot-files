# this file is run each time a bash terminal window is opened.
echo '😎 ~/.bash_profile loaded.'
export PATH=$HOME/bin:/usr/local/bin:~/.composer/vendor/bin:$PATH

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo "[${BRANCH}]"
    else
        echo ""
    fi
}

# bash prompt
export PS1="\[\e[0;38;5;36m\]\W\[\e[31m\]\`parse_git_branch\` \[\e[0;38;5;36m\]>\[\e[0m\] "
export BASH_SILENCE_DEPRECATION_WARNING=1

alias bashconfig='vim ~/.bash_profile'
alias reload='source ~/.bash_profile && source ~/.bashrc'
alias ll='ls -l'
alias cl='clear'
alias ..='cd ../'
alias ...='cd ../../'
alias f='open -a Finder ./'
alias code='cd ~/code'
alias vs="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --disable-workspace-trust"
alias ds="cd ~/code/osu/data-structures"
alias py=python3
alias pip=/usr/local/opt/python@3.8/bin/pip3
alias g=git
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m $1'
alias gca='git commit -am $1'

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}
