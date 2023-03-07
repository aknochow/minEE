# minEE (minimal Execution Environment)

minEE is a lightweight runner image intended to be used as an Ansible AWX Execution Environment. 

Minimal redhat base os images (ubi, centos, fedora) provide a small footprint and use microdnf for package management.

## Flavors:
#### cs9 - CentOS Stream 9 (default/latest) 
`ansible python version: 3.9.16 (/usr/bin/python3)`
#### ubi9 - Red Hat 9.1 
`ansible python version: 3.9.14 (/usr/bin/python3)`
#### f37 - Fedora 37
`ansible python version: 3.11.2 (/usr/bin/python3)`

## Image details
### x86_64
```
REPOSITORY                               TAG              IMAGE ID       CREATED         SIZE
quay.io/aknochow/minee                   latest           92bde12e6a7e   4 minutes ago   257 MB
quay.io/aknochow/minee                   cs9              92bde12e6a7e   4 minutes ago   257 MB
quay.io/aknochow/minee                   ubi9             7e64c5e4f1b3   3 minutes ago   250 MB
quay.io/aknochow/minee                   f37              73c64f46ce17   2 minutes ago   286 MB
(base images:)
quay.io/centos/centos                    stream9-minimal  9494c5d6b8c6   5 days ago       99 MB
registry.access.redhat.com/ubi9-minimal  latest           3135bd90aad6   11 days ago      97.5 MB
quay.io/fedora/fedora-minimal            37               7dc37554d8cb   11 days ago      101 MB
```
_Built with:_
```
buildah version 1.27.3 (image-spec 1.0.2-dev, runtime-spec 1.0.2-dev)
Red Hat Enterprise Linux release 9.1 (Plow)
5.14.0-162.12.1.el9_1.x86_64
```

### aarch64
```
REPOSITORY                                TAG               IMAGE ID       CREATED         SIZE
quay.io/aknochow/minee                    arm               aa8c507d3678   4 minutes ago   270 MB
quay.io/aknochow/minee                    cs9-arm           aa8c507d3678   4 minutes ago   270 MB
quay.io/aknochow/minee                    ubi9-arm          562e3117b764   4 minutes ago   263 MB
quay.io/aknochow/minee                    f37-arm           3e5a0418f5fa   3 minutes ago   303 MB
(base images:)
quay.io/centos/centos                     stream9-minimal   82d704893174   5 days ago       103 MB
registry.access.redhat.com/ubi9-minimal   latest            74a2930150ef   11 days ago      101 MB
quay.io/fedora/fedora-minimal             37                638e504026c8   11 days ago      109 MB
```
_Built with:_
```
buildah version 1.29.1 (image-spec 1.0.2-dev, runtime-spec 1.0.2-dev)
Fedora CoreOS 37.20230205.3.0
6.1.9-200.fc37.aarch64
```
