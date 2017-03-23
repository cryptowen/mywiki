serve:
	gitbook serve . -v 2.0.1

deploy:
	sh deploy.sh

update:
	make deploy
	gcam 'update'
	gp
