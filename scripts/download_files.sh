#!/bin/bash

mkdir /files && cd files

downloadFiles () {

	local url="https://github.com/mmscichowski/docker-oracle-apex-ords"
			   
	local files=(
    oracle-xe_11.2.0-1.0_amd64.debaa
    oracle-xe_11.2.0-1.0_amd64.debab
    oracle-xe_11.2.0-1.0_amd64.debac
    apex_18.1_en.zip
    ords.3.0.9.348.07.16.zip
		tomcat-8.0.11.tar.gz
		jre-7u79-linux-x64.tar.gz
	)

	local i=1
	for part in "${files[@]}"; do
		echo "[Downloading '$part' (part $i/7)]"
		curl --progress-bar --retry 3 -m 60 -o $part -L $url/blob/master/files/$part?raw=true
		i=$((i + 1))
	done
}

downloadFiles
