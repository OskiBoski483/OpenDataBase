# Supported os
| Operating System | Version | support            | PHP Version |
| ---------------- | ------- | ------------------ | ----------- |
| Ubuntu           | 14.04   | :red_circle:       |             |
|                  | 16.04   | :red_circle:       |             |
|                  | 18.04   | :white_check_mark: | 8.0         |
|                  | 20.04   | :white_check_mark: | 8.0         |
| Debian           | 8       | :red_circle:       |             |
|                  | 9       | :white_check_mark: | 8.0         |
|                  | 10      | :white_check_mark: | 8.0         |
|                  | 11      | :white_check_mark: | 8.0         |
| Windows          | Vista   | :red_circle:       |             |
|                  | 7       | :white_check_mark: | 8.0         |
|                  | 8/8.1   | :white_check_mark: | 8.0         |
|                  | 10      | :white_check_mark: | 8.0         |
|                  | 11      | :white_check_mark: | 8.0         |

Windows: No tutorial
# Requirements
- Php 8.0
- Web server (apache, nginx etc.)

Install webserver, and requirements
```sh
apt update
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
apt install -y apache2 php8.0 libapache2-mod-php
systemctl restart apache2
apt install unzip
```
Next, we need to create an OpenDataBase installation folder
```sh
mkdir /var/www/database
cd /var/www/database
```
and install files
```sh
wget https://raw.githubusercontent.com/OskiBoski483/OpenDataBaseZips/main/latest.zip
unzip latest.zip
```
Now setup webserver
```sh
a2dissite 000-default.conf
nano /etc/apache2/sites-enabled/database.conf
```
and enter:
(replace domain with your domain)
```conf
<VirtualHost *:80>
  ServerName domain
  DocumentRoot "/var/www/database/public"
  php_value upload_max_filesize 10M
  php_value post_max_size 10M
  
  <Directory "/var/www/database/public">
    AllowOverride all
    Require all granted
  </Directory>
</VirtualHost>
```
next: 
```sh
sudo a2enmod rewrite
systemctl restart apache2
```

**Ready!** - you can install OpenWave now.

