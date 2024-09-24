# Cluster Information Commands

**1. Get Cluster Information:**

```
kubectl cluster-info
```
#### This command retrieves the details about the Kubernetes master and worker components running in the cluster.

**2. Check Kubernetes Version:**

```
kubectl version
```
#####  Provides detailed version information for both the Kubernetes client and server.


**2. List API Versions:**

```
kubectl api-versions
```
##### This command lists all the supported API versions available in the Kubernetes cluster.

3. **List API Resources:**

```
kubectl api-resources
```
##### Retrieves a list of all available resources (such as pods, services, deployments, etc.) along with their supported verbs (such as get, create, delete, etc.).


# Accessing the Kubernetes API Using `kubectl proxy` and `curl`

This README covers how to use `kubectl proxy` to expose the Kubernetes API and how to interact with it using `curl` commands.

## Starting the Kubernetes API Proxy

1. **Run `kubectl proxy`:**

   ```bash
   kubectl proxy --address='YourMasterNodeIP' --port=8001 --accept-hosts='.' --accept-paths='.' &
   ```
This command starts a local proxy to the Kubernetes API server, allowing you to interact with the API through HTTP without needing to authenticate.

 - --address='YourMasterNodeIP': Specifies the IP address on which the proxy will listen.
 - --port=8001: The port on which the proxy will run.
 - --accept-hosts='.': Accepts requests from any host.
 - --accept-paths='.': Allows requests to any API path.
    The & at the end runs the process in the background.   

2. **Interacting with the API Using curl**

    Once the proxy is running, you can interact with the Kubernetes API using curl.

    Test the API Server Directly (No Proxy):
    ```bash
    curl -k https://YourMasterNodeIP:6443
    ```

3. **Access the API via the Proxy:**
   ```bash
   curl http://YourMasterNodeIP:8001
   ``` 

4. **List Available API Groups:**
   ```bash
   curl http://YourMasterNodeIP:8001/apis
   ```    

5. **Access the Core API v1:**
   ```bash
   curl http://YourMasterNodeIP:8001/api/v1
   ```   

6. **List All Pods**
   ```bash
   curl http://YourMasterNodeIP:8001/api/v1/pods
   ```     