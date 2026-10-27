title: List Container Images in a Kubernetes Cluster
date: 2026-01-09
category: linux
tags: linux, containers, kubernetes


To get all Kubernetes images in all namespaces, use the following
command:

```perl
$ kubectl get pods \
    --all-namespaces \
    --output jsonpath="{.items[*].spec['initContainers', 'containers'][*].image}" | 
  sed 's# #\n#g' | 
  sort -u
```

This is both useful to see what components are running and what their
versions are, as this is listed with the image name, e.g.:

```ini
registry.k8s.io/coredns/coredns:v1.13.1
registry.k8s.io/etcd:3.6.6-0
registry.k8s.io/kube-apiserver:v1.35.0
registry.k8s.io/kube-controller-manager:v1.35.0
registry.k8s.io/kube-proxy:v1.35.0
registry.k8s.io/kube-scheduler:v1.35.0
```

Happy hacking!
