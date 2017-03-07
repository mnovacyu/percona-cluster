wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum -y update
yum install -y pacemaker corosync

# set up corosync
cp /root/shared/example-authkey /etc/corosync/authkey
cp /root/shared/corosync.conf /etc/corosync/corosync.conf
ip=`hostname -I | awk '/192.168.101/{print $NF}'`
sed -ie "s/192.168.101.xxx/$ip/g" /etc/corosync/corosync.conf
systemctl start corosync

# set up pacemaker
mkdir /etc/corosync/service.d/
cp /root/shared/pacemaker /etc/corosync/service.d/pacemaker
systemctl start pacemaker

# set up mysql
yum install -y mysql-server
systemctl start mysqld
