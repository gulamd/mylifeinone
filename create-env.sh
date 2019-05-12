#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating www.gamutkart$i container.."
    sleep 1
    echo "india@123456789" | sudo -S docker run -it --name www.gamutkart$i -d --rm rgulamd/ppt /bin/bash
echo "www.gamutkart$i container has been created!"
	echo "=============================="
done
