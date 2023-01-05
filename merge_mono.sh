#!/bin/bash
# Echo commands
##usage ./merge_mono.sh owner/repo1/branch owner/repo2/branch owner/repo3/branch
#to skip the Owner repeat you can uncomment owner and place it with owner aka Jhondoe also you have to edit the IFS and remove owner
#it will be IFS="/" read repo_name BRANCH <<<"$repo"
set -o xtrace
GIT_HOME="git@github.com"
#owner="Jhondoe"
for repo in "${@:1}"
do 
	IFS="/" read owner repo_name BRANCH <<<"$repo"
	git remote add -f $repo_name $GIT_HOME:${owner}/${repo_name}.git
	git merge --no-commit --no-ff $repo_name/$BRANCH --allow-unrelated-histories
	git add .
	git commit -m "<Merge $repo_name to main files>"

done
