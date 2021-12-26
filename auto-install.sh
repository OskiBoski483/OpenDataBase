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
if [ -d "/var/www/database" ]; then
    clear
    echo "
    
░██╗░░░░░░░██╗░█████╗░██████╗░███╗░░██╗██╗███╗░░██╗░██████╗░██╗
░██║░░██╗░░██║██╔══██╗██╔══██╗████╗░██║██║████╗░██║██╔════╝░██║
░╚██╗████╗██╔╝███████║██████╔╝██╔██╗██║██║██╔██╗██║██║░░██╗░██║
░░████╔═████║░██╔══██║██╔══██╗██║╚████║██║██║╚████║██║░░╚██╗╚═╝
░░╚██╔╝░╚██╔╝░██║░░██║██║░░██║██║░╚███║██║██║░╚███║╚██████╔╝██╗
░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝
    "
    echo "The script has detected that you already have OpenDataBase installed"
    echo -e -n "* Are you sure you want to proceed? (y/N): "
    read -r CONFIRM_PROCEED
    if [[ ! "$CONFIRM_PROCEED" =~ [Yy] ]]; then
      print_error "Installation aborted!"
      exit 1
    fi
  fi
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
