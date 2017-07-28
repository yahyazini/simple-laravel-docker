#!/bin/bash
docker-compose run web bash <<'EOF'
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