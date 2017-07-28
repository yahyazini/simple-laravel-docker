#!/bin/bash

docker-compose run web bash <<'EOF'
composer install
php artisan key:generate
chgrp -R www-data storage bootstrap/cache
chmod -R ug+rwx storage bootstrap/cache
EOF