#maybe to gateway

read -p "gateway : " gateway

pcs resource create ping ping dampen=5s multiplier=1000 host_list=$gateway --clone

y
