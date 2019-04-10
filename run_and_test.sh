#!/bin/bash

docker build -t java_http_img .
status="$?"
if [[ "$status" -ne 0 ]]; then
	echo "${status} = status of docker build (0 is ok)"
	echo "Somthing went wrong, when we build image"
	exit;
else
	docker run -d -p 8080:8080 --name java_web_server java_http_img
	status="$?"
	if [[ "$status" -ne 0 ]]; then
		 echo "${status} = status of docker run (0 is ok)"
		 echo "Somthing went wrong when we run container"
        	 exit;
	elif [[ "$status" -eq 0 ]]; then
		echo "${status} = status of docker run (0 is ok)"
		sleep 3
		a=`curl -s -o /dev/null -I -w "%{http_code}" 127.0.0.1:8080`
		echo "${a} = http code (200 is ok)"
	fi
fi

