serve:
	gitbook serve . -v 2.0.1

deploy:
	sh deploy.sh

update:
	git commit -a -m 'update'
	git push
	make deploy
