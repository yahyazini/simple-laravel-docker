#!/bin/bash
git clone https://github.com/laravel/laravel.git web/src
docker-compose run web bash <<'EOF'
cp .env.example .env
composer install
php artisan key:generate
chgrp -R www-data storage bootstrap/cache
chmod -R ug+rwx storage bootstrap/cache
EOF