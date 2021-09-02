#!/bin/bash
if [[ $TYPE == "system" ]];

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
                        ./telegraf --config telegraf.conf
                fi

elif [[ "$OSTYPE" == "darwin"* ]];

        then
        
        curl -L https://dl.influxdata.com/telegraf/releases/telegraf-1.19.3_darwin_amd64.dmg -o telegraf-1.19.3_darwin_amd64.dmg
        hdiutil attach telegraf-1.19.3_darwin_amd64.dmg
        mv telegraf.conf ~/Documents/telegraf.conf
        cd /Volumes || exit
        Telegraf -config ~/Documents/telegraf.conf
        
elif [[ "$OSTYPE" == "win32" ]]; 
        
        then
        
        wget https://dl.influxdata.com/telegraf/releases/telegraf-1.19.3_windows_amd64.zip -UseBasicParsing -OutFile telegraf-1.19.3_windows_amd64.zip
        Expand-Archive '.\telegraf-1.19.3_windows_amd64.zip' -DestinationPath 'C:\Program Files\InfluxData\telegraf\'
        'C:\Program Files\InfluxData\Telegraf\telegraf-1.19.3\telegraf.exe' -config '.\telegraf_demo/telegraf.conf'
else

        echo "Sorry, this demo does not support your operation system"

fi
