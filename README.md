# Laravel

A docker container to manage the development environment for Laravel applications

# Example:

Run the Laravel container with MySQL as the database and Adminer as a DB Management tool.  The bellow docker-compose file also allows you to mount your Laravel application under the current direction and the MySQL database files

*docker-compose.yaml*
```
laravel:
  image: rbroker/laravel:latest
  volumes:
    - ./PrettyPets:/var/www/html
  ports:
    - 8000:8000
  links:
    - db
db:
    image: mysql
    volumes:
      - ./db:/var/lib/mysql
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: passw0rd

adminer:
  image: adminer
  restart: always
  ports:
    - 8080:8080
  links:
    - db
```

# References:
1. https://laravel.com/
