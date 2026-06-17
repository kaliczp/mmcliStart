modem=`mmcli -L | awk -F "[" '{print $1}' | awk -F "/" '{print $6}'`
# grep the Bearer line get the bearer number and remove white spaces with xargs
bearer=$(mmcli -m $modem | grep Bearer | awk -F "/" '{print $6}' | xargs)
# Reset the settings if bearer number found
if [[ "$bearer" =~ ^[0-9]+$ ]]; then
    sudo mmcli -m $modem --simple-disconnect
    curripaddr=$(mmcli -b $bearer | grep address | awk -F ":" '{print $2}')
    sudo mmcli -m $modem --delete-bearer=$bearer
    sudo mmcli -m $modem --disable
    sudo ip a del $curripaddr/32 dev wwan0
    sudo ip link set wwan0 down
else
    echo "No bearer found. Modem poweroff"
fi
sudo mmcli -m $modem --set-power-state-off
