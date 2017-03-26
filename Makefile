serve:
	gitbook serve . -v 2.0.1

deploy:
	sh deploy.sh

update:
	git add -A
	git commit -a -m "update on `date '+%Y-%m-%d %H:%M:%S'`"
	git push
	make deploy
