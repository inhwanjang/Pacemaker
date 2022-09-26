#!/bin/bash

read -p "original VM's name to copy : " original
read -p "how many: " number





myfunction(){
read -p "clone ? [y/n] : " answer
case $answer in
  [y]* ) read -p "how many clone? [number]" clone ;;
         
  [n]* ) echo "Bye" 
  * ) echo " only y or n " &&  myfunction;;
esac
}
myfunction



for var in {1..$number}
do
virt-clone --original $node --name $node-2 --file /VM/$node-$var.img
done


read -p "number: " number
for var in {1..`echo "$number"`}
do
echo "fuck you $var"
done
