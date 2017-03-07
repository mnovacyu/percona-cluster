yum update
yum install -y pacemaker corosync
cp /root/shared/example-authkey /etc/corosync/authkey
cp /root/shared/corosync.conf /etc/corosync/corosync.conf
ip=`hostname -I | awk '/192.168.101/{print $NF}'`
sed -ie "s/192.168.101.xxx/$ip/g" /etc/corosync/corosync.conf
systemctl start corosync
mkdir /etc/corosync/service.d/
cp /root/shared/pacemaker /etc/corosync/service.d/pacemaker
systemctl start pacemaker
