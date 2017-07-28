#!/bin/bash

docker-compose run mysql bash <<'EOF'
echo 'CREATING WORDPRESS DB'
mysql -h $LOCALHOST -u $MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress";
echo 'DONE!'
EOF

docker-compose run web bash <<'EOF'
echo 'INSTALLING WORDPRESS'
sudo rm -rf public/wordpress
mkdir public/wordpress
cd public/wordpress
curl -fSL "https://wordpress.org/wordpress-4.8.tar.gz" -o wordpress.tar.gz 
echo 'Starting to extract WORDPRESS'
tar  -xz --strip-components=1 -f wordpress.tar.gz \
		&& rm wordpress.tar.gz \
		&& chown -R www-data:www-data wp-content
echo 'DONE!'
EOF
docker cp ./web/config/wp/wp-config.php web:/var/www/html/public/wordpress
