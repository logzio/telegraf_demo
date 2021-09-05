#!/bin/bash
if [[ $1 == "system" ]];

        then
        
        curl -L https://raw.githubusercontent.com/logzio/telegraf_demo/main/telegraf_system.conf -o telegraf.conf        
        
else

        echo "Sorry, we don't have a configuration file for this type"

fi



if [[ "$OSTYPE" == "linux-gnu"* ]];

        then
                if [ -f "/etc/debian_version" ];
                
                        then
                        
                        curl -L https://dl.influxdata.com/telegraf/releases/telegraf_1.19.3-1_amd64.deb -o telegraf_1.19.3-1_amd64.deb
                        sudo dpkg -i telegraf_1.19.3-1_amd64.deb
                        telegraf -config telegraf.conf

                else              
                        curl -L https://dl.influxdata.com/telegraf/releases/telegraf-1.19.3_linux_amd64.tar.gz -o telegraf-1.19.3_linux_amd64.tar.gz
                        tar -xf telegraf-1.19.3_linux_amd64.tar.gz
                        telegraf-1.19.3/usr/bin/./telegraf --config telegraf.conf
                fi

elif [[ "$OSTYPE" == "darwin"* ]];

        then
        
        curl -L https://dl.influxdata.com/telegraf/releases/telegraf-1.19.3_darwin_amd64.tar.gz -o telegraf-1.19.3_darwin_amd64.tar.gz
        tar -xf telegraf-1.19.3_darwin_amd64.tar.gz
        env CGO_ENABLED=1 go build ./cmd/telegraf
        telegraf-1.19.3/usr/bin/./telegraf --config telegraf.conf
        
else

        echo "Sorry, this demo does not support your operation system"

fi
