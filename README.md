# zimbrafirewall for CentOS 7

This scripts helps to install firewall and add zimbra required ports.

Ports to be enabled by firewall are 22 25 110 143 389 443 465 587 993 995 7071 7023 7025 8443
If you want add or remove ports, change the ports value in zimbrafirewall.sh as per your required.


#### Download the file by
```bash
wget https://raw.githubusercontent.com/indharajith/zimbrafirewall/master/zimbrafirewall.sh
```

#### Add execute permission
```bash
sudo chmod +x zimbrafirewall.sh
```
#### Run the file
```bash
sudo ./zimbrafirewall.sh
```
