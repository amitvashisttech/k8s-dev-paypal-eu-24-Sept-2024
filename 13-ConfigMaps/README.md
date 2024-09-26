**ConfigMap and Nginx Pod Deployment README**
=============================================

This repository contains a series of commands for creating and deploying a ConfigMap and an Nginx pod in Kubernetes.

### Step 1: Create a ConfigMap from a file

* `cat 1-ConfigMap.yaml`
* `cat reverseproxy.conf`
* `kubectl create configmap nginx-config --from-file=reverseproxy.conf --dry-run`
* `kubectl create configmap nginx-config --from-file=reverseproxy.conf --dry-run -o yaml > 1-ConfigMap.yaml`

### Step 2: Apply the ConfigMap

* `kubectl apply -f 1-ConfigMap.yaml`

### Step 3: Create an Nginx pod

* `cat 2-nginx-pod.yml`
* `kubectl apply -f 2-nginx-pod.yml`

### Step 4: Verify the ConfigMap and pod

* `kubectl get configmap`
* `kubectl get pods`

### Step 5: Create an Nginx service

* `cat 3-nginx-service.yaml`
* `kubectl apply -f 3-nginx-service.yaml`

### Step 6: Verify the service

* `kubectl get svc`
* `kubectl describe svc helloworld-nginx-service`

### Step 7: Verify the pod

* `kubectl get pods`
* `kubectl describe pod helloworld-nginx`

### Step 8: Execute a command in the pod

* `kubectl exec -it helloworld-nginx -c nginx -- bash`

