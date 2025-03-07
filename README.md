# ASTUDIO Project Management

this project is a project management and time tracking API.

It handles the CRUD operations for the projects, timesheets, attributes, and attribute_values.

And also has a dynamic attribute system that linked with the projects table through attribute_values table.

Also it uses advanced filtering using the projects table columns and also with the dynamic attributes.

## Features

- User Management: (login, register, and logout)
- Project Management:
  - CRUD operations
  - Dynamic attributes
  - Advanced filtering
- Timesheet, Attribute, and Attribute Value management: (CRUD)
- API Authentication using Passport.
- CI pipeline using github actions
- Tesing using PestPHP with coverage `96.2%`
- Using PER Coding Style (extends PSR-12) through laravel pint.
- Using phpstan as static analysis tool.

## Installation

### Docker

#### Requirements

- docker
- docker-compose

#### setup

clone the repository

```sh
git clone https://github.com/mohamed-samir907/astudio
```

create `.env`

```sh
cp .env.example .env
```

configure database connection

```sh
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=password
```

install composer dependencies

```sh
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php84-composer:latest \
    composer install --ignore-platform-reqs
```

run the application

```sh
./vendor/bin/sail up -d
```

generate keys for passport

```sh
./vendor/bin/sail artisan passport:keys --force
```

run the migrations

```sh
./vendor/bin/sail artisan migrate:fresh --seed
```

run the tests

```sh
./vendor/bin/sail composer run test
```

check coding style

```sh
./vendor/bin/sail composer run pint
```

run PHPStan analysis

```sh
./vendor/bin/sail composer run stan
```

### Manual

#### Requirements

- PHP +8.2
- mysql
- composer

#### setup

clone the repository

```sh
git clone https://github.com/mohamed-samir907/astudio
```

create `.env`

```sh
cp .env.example .env
```

configure database connection

```sh
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=password
```

install composer dependencies

```sh
composer install
```

generate keys for passport

```sh
php artisan passport:keys --force
```

run the migrations

```sh
php artisan migrate:fresh --seed
```

run the tests

```sh
composer run test
```

check coding style

```sh
composer run pint
```

run PHPStan analysis

```sh
composer run stan
```

## Test User

```
Email: admin@user.com
Password: password
```

## API Docs

You can import the attached postman collections and try the API. download this file `astudio.postman_collection.json` from the project and import it.

Also you can find this Published Postmand Docs: 

https://documenter.getpostman.com/view/28975502/2sAYdmnUDk
