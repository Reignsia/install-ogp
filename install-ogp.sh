#!/bin/bash

# Update package lists
sudo apt-get update

# Install packages with configurations
sudo apt-get install -y apache2 curl subversion php7.4 php7.4-gd php7.4-zip libapache2-mod-php7.4 \
php7.4-curl php7.4-mysql php7.4-xmlrpc php-pear mariadb-server php7.4-mbstring git php-bcmath \
libxml-parser-perl libpath-class-perl perl-modules screen rsync sudo e2fsprogs unzip subversion \
pure-ftpd libarchive-zip-perl libc6 libgcc1 git curl libc6-i386 lib32gcc1 lib32gcc-s1 \
libhttp-daemon-perl libarchive-extract-perl

# Set up 32-bit architecture and install packages
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y libstdc++6:i386

# Configure Apache for phpMyAdmin
sudo nano /etc/apache2/sites-available/000-default.conf
echo "Alias /phpmyadmin /usr/share/phpmyadmin" >> /etc/apache2/sites-available/000-default.conf

# Modify PHP settings
sudo nano /etc/php/7.4/apache2/php.ini
echo "upload_max_filesize = 20M" >> /etc/php/7.4/apache2/php.ini
echo "post_max_size = 25M" >> /etc/php/7.4/apache2/php.ini

# Indicate configuration completion
touch /tmp/configuration_complete

echo "Configuration completed. Continuing with the installation."