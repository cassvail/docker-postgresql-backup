
# Docker PostgreSql backup

* Docker container to execute backups of a postgresql database periodically
* Backups are stored in a VOLUME ``/backups``
* Database are deleted when exceeding TOKEEP

### Usage

### Parameters

```-v /backups``` path where backups will be stored


```-e POSTGRES_HOST``` postgresql host (default value ```postgresql```)
```-e POSTGRES_DB``` database name to backup (default value ```app```)
```-e POSTGRES_USER``` database user (default value ```admin```)
```-e POSTGRES_PASSWORD``` database password (default value ```admin```)
```-e DELAY``` backup delay to be passed to ```sleep``` command (default value ```24h```)
```-e TOKEEP``` number of backups to be kept (old backups will be deleted): (default value ```10```)

**docker-compose** configuration

```
postgresql-backup:
  image: cassvail/postgresql-backup
  volumes:
    ./backups_localdir:/backups
  links:
    - postgresql
  depends_on:
    - postgresql
  environment:
    POSTGRES_HOST: postgresql
    POSTGRES_DB: dbname
    POSTGRES_USER: admin
    POSTGRES_PASSWORD: admin
    DELAY 24h
    TOKEEP 10
```

### #TODO

* different postgresql versions with tags