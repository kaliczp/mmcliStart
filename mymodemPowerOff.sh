modem=`mmcli -L | awk -F "[" '{print $1}' | awk -F "/" '{print $6}'`
sudo mmcli -m $modem --set-power-state-off
