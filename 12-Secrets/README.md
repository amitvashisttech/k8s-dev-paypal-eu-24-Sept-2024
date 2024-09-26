
# Kubernetes Secrets and Volumes Example

This README provides a step-by-step guide for creating Kubernetes secrets, deploying an application using secret volumes, and managing pods with those secrets.

## Steps to Create Secrets and Deploy Using Secret Volumes

### 1. Create Username and Password Files

First, store the username and password in text files:

```bash
echo "Aristocart" > /root/username.txt  
echo "Aristocart@432!" > /root/password.txt
```

### 2. Verify the Contents of the Files

Check the contents of the files to ensure they are created correctly:

```bash
cat /root/username.txt
cat /root/password.txt
```

### 3. Create Kubernetes Secret from Files

Create a Kubernetes secret named `mysecrets` using the username and password files:

```bash
kubectl create secret generic mysecrets --from-file=/root/username.txt --from-file=/root/password.txt
```

### 4. Verify Secret Creation

List all secrets and describe the `mysecrets` secret:

```bash
kubectl get secrets
kubectl describe secrets mysecrets
```

### 5. Edit the Secret

If needed, edit the secret using the following command:

```bash
kubectl edit secrets mysecrets
```

### 6. Change Directory for Secrets YAML Files

Change directory and navigate into it to store YAML configuration files related to secrets:

```bash
cd 12-Secrets/
kubectl apply -f 1-helloworld-secrets.yaml
kubectl  describe secrets
```

### 7. Create Secret Volume Deployment

Create a deployment YAML that uses the secrets as volumes. For example, create a file named `helloworld-secrets-volumes.yaml`:

```bash
vim 2-helloworld-secrets-volumes.yaml
```

### 8. Apply the Deployment

Apply the deployment file to create the pods and the secret volumes:

```bash
kubectl create -f 2-helloworld-secrets-volumes.yaml
```

### 9. Verify Deployment and Pod Status

Check the status of the deployment and pods:

```bash
kubectl get deploy
kubectl get pods
kubectl describe pods helloworld-deployment-<pod-id>
```

### 10. Access the Pod and Verify Secrets

Use `kubectl exec` to enter the running pod and verify the secret files mounted as volumes:

```bash
kubectl exec -it helloworld-deployment-<pod-id> -- sh
cd /etc/creds
cat /etc/mysecrets/username.txt
cat /etc/mysecrets/password.txt
```

You can use different methods to access the pod such as:

```bash
kubectl exec -it helloworld-deployment-<pod-id> -- /bin/sh
```

### 11. Clean Up Resources

Delete the deployed resources:

```bash
kubectl delete -f helloworld-secrets-volumes.yaml
```

### 12. Encode Secrets in Base64

If you prefer to encode secrets in base64 manually, you can use the following commands:

```bash
echo -n "paypal" | base64
echo -n "paypal@432!" | base64
```

### 13. Create the Secret from Base64 Encoded Data

Create or update the secrets in the YAML file and apply the secret configuration again:

```bash
vim helloworld-secrets.yaml
kubectl create -f 09-Secrets/
```

### 14. Verify and Manage Pods

After deployment, verify the running pods and access them as needed:

```bash
kubectl get pods
kubectl exec -it helloworld-deployment-<pod-id> -- /bin/sh
```

