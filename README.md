# How to use ?

```bash
git clone the repo
cd simple-laravel-docker
git clone https://github.com/laravel/laravel.git app/src #or place your laravel app inside app/src
docker-compose up
#On a nother command propmt from the simple-laravel-docker location run:
docker exec -it app bash
php artisan key:generate
composer install
chgrp -R www-data storage bootstrap/cache
chmod -R ug+rwx storage bootstrap/cache
 # This would allow you to see your docker host needed for DB_HOST
```
**If you are using a mac, ensure you are sharing the project folder in the docker sharing  tab under preferences**

# Environment Configuration:
* Go to phpMyAdmin on **http://localhost:8080** and log in using:
    * **username**: root
    * **password**: pass
* Create a new database to use it on DB_DATABASE.
* Copy and paste the .env.example content into .env and set the following:
```bash
DB_CONNECTION=mysql
DB_HOST= # Set this to the output of `docker network inspect bridge | grep Gateway`
DB_PORT=3306
DB_DATABASE=# Set this to your Database name
DB_USERNAME=root
DB_PASSWORD=pass
```

# How to use Composer?
`docker exec -it app bash`

This allows you to execute commans inside the **app** container and from there it's business as usual:
`composer install`...`composer dump-autoload`...etc.

# How do I add PHP libraries?
Use the **php/Dockerfile**'s RUN section to add and install any necessary PHP libraries
don't forget to rebuild and rerun after any changes to the settings:

`docker-compose up --build`

# How do I Change PHP.ini settings?
Use the **php/php.ini**'s file to add or change any ini settings:

`docker-compose up --build`

# How do I change the version of PHP or MySQL
Changing the **FROM** version in **php/Dockerfile** or **mysql/Dockerfile** and then rebuilding and running the container again would result in a change of the versions in the environment.

# Important Note:
To track changes on the `app/src` file you have to remove the **src** line from the **.gitignore** and refresh it.
