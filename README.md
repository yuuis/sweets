# What's Sweets

Sweets is payment platform for tagoken

## Features

- Pay with QR code

## Requirements

 - Backend
    - rails: 5.2.2
    - ruby: 2.5.1

## Docs

| Name                         | Version | Note  |
| :--------------------------: | :-----: | :---: |
| [IF Spec](docs/interface.md) | v0.1.0  | -     |

## Development



## Docker Builds

```
$ docker-compose build
$ docker-compose run backend bundle exec rails db:drop db:create db:migrate db:seed
$ docker-compose up
```
