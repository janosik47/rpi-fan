# rpi-fan
Trivial Raspberry Pi Fan Service for Ubuntu 23.10
<br><br>

Controls the fan, turning it ON if CPU temp is above 80[C] and turning it OFF it temp is below 70[C]
<br><br>

CPU temp comes from `/sys/class/thermal/thermal_zone0/temp`

FAN state control flag `/sys/class/thermal/cooling_device0/cur_state`

## install
```
sudo cp ./fan.sh /opt/
sudo chmod a+x /opt/fan.sh

sudo cp ./fan.service /etc/systemd/system/
sudo cp ./fan.timer /etc/systemd/system/
sudo chmod a+r /etc/systemd/system/fan.*

sudo systemctl enable --now fan.service
```

## logs 
```
tail -f /var/log/syslog | grep "RPI Fan Service"
```
