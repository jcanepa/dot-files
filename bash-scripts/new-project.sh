#! /usr/bin/env bash

# initialiaze a new local git repo
cd ~/code
mkdir $1 && cd $1
git init -b main
touch readme.md && touch .gitignore
echo '# Starting Ritual' > readme.md
echo 'For speed, power and profit.' >> readme.md
git add .
git commit -m 'Initial commit.'
echo 'New local repositiory initialized.'

# create a new project in GitHub and push local repo
gh repo create $1 --private --disable-issues
git push -u origin main
echo 'New public repository published on GitHub.'