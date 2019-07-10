#!/bin/bash

echo "checking OS version"

os_version=`rpm -qa *release | grep -Ei "centos|redhat|cloudlinux" | cut -d "-" -f3`

if [ $os_version == "7" ];
then
 echo "version 7"
else
 echo "***unsupported version***"
 sleep 3
 exit 1
fi

echo "Checking for firewall"
STATUS=`systemctl is-active firewalld`

port_adding ()
{
ports=(22 25 110 143 389 443 465 587 993 995 7071 7023 7025 8443)
for i in "${ports[@]}";
do
echo "adding port $i";
firewall-cmd --add-port=$i/tcp --permanent
done
echo "Reloading firewall"
firewall-cmd --reload
} 

if [ $STATUS == "active" ];
then
 echo "active"
 port_adding
 echo "calling port_adding function";
else
 echo "inactive"
 yum -y install firewalld;
 systemctl start firewalld;
 systemctl enable firewalld;
 port_adding
fi
