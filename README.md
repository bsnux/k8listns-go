# k8listns-go

Simple example for using [Go](https://golang.org/) for
accessing to [Kubernetes](https://kubernetes.io).

This program displays namespaces names for default configured context.

We assuming you have a valid `~/.kube/config` file and access to given
Kubernentes cluster.

## Compiling and running

Compiling for MacOS:

```
$ make macos
```

Compiling for Linx:

```
$ make linux
```

## Usage

```
$ ./bin/listns
```

On linux:

```
$ ./bin/listns-linux
```
