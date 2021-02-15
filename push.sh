#!/usr/bin/env sh

# Easily push changes to both repositories

repos=$(git remote)
if ! echo $repos | grep 'github' > /dev/null 2>&1; then
	git remote add github git@github.com:MCBE-Speedrunning/Auto-Upload.git
fi

if ! echo $repos | grep 'gitea' > /dev/null 2>&1; then
	git remote add gitea https://git.mcbe.wtf/MCBE-Speedrunning/Auto-Upload.git
fi

git push gitea
git push github
