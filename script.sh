#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]];

        then
                if [ -f "/etc/debian_version" ];
                
                        then
                        sudo apt update && sudo apt -y upgrade
                        sudo apt install -y gnupg2 curl wget
                        wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
                        echo "deb https://repos.influxdata.com/debian buster stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
                        sudo apt update
                        sudo apt -y install telegraf
                        telegraf -config telegraf.conf

                else
                
                        wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.8.x86_64.rpm
                        sudo yum localinstall influxdb2-2.0.8.x86_64.rpm
                        wget https://dl.influxdata.com/telegraf/releases/telegraf-1.19.3-1.x86_64.rpm
                        sudo yum localinstall telegraf-1.19.3-1.x86_64.rpm
                        telegraf -config telegraf.conf
                fi

elif [[ "$OSTYPE" == "darwin"* ]];

        then
        brew update
        brew install telegraf
        telegraf -config telegraf.conf

else

        echo "Sorry, this demo does not support your operation system"

fi
