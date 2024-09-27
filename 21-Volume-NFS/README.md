# Setting up NFS Server for K8s PV Demo. 

## Install Nfs Server om Master Node.
```
apt-get install nfs-kernel-server -y 
mkdir /myshare
chown nobody:nogroup /myshare
```

## NFS Export Path & Share Config, please update the /etc/export file about your NFS Share Config.

```
root@kube-master:# echo "/myshare  *(rw,sync,no_subtree_check)" >> /etc/exports
root@kube-master:#  grep -i myshare /etc/exports
/myshare  *(rw,sync,no_subtree_check)
root@kube-master:#
```

## Restart the NFS Server Service
```
systemctl restart nfs-kernel-server ; systemctl status  nfs-kernel-server
```

## Vertify the NFS Share
```
showmount -e localhost 
```


# On Clinet / Worker Nodes 

## Install NFS Clinet Utils 
```
apt-get install nfs-common -y
mount -t nfs 172.31.0.100:/myshare /mnt/
hostname >> /mnt/hostname.txt ; umount /mnt
```
