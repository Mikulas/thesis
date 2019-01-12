serve: db redis
	php bin/console server:run *:8001

db:
	docker run --name=p2-mysql57 -e MYSQL_DATABASE=project2 -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -d mysql:5.7 || true

redis:
	docker run --name=p2-redis -p 6379:6379 -d redis:5.0 || true

stop:
	docker stop p2-mysql57 p2-redis

build:
	composer install

deploy:
	./deploy.sh

stage:
	mv .git-unstage .git

unstage:
	mv .git .git-unstage
