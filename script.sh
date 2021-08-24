#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]];
        then

        sudo yum update && sudo yum -y upgrade
        sudo yum install -y gnupg2 curl wget
        wget -qO- https://repos.influxdata.com/influxdb.key | sudo yum add -
        echo "deb https://repos.influxdata.com/debian buster stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
        sudo yum update
        sudo yum -y install telegraf
        telegraf -config telegraf.conf


elif [[ "$OSTYPE" == "darwin"* ]];
        then
        brew update
        brew install telegraf
        telegraf -config telegraf.conf

# elif [[ "$OSTYPE" == "cygwin" ]]; # POSIX compatibility layer and Linux environment emulation for Windows
#         then
#         echo "hello"
# elif [[ "$OSTYPE" == "msys" ]]; # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
#         then
#         echo "hello"
# elif [[ "$OSTYPE" == "win32" ]]; 
#         then
#         cd Downloads
#         wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.8-windows-amd64.zip -UseBasicParsing -OutFile influxdb2-2.0.8-windows-amd64.zip
#         Expand-Archive .\influxdb2-2.0.8-windows-amd64.zip -DestinationPath 'C:\Program Files\InfluxData\influxdb\'
#         Expand-Archive .\telegraf.zip 'C:\Program Files\'
#         mkdir 'C:\Program Files\telegraf\conf'
#         cd 'C:\Program Files\telegraf\conf'
#         copy ..\telegraf.conf inputs.conf
#         .\telegraf --config-directory 'C:\Program Files\telegraf\conf' --test

# elif [[ "$OSTYPE" == "freebsd"* ]]; 
#         then
#         sudo pkg install telegraf
#         sysrc telegraf_enable=yes
#         service telegraf start
else
        echo "Sorry, this demo does not support your operation system"

fi
