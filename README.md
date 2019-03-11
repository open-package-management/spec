# Open Package Management Specification

Welcome to the documentation for the Open Package Management (OPM) Specification! These notes
will provide background and detail for the specification. 

## Goals

OPM aims to address the following:

 - to provide a modular design for a *content* registry
 - to provide a mapping of registry *components* to widely used technologies and tools

Specifically, a *registry* is the combination of components, with the ultimate goal to serve
one or more content types. The *content* of the registry is any kind of artifact or blob that can be transferred 
and hashed. A *component* refers to a definition in OPM that serves a specific purpose for the registry.

The design philosophy is one based on real world applications. Instead of designing a standard and then relying on others to understand how to implement the abstraction, this design starts with observed practices for serving content and creates a set of definitions around that. For an individual new to the specification, instead of needing to understand abstract ideas, you can take a "choose your own adventure" approach. Based on available resources for building, compute, and storage, the new user can assemble a (possibly unique) set of components that meet the goals of a full registry. When enough implementations have been documented or shared by the community and cloud providers, it comes down to choosing a template that is most well liked.

## Registry Components

We will start by describing the actual components, since this maps to a set of ideas that are likely well known.
A specific registry is not required to include all of these components, as long as it meets the desired goals stated above. After we describe these components, we will discuss the design ideas behind them. A registry consists of (one or more) of the following components:

### Tags

A tag is a reference to a content-addressable blob that serves as an entrypoint to anything from a single OCI image to a Helm chart.

### Repositories

A repository is a logical collection of tags that
contain different versions/tags of the same content type.
For example, an application "Foo" would use a repository to
publish different image versions:

```
*Repository Foo
-> Foo-v1.0.0
-> Foo-v2.0.0
-> Foo-v3.0.0
```

### Projects

A project is a logical collection of repositories with
different content types. For example, Kubernetes could use
projects to manage all of its components as well as
OS-specific packages and build dependencies:

```
*Project Kubernetes
-> kube-apiserver
-> kube-scheduler
-> kube-controller
-> build-deps
-> kubernetes-rpm
-> kubernetes-deb
-> kubernetes-helm
```

### Namespaces

A namespace is a user-defined grouping of projects.
Continuing with the kubernetes example, the CNFC could use
a single namespace to manage all of its projects:

```
*Namespace CNCF
-> kubernetes
-> helm
-> etcd
```

