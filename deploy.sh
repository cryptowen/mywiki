#!/bin/sh

path='/tmp/_book'
rm -rf $path
gitbook build .
cp _book -r /tmp/_book
cd $path
git init
git add -A
git commit -m 'deploy'
git remote add origin git@github.com:yely/mywiki.git
git push origin master:gh-pages --force
