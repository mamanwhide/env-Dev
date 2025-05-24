#!/bin/bash
rm -rf .cache build
docker run -u $(id -u) -v $PWD:/antora:Z --rm -t antora/antora --cache-dir=./.cache --stacktrace antora-playbook.yml
rm -rf /var/www/html/build
cp -r build /var/www/html/
sudo nginx -t
sudo systemctl restart nginx
rm -rf build .cache
