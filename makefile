build:
	docker build . -t lyx2web

release:
	docker run -v ${PWD}/docs/content:/home/content -t lyx2web:latest; git add . 
	git commit -a -m "just update"
	git push