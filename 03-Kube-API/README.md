## Cluster Information Commands

#### 1. Get Cluster Information:

```
kubectl cluster-info
```
#### This command retrieves the details about the Kubernetes master and worker components running in the cluster.

#### 2. Check Kubernetes Version:

```
kubectl version
```
#####  Provides detailed version information for both the Kubernetes client and server.


#### 2. List API Versions:

```
kubectl api-versions
```
##### This command lists all the supported API versions available in the Kubernetes cluster.

#### 3. List API Resources:

```
kubectl api-resources
```
##### Retrieves a list of all available resources (such as pods, services, deployments, etc.) along with their supported verbs (such as get, create, delete, etc.).