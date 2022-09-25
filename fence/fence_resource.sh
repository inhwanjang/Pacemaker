#!/bin/bash

pcs stonith create fence_a fence_ipmilan pcmk_host_list="ha1.hb.com" ipaddr=192.168.0.50 ipport=6230 login='admin' passwd='dlatl00' lanplus=on auth=password delay=15 power_wait=20
pcs stonith create fence_b fence_ipmilan pcmk_host_list="ha2.hb.com" ipaddr=192.168.0.50 ipport=6231 login='admin' passwd='dlatl00' lanplus=on auth=password power_wait=20
