serve:
	php bin/console server:run *:8001

db:
	docker run --name=p2-mysql57 -e MYSQL_DATABASE=project2 -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -d mysql:5.7

stop-db:
	docker stop p2-mysql57

