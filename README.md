# My solutions to [PostgreSQL Exercise](https://pgexercises.com/)

## Setup
```bash
$ cd pgexercises
$ curl -o clubdata.sql https://pgexercises.com/dbfiles/clubdata.sql
$ docker compose up
```

## Running query
```bash
# The database must be running to run a query
$ cd pgexercises
$ docker compose exec db bash -c "psql -U postgres -d exercises -f solutions/01-basic/01-retrieve-everything-from-a-table.sql"
```
