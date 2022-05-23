# postgresql-with-pgtap.docker

A docker container for testing PostgreSQL.

## Description

[pgTAP](https://pgtap.org/) is installed in [PostgreSQL container](https://hub.docker.com/_/postgres).

## Usage

First, build image

```sh
docker build --tag postgresql-with-pgtap .
```
```sh
docker compose build
```

and run.

```sh
docker run -d -e POSTGRES_PASSWORD=mysecretpassword postgresql-with-pgtap
```
```sh
docker compose up -d
```

Next, connect to container via client application and run the following SQL only once.

(If you use docker-compose.yml as default, this SQL will be run automatically.)
```SQL
CREATE EXTENSION pgtap;
```

## License

CC0 1.0 Universal (CC0 1.0) Public Domain Dedication

See the LICENSE.txt file or https://creativecommons.org/publicdomain/zero/1.0/ for details.
