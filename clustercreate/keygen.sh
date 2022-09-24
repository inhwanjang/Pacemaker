#!/bin/bash

ssh-keygen -t rsa |echo -ne '\n'
key=$(cat ~/.ssh/id_rsa.pub)
ssh root@$ip2 "echo $key >> ~/.ssh/authorized_keys"
