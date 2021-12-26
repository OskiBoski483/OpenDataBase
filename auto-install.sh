DOMAIN=xd
echo "
░█████╗░██████╗░███████╗███╗░░██╗  ██████╗░░█████╗░████████╗░█████╗░  ██████╗░░█████╗░░██████╗███████╗ n\
██╔══██╗██╔══██╗██╔════╝████╗░██║  ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗  ██╔══██╗██╔══██╗██╔════╝██╔════╝ n\
██║░░██║██████╔╝█████╗░░██╔██╗██║  ██║░░██║███████║░░░██║░░░███████║  ██████╦╝███████║╚█████╗░█████╗░░ n\
██║░░██║██╔═══╝░██╔══╝░░██║╚████║  ██║░░██║██╔══██║░░░██║░░░██╔══██║  ██╔══██╗██╔══██║░╚═══██╗██╔══╝░░ n\
╚█████╔╝██║░░░░░███████╗██║░╚███║  ██████╔╝██║░░██║░░░██║░░░██║░░██║  ██████╦╝██║░░██║██████╔╝███████╗ n\
░╚════╝░╚═╝░░░░░╚══════╝╚═╝░░╚══╝  ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝  ╚═════╝░╚═╝░░╚═╝╚═════╝░╚══════╝ n\
"
echo "Conveniently, the script automatically installs OpenDataBase"
apt -y update
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
apt install -y apache2 php8.0 libapache2-mod-php
systemctl restart apache2
apt install -y unzip
mkdir /var/www/database
cd /var/www/database
wget https://raw.githubusercontent.com/OskiBoski483/OpenDataBaseZips/main/latest.zip
unzip latest.zip

# Web server
a2dissite 000-default.conf
cd /etc/apache2/sites-enabled
wget https://raw.githubusercontent.com/OskiBoski483/OpenDataBase/main/database.conf
sed -i -e "s@domain@${DOMAIN}@g" /etc/apache2/sites-enabled/database.conf

echo "
████████╗██╗░░██╗░█████╗░███╗░░██╗██╗░░██╗  ██╗░░░██╗░█████╗░██╗░░░██╗██╗
╚══██╔══╝██║░░██║██╔══██╗████╗░██║██║░██╔╝  ╚██╗░██╔╝██╔══██╗██║░░░██║██║
░░░██║░░░███████║███████║██╔██╗██║█████═╝░  ░╚████╔╝░██║░░██║██║░░░██║██║
░░░██║░░░██╔══██║██╔══██║██║╚████║██╔═██╗░  ░░╚██╔╝░░██║░░██║██║░░░██║╚═╝
░░░██║░░░██║░░██║██║░░██║██║░╚███║██║░╚██╗  ░░░██║░░░╚█████╔╝╚██████╔╝██╗
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝  ░░░╚═╝░░░░╚════╝░░╚═════╝░╚═╝
"
echo "OpenDataBase has been installed! If you want to configure SSL, download certbot."
