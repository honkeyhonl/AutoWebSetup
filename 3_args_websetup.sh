#!/bin/bash -e

# Variables
packages="wget httpd unzip"
svc="httpd"
url="https://www.tooplate.com/zip-templates/2098_health.zip"
art_name="2098_health"
tempdir="/tmp/webfiles"

echo "###########################"
echo "Installing packages"
echo "###########################"
sudo dnf install -y $packages > /dev/null

echo "##########################"
echo "Starting and enabling $svc"
echo "##########################"
sudo systemctl enable --now $svc

echo "#######################"
echo "Deploying web artifact"
echo "#######################"
mkdir -p $tempdir
cd $tempdir

# Download template only if not already present
if [ ! -f "$art_name.zip" ]; then
  wget -q $url
fi

# Unzip with overwrite
unzip -o $art_name.zip > /dev/null

# Copy files into web root
sudo rsync -a --delete $art_name/ /var/www/html/

echo "#######################"
echo "Restarting $svc"
echo "#######################"
sudo systemctl restart $svc

echo "###########################"
echo "Clean up"
echo "###########################"
rm -rf $tempdir

# Show service status in a non-blocking way
echo "Service status: $(systemctl is-active $svc)"
echo "Files in /var/www/html:"
ls -1 /var/www/html/