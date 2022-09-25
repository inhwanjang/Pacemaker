#!/bin/bash


pcs resource create Webserver apache configfile=/etc/httpd/conf/httpd.conf statusurl="http://127.0.0.1/server-status" op monitor interval=20 --group group1
