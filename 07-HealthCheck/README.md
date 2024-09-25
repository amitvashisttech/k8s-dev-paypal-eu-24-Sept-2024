## Events: 
```
root@master:# kubectl events
```
```
root@master:# kubectl events --for pod/busybox
LAST SEEN              TYPE      REASON      OBJECT        MESSAGE
32m                    Normal    Scheduled   Pod/busybox   Successfully assigned default/busybox to worker1
32m                    Normal    Pulling     Pod/busybox   Pulling image "busybox:1.28"
32m                    Normal    Pulled      Pod/busybox   Successfully pulled image "busybox:1.28" in 2.529s (2.529s including waiting)
30m (x4 over 32m)      Normal    Pulled      Pod/busybox   Container image "busybox:1.28" already present on machine
30m (x5 over 32m)      Normal    Created     Pod/busybox   Created container busybox
30m (x5 over 32m)      Normal    Started     Pod/busybox   Started container busybox
117s (x142 over 32m)   Warning   BackOff     Pod/busybox   Back-off restarting failed container busybox in pod busybox_default(a7002f55-3fbb-40b8-863e-87cfe3e7d1c1)
root@master:# 
```