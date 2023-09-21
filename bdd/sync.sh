#! /bin/bash

scp -o "StrictHostKeyChecking no" /var/html/index.html root@192.168.75.10:/var/www/html/index.html
scp -o "StrictHostKeyChecking no" /var/html/index.html root@192.168.75.20:/var/www/html/index.html
