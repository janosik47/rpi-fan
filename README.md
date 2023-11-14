# rpi-fan
Trivial Raspberry Pi Fan Service for Ubuntu 23.10

# install
```
sudo cp ./fan.sh /opt/

sudo cp ./fan.service /etc/systemd/system/
sudo cp ./fan.timer /etc/systemd/system/

sudo systemctl enable --now fan.service
```

logs 
```
tail -f /var/log/syslog | grep "RPI Fan Service"
```
