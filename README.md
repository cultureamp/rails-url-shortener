# Rails Url Shortener

Original repo: https://github.com/truggeri/rails-url-shortener
## Development

### Quick setup

```bash
brew install postgresql@14
/opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14
./bin/setup
```

The `Procfile` can be run with different tools, e.g. Foreman, Overmind

```bash
brew install overmind
rm -f .overmind.sock && overmind start
```

Curl example (more API can be found at `/docs/design.md`)

```bash
curl --dump-header - --request POST --url "http://localhost:5000" --data "full_url=https://anytown.usa"
```


### PostgreSQL Database

This app uses PostgreSQL 13+ for it's datastore. In order to configure one, provide a database URL via an environment variable.

```bash
export DATABASE_URL=postgres://<username>:<password>@<host>:<port>/rails_url_shortener
```

This database can be setup in any fashion that you choose. Options include [local install](https://www.postgresql.org/download/), [Docker](https://hub.docker.com/_/postgres?tab=description), or as [a web service](https://www.heroku.com/postgres). If you'd like to use Docker, we have a [Docker Compose](https://docs.docker.com/compose/) [file](./docker-compose.yml) to help,

```bash
cat docker-compose.env
 export URL_SHORTENER_DB_DATABASE=rails_url_shortener
 export URL_SHORTENER_DB_PASSWORD=somepassword
 export URL_SHORTENER_DB_USERNAME=database_user
 export URL_SHORTENER_DB_URL=postgres://$URL_SHORTENER_DB_USERNAME:$URL_SHORTENER_DB_PASSWORD@localhost:5432/$URL_SHORTENER_DB_DATABASE
source docker-compose.env
docker-compose up --detach db
```

### Docker

If you'd like to run the application using Docker, there is a [Dockerfile](./Dockerfile) provided.
To use, build the container first and then run it with your configured database and port settings.

```bash
docker build -t rails-url-shortener .
docker run --rm -e DATABASE_URL=$DATABASE_URL -p 3000:3000 rails-url-shortener
```

