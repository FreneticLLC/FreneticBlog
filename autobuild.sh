#!/bin/bash

git fetch origin
changed_files="$(git diff-tree -r --name-only --no-commit-id origin/master HEAD)"

if [ -n "$changed_files" ]
then
    echo "Changes: $changed_files at $(date)" >> ~/checklogs.log
    git stash
    git pull origin master
    rm -rf _site/
    bundle exec jekyll build
fi

