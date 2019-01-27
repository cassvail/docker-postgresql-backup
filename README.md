# Postgresql backup

* Docker container to execute timed backups of a postgresql database
* Backups are stored in a VOLUME ``/backups``
* Database are deleted when exceeding TOKEEP

### Usage

**docker-compose** configuration

```
postgresql-backup:
  image: cassvail/postgresql-backup
  restart: always
  volumes:
    ./backups_localdir:/backups
  links:
    - postgresql
  depends_on:
    - postgresql
  environment:
    POSTGRES_DB: dbname
    POSTGRES_USER: admin
    POSTGRES_PASSWORD: admin
    DELAY 24h
    TOKEEP 10
```

#### Docker environment variables

* Database name to backup:
  ```ENV POSTGRES_DB ``` default value ```app```
* Database hostname:
  ```ENV POSTGRES_HOST``` default value ```postgresql```
* Database username:
  ```ENV POSTGRES_USER``` default value ```admin```
* Database password:
  ```ENV POSTGRES_PASSWORD``` default value ```admin```
* Backup delay (time to wait between backups):
  ```ENV DELAY``` default value ```24h```
* Number of backups to keep (old backups will be deleted):
  ```ENV TOKEEP``` default value ```10```

### #TODO

* build automation
* postgresql versions with tags