#!/bin/sh

# path='/tmp/_book'
# rm -rf $path
gitbook build .
# cp _book -r /tmp/_book
cd _book
# cd $path
git init
git add *
git commit -m "update on `date '+%Y-%m-%d %H:%M:%S'`"
git remote add github git@github.com:yely/mywiki.git
git push github master:gh-pages --force
