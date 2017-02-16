#!/bin/sh

gitbook build .
deploy_dir=book_deploy
if [ ! -d "$deploy_dir" ]; then
  git clone -b gh-pages git@github.com:huwenchao/mywiki.git $deploy_dir
fi

cp -r _book/* $deploy_dir
cd $deploy_dir
git add *
git commit -m "update on `date '+%Y-%m-%d %H:%M:%S'`"
git push
