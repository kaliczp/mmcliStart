modem=`mmcli -L | awk -F "[" '{print $1}' | awk -F "/" '{print $6}'`
sudo mmcli -m $modem --simple-disconnect
bearer=`mmcli -m 0 | grep Bearer | awk -F "/" '{print $6}'`
curripaddr=`mmcli -b 0 | grep address | awk -F ":" '{print $2}'`
sudo mmcli -m $modem --delete-bearer=$bearer
sudo mmcli -m=$modem --disable
sudo ip a del $curripaddr/32 dev wwan0
sudo ip link set wwan0 down
sudo mmcli -m $modem --set-power-state-off
