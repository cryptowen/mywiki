#!/bin/sh

path='../my_wiki_book'
gitbook build -o $path
cd $path
git add -A
git commit -m 'deploy'
# git remote add origin git@github.com:yely/mywiki.git
git push origin master:gh-pages
