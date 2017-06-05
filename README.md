# How to use ?

```bash
git clone the repo
git clone https://github.com/laravel/laravel.git simple-laravel-docker/app/src
cd simple-laravel-docker
docker-compose up
```

**If you are using a mac, ensure you are sharing the project folder in the docker sharing  tab under preferences**

# How do I add PHP libraries?
Use the **php/Dockerfile**'s RUN section to add and install any necessary PHP libraries
don't forget to rebuild and rerun after any changes to the settings:

`docker-compose up --build`

# How do I Change PHP.ini settings?
Use the **php/php.ini**'s file to add or change any ini settings:

`docker-compose up --build`

# How do I change the version of PHP or MySQL
Changing the **FROM** version in **php/Dockerfile** or **mysql/Dockerfile** and then rebuilding and running the container again would result in a change of the versions in the environment.
