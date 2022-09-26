#!/bin/bash


fdisk /dev/mapper/mpatha

code 8e변경
pvcreate /dev/mapper/mpatha1

vgcreate data_vg /dev/mapper/mpatha1

lvcreate -l 100%FREE -n data_lv data_vg

mkfs.xfs /dev/data_vg/data_lv

#lvextend
