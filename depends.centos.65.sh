#!/bin/bash

role=`id -u`
if test $role -ne 0
then
    echo " You requested a scan type which requires root privileges"
    exit 1
fi

yum repolist 2>/dev/null | grep "^epel" 1>/dev/null || yum install -y epel-release

command -v vim > /dev/null || sudo yum install -y vim

yum install sqlite-devel -y
yum install wget -y
yum install -y zlib.x86_64 zlib-devel.x86_64
yum install -y openssl.x86_64 openssl-devel.x86_64
yum install -y rabbitmq-server

#wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz
#tar zxvf Python-2.7.9.tgz
#cd Python-2.7.9
#./configure --prefix=/usr/local
#make && make install
#cd -

#wget https://bootstrap.pypa.io/get-pip.py
#/usr/local/bin/python2.7 get-pip.py
#rm -f get-pip.py

/usr/local/bin/pip2.7 install --upgrade setuptools
/usr/local/bin/pip2.7 install --upgrade celery
/usr/local/bin/pip2.7 install --upgrade django
/usr/local/bin/pip2.7 install --upgrade django-celery
/usr/local/bin/pip2.7 install --upgrade https://github.com/mher/flower/zipball/master#egg=flower

echo "depend pkts install ok"
