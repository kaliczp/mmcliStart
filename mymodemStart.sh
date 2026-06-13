modem=`mmcli -L | awk -F "[" '{print $1}' | awk -F "/" '{print $6}'`
mmcli -m $modem
sudo mmcli -m $modem -e
sudo mmcli -m $modem --simple-connect="apn=internet.telekom,ip-type=ipv4v6"
