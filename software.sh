#!/bin/bash
echo 'Installing nginx...'
apt update -y && apt install nginx -y
systemctl start nginx