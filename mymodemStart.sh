modem=0
mmcli -m $modem
sudo mmcli -m $modem -e
sudo mmcli -m $modem --simple-connect="apn=internet.telekom,ip-type=ipv4v6"
