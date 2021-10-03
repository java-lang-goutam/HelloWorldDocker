## Hello World Docker ([Docs][1])

Basic Hello World Python Web application which pulls Python and Mysql image
to test sample hits and interactions.  
It uses docker compose to spin the images which are configured in docker-compose.dev.yml file.

### API
  * `/` : Returns `Hello Docker !`
  * `/initdb` : Initializes `inventory` database and `widget` table
  * `/widgets` : Returns records from `widgets` table

### Commands

#### Using Docker Compose
```docker
docker-compose -f docker-compose.dev.yml up --build
```

#### Useful Commands

```docker
docker ps -a
```

```docker
docker volume create mysql
```

```docker
docker volume create mysql_config
```

```docker
docker network create mysqlnet
```

```docker

docker run --rm -d -v mysql:/var/lib/mysql \
   -v mysql_config:/etc/mysql -p 3306:3306 \
   --network mysqlnet \
   --name mysqldb \
   -e MYSQL_ROOT_PASSWORD=p@ssw0rd1 \
   mysql
```

```docker
docker exec -ti mysqldb mysql -u root -p
```

```docker
docker run --rm -d -v mysql:/var/lib/mysql \
  -v mysql_config:/etc/mysql -p 3306:3306 \
  --network mysqlnet \
  --name mysqldb \
  -e MYSQL_ROOT_PASSWORD=p@ssw0rd1 \
  mysql
```
```docker
docker build --tag hello-world-docker .
```
```docker
docker run \
   --rm -d \
   --network mysqlnet \
   --name rest-server \
   -p 5000:5000 \
   hello-world-docker
```
```docker
docker exec -it rest-server /bin/bash
```


```python
pip install mysql-connector-python
```

```python
pip freeze > requirements.txt
```

[1]: https://docs.docker.com/language/python/