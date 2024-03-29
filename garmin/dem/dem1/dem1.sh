#!/bin/bash
set +x

#http://viewfinderpanoramas.org/Coverage%20map%20viewfinderpanoramas_org1.htm

URL=http://viewfinderpanoramas.org/dem1/


for i in G H I J K L M N O P Q R S T U SA SB SC SD SE SF SG SH SI SJ SK SL SM SN
do
	for j in `seq -w 1 60`
	do
		final_file=${i}${j}.zip && echo $final_file
		final_url=${URL}${final_file}
		if ! [ -f $final_file ]; then
			curl -I -s ${final_url} | grep -q "Content-Type: application/zip" && curl -LO ${final_url}
		fi
	done
done
