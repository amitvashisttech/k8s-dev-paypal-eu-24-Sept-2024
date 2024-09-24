# Managing Kubernetes Replication Controllers

This README outlines how to create, manage, and scale a Kubernetes `ReplicationController` using a YAML file and `kubectl` commands.

## Steps to Create and Manage the ReplicationController

1. **Go to Directory for the ReplicationController:**

   ```bash
    cd 04-Replication-Cantroller/
   ```

2. **Create the ReplicationController YAML File:**

    ```bash
     cat helloworld-rc.yaml
    ```


3. **Checks if the helloworld-rc.yaml file exists in the current directory & Apply the ReplicationController YAML:**
    ```
    ls 
    kubectl apply -f helloworld-rc.yaml
    ```
    This command creates the ReplicationController and the pods defined in the helloworld-rc.yaml manifest.



4. **Get the ReplicationController Details:**

   ```bash

   kubectl get rc
   ```
   Lists the currently running ReplicationControllers in the cluster, along with the number of desired and available replicas.

5. **Describe the ReplicationController:**

   ```bash

   kubectl describe rc helloworld-controller
   kubectl get pods 
   ```
   Provides detailed information about the helloworld-controller ReplicationController, including its current state, events, and managed pods.

6. **Delete Specific Pods:**

   ```bash

   kubectl delete pod helloworld-controller-x569j helloworld-controller-d8mjc
   ```
      Deletes two specific pods (helloworld-controller-x569j and helloworld-controller-d8mjc) managed by the helloworld-controller. The ReplicationController will automatically replace these pods to maintain the desired number of replicas.

7. **Scale the ReplicationController (Set to 1 Replica):**

   ```bash

   kubectl scale --replicas=1 rc helloworld-controller
   kubectl get rc,pods 

   ```
   Scales down the helloworld-controller to only 1 replica. The kubectl scale command allows you to manually adjust the number of pods the controller manages.

8. **Delete Another Pod:**

   ```bash

   kubectl delete pod helloworld-controller-n9n8k
   ```
   Deletes another specific pod. The ReplicationController will again ensure that the desired number of replicas is running.

9. **Scale the ReplicationController to 5 Replicas:**

   ```bash
   kubectl scale --replicas=5 rc helloworld-controller
   kubectl get po -o wide 
   ```
   Scales up the helloworld-controller to manage 5 replicas.

10. **Delete a Different Pod:**

   ```bash
   kubectl delete pod hello-k8s-2
   ```
   Deletes another specific pod named hello-k8s-2. The ReplicationController will replace it to maintain the correct number of replicas.


11. **Delete the ReplicationController:**

   ```bash
   kubectl delete -f helloworld-rc.yaml
   ```
   Deletes the ReplicationController and the pods it manages by removing the applied configuration from the cluster.