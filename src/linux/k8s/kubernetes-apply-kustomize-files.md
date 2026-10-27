title: Apply kustomize.yaml files to Your Kubernetes Cluster
date: 2026-10-27
category: linux
tags: linux, k8s, kubernetes, containers

## Dry run

View changes in local files against what's running in k8s:

```text
$ kubectl diff -k k8s/base/infrastructure/spicedb-operator
namespace/spicedb unchanged
secret/dev-spicedb-secret configured
spicedbcluster.authzed.com/dev unchanged
```

## Apply changes in local files to the Kubernetes cluster

Apply changes in local files against the k8s cluster. First, be sure
that we're using the correct k8s cluster:

```text
$ kubectl config use-context kind-foo-fga
$ kubectl apply -k k8s/overlays/local/spicedb-operator
```

## Delete everything set up with the local files

This is the opposite of `kubectl apply`:
```text
$ kubectl delete -k k8s/overlays/local/spicedb
```

## Logs

Tail the `spicedb-operator` logs. This is useful to debug issues with
the "instance" that the operator manages.:

```text
$ kubectl logs -n spicedb-operator deployment/spicedb-operator -f
```

## Inspect a Kubernetes object

Inspect the ingress object:
```perl
$ kubectl -n spicedb describe ingress spicedb
Name:             spicedb
Labels:           <none>
Namespace:        spicedb
Address:          10.96.247.152
Ingress Class:    kong
Default backend:  <default>
Rules:
  Host                        Path  Backends
  ----                        ----  --------
  spicedb.foo-fga.local
                              /   spicedb-service:50051 (10.244.0.23:50051)
Annotations:                  konghq.com/https-redirect-status-code: 301
                              konghq.com/protocols: grpc,grpcs
Events:                       <none>
```

## Inspect metadata annotations

Get the metadata annotations of the service:

```perl
$ kubectl -n spicedb get svc spicedb-service -o jsonpath='{.metadata.annotations}' | jq
{
  "authzed.com/controller-component-hash": "9ae583ac0f4890dc",
  "konghq.com/protocol": "grpc"
}

```
