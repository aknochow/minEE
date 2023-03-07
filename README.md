# minEE (minimal Execution Environment)

minEE is a lightweight runner image intended to be used as an Ansible AWX Execution Environment. 

Minimal redhat base os images (ubi, centos, fedora) provide a small footprint and use microdnf for package management.

## Flavors:
#### cs9 - CentOS Stream 9 (default/latest)
#### ubi9 - Red Hat 9.1
#### f37 - Fedora 37

## Image details
### x86_64
```
REPOSITORY                                TAG               IMAGE ID       CREATED          SIZE
quay.io/aknochow/minee                    latest            e125726f6027   34 minutes ago   273 MB
quay.io/aknochow/minee                    cs9               e125726f6027   34 minutes ago   273 MB
quay.io/aknochow/minee                    f37               93e0bf1fd422   5 minutes ago    307 MB
quay.io/aknochow/minee                    ubi9              df51e3ff2baa   31 minutes ago   270 MB
(base images:)
quay.io/centos/centos                     stream9-minimal   9494c5d6b8c6   5 days ago       99 MB
registry.access.redhat.com/ubi9-minimal   latest            3135bd90aad6   11 days ago      97.5 MB
quay.io/fedora/fedora-minimal             37                7dc37554d8cb   11 days ago      101 MB
```
_Built with:_
```
buildah version 1.27.3 (image-spec 1.0.2-dev, runtime-spec 1.0.2-dev)
Red Hat Enterprise Linux release 9.1 (Plow)
5.14.0-162.12.1.el9_1.x86_64
```

### aarch64
```
REPOSITORY                                TAG               IMAGE ID       CREATED          SIZE
quay.io/aknochow/minee                    arm               72a3378ea0c3   51 minutes ago   282 MB
quay.io/aknochow/minee                    cs9-arm           72a3378ea0c3   51 minutes ago   282 MB
quay.io/aknochow/minee                    ubi9-arm          6dd3544bbfc0   45 minutes ago   279 MB
quay.io/aknochow/minee                    f37-arm           cf0440af4daf   43 minutes ago   320 MB
quay.io/aknochow/minee                    ubi9-arm          6dd3544bbfc0   45 minutes ago   279 MB
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
