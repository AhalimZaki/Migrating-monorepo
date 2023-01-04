#!/bin/bash
# Echo commands
set -o xtrace
GIT_HOME="git@github.com"
BRANCH="main"
for repo in "${@:1}"
do 
	IFS="/" read owner repo_name <<<"$repo"
	git remote add -f $repo_name $GIT_HOME:${owner}/${repo_name}.git
	git merge --no-commit --no-ff $repo_name/$BRANCH --allow-unrelated-histories
	git add .
	git commit -m "<Merge $repo_name to main files>"

done
