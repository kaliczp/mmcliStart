modem=`mmcli -L | awk -F "[" '{print $1}' | awk -F "/" '{print $6}'`
mmcli -m $modem
sudo mmcli -m $modem -e
sudo mmcli -m $modem --simple-connect="apn=internet.telekom,ip-type=ipv4v6"
exec env bearer=mmcli -m $modem | grep Bearer | awk -F "/" '{print $6}'
# IP ASSIGN
excec nev curripaddr=mmcli -b $modem | grep address | awk -F ":" '{print $2}'
sudo ip link set wwan0 up
sudo ip addr add $curripaddr/32 dev wwan0
sudo ip route add default dev wwan0
