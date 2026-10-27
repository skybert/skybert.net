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

## Logs

Tail the `spicedb-operator` logs. This is useful to debug issues with
the "instance" that the operator manages.:

```text
$ kubectl logs -n spicedb-operator deployment/spicedb-operator -f
```

