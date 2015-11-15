#!/bin/sh

path='/tmp/_book'
rm -rf $path
gitbook build .
cp _book -r /tmp/_book
cd $path
git init
git add -A
git commit -m 'deploy'
git remote add github git@github.com:yely/mywiki.git
git push github master:gh-pages --force
git remote add gitcafe git@gitcafe.com:huwenchao/mywiki.git
git push gitcafe master:gitcafe-pages --force
