Easy way to spin up a multi-node kubernetes cluster locally using vagrant.  Inspired by: https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/

# Usage

* clone repo
* `vagrant up`
* To specify number of worker nodes `NODE_COUNT=2 vagrant up`

After `vagrant up` is finished run `KUBECONFIG=config kubectl get nodes` to verify it worked.  Should see:

```
NAME         STATUS   ROLES    AGE     VERSION
k8s-master   Ready    master   4m22s   v1.17.3
node-1       Ready    <none>   2m26s   v1.17.3
node-2       Ready    <none>   35s     v1.17.3
```
