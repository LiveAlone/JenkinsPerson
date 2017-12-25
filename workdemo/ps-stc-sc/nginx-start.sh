#!/bin/bash

src=/home/qingqing/source
dst=/home/qingqing/webapps/static

cd /home/qingqing/source/ && unzip -qo *.zip -d static && rsync -rlp static/ $dst/static/ && rsync -p manifest*.json $dst/ && rm *.zip -f 

/usr/local/nginx/sbin/nginx
