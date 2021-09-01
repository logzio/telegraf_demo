#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]];

        then
                if [ -f "/etc/debian_version" ];
                
                        then
                        curl https://github.com/logzio/telegraf_demo/blob/main/telegraf.conf
                        sudo dpkg -i telegraf_1.19.3-1_amd64.deb
                        telegraf -config telegraf.conf

                else              
                        curl https://github.com/logzio/telegraf_demo/blob/main/telegraf.conf
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
