#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]];

        then
                if [ -f "/etc/debian_version" ];
                
                        then
                        curl -L https://raw.githubusercontent.com/logzio/telegraf_demo/main/telegraf.conf -o telegraf.conf
                        curl -L https://dl.influxdata.com/telegraf/releases/telegraf_1.19.3-1_amd64.deb -o telegraf_1.19.3-1_amd64.deb
                        sudo dpkg -i telegraf_1.19.3-1_amd64.deb
                        telegraf -config telegraf.conf

                else              
                        curl -L https://raw.githubusercontent.com/logzio/telegraf_demo/main/telegraf.conf -o telegraf.conf
                        curl -L https://dl.influxdata.com/telegraf/releases/telegraf-1.19.3_linux_amd64.tar.gz -o telegraf-1.19.3_linux_amd64.tar.gz
                        tar xf telegraf-1.19.3_linux_amd64.tar.gz
                        cd telegraf
                        telegraf -config ./telegraf.conf
                fi

elif [[ "$OSTYPE" == "darwin"* ]];

        then
        curl -L https://raw.githubusercontent.com/logzio/telegraf_demo/main/telegraf.conf -o telegraf.conf
        telegraf-1.19.3_darwin_amd64.dmg
        telegraf -config telegraf.conf

else

        echo "Sorry, this demo does not support your operation system"

fi
