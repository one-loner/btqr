#!/bin/bash
if (($EUID !=0)); then
     echo Script must be run by root.
     exit
fi
apt-get install -y qrencode
cp btqr.sh /bin/btqr
chmod +x /bin/btqr/
echo 'Done. Usage btqr <filename>'

