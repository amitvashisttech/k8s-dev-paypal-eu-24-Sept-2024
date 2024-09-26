
# Node Affinity Example in Kubernetes

This README outlines the process for applying node affinity rules to Kubernetes workloads and using node labels to control pod placement.

## Steps to Apply Node Affinity in Kubernetes

### 1. Deploy the Initial Application

First, deploy the application using the `01-helloworld.yaml` file:

```bash
cat 01-helloworld.yaml
kubectl apply -f 01-helloworld.yaml
```

### 2. Check the Status of the Pods

Once deployed, check the status of the pods:

```bash
kubectl get pods
kubectl get pods -o wide
```

### 3. Modify Node Labels

You can label nodes to control where pods are scheduled. For example, label a node with the `env=dev` label:

```bash
kubectl get nodes --show-labels | grep -i env
kubectl label node k8s-worker-1 env=dev
```

To remove a label, use the `env-` option:

```bash
kubectl label node k8s-worker-1 env-
```

### 4. Apply Node Affinity Based on Labels

Now, apply node affinity rules using the `02-helloworld-dev-prod.yaml` file, which schedules pods based on the `env` label:

```bash
cat 02-helloworld-dev-prod.yaml
kubectl apply -f 02-helloworld-dev-prod.yaml
```

Check the wide output to see the node each pod is scheduled on:

```bash
kubectl get pods -o wide
```

### 5. Scaling the Deployment

You can scale the deployment to increase the number of pods:

```bash
kubectl scale --replicas=7 deploy helloworld-deployment
```

Verify the scaling:

```bash
kubectl get pods -o wide
```

### 6. Apply Multiple Affinity Rules

For more complex affinity rules, use `03-helloworld-multi-affinity.yaml` to define multiple affinity preferences:

```bash
cat 03-helloworld-multi-affinity.yaml
kubectl apply -f 03-helloworld-multi-affinity.yaml
```

Verify the pod placement across different nodes:

```bash
kubectl get po -o wide
```

You can also count how many pods are placed on each node:

```bash
kubectl get po -o wide | grep k8s-worker-1 | wc -l
kubectl get po -o wide | grep k8s-worker-2 | wc -l
```

### 7. Scale the Deployment Again

Scale the deployment with more replicas:

```bash
kubectl scale --replicas=10 -f 03-helloworld-multi-affinity.yaml
kubectl get po -o wide
```

### 8. Modify Node Labels for Advanced Affinity

If required, modify node labels to further control pod placement. For example:

```bash
kubectl label node k8s-worker-2 team=engineering-project1
```

Apply the deployment again:

```bash
kubectl apply -f 03-helloworld-multi-affinity.yaml
```

### 9. Verify Labels and Pod Placement

Check node labels and ensure the pods are scheduled as expected:

```bash
kubectl get nodes --show-labels | grep -i env
kubectl get po -o wide
```

### 10. Clean Up Resources

Finally, delete the applied resources when done:

```bash
kubectl delete -f 01-helloworld.yaml
kubectl delete -f 02-helloworld-dev-prod.yaml
kubectl delete -f 03-helloworld-multi-affinity.yaml
```

