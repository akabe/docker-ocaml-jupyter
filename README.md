# [akabe/ocaml-jupyter](https://hub.docker.com/r/akabe/ocaml-jupyter/)

| Travis CI | MicroBadger |
| --- | --- |
| [![Build Status](https://travis-ci.org/akabe/docker-ocaml-jupyter.svg?branch=master)](https://travis-ci.org/akabe/docker-ocaml-jupyter) | [![Image Status](https://images.microbadger.com/badges/image/akabe/ocaml-jupyter.svg)](https://microbadger.com/images/akabe/ocaml-jupyter) |

A minimum environment for [Jupyter][jupyter] notebook with [OCaml Jupyter][ocaml-jupyter] kernel.

Probably you are also interested in [akabe/ocaml-jupyter-datascience][ocaml-jupyter-ds], which includes many pre-installed packages for data science and machine learning.

[jupyter]: http://jupyter.org/
[ocaml-jupyter]: https://akabe.github.io/ocaml-jupyter
[ocaml-jupyter-ds]: https://github.com/akabe/docker-ocaml-jupyter-datascience

## Getting started

First, launch a Jupyter server as follows.

```console
$ docker run -it -p 8888:8888 akabe/ocaml-jupyter
[I 15:38:04.170 NotebookApp] Writing notebook server cookie secret to /home/opam/.local/share/jupyter/runtime/notebook_cookie_secret
[W 15:38:04.190 NotebookApp] WARNING: The notebook server is listening on all IP addresses and not using encryption. This is not recommended.
[I 15:38:04.197 NotebookApp] Serving notebooks from local directory: /notebooks
[I 15:38:04.197 NotebookApp] 0 active kernels
[I 15:38:04.197 NotebookApp] The Jupyter Notebook is running at: http://[all ip addresses on your system]:8888/?token=4df0fee0719115f474c8dd9f9281abed28db140d25f933e9
[I 15:38:04.197 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 15:38:04.198 NotebookApp] No web browser found: could not locate runnable browser.
[C 15:38:04.198 NotebookApp]

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=4df0fee0719115f474c8dd9f9281abed28db140d25f933e9
```

Second, access to the URL at the above last line to your web browser, then

![Jupyter with OCaml Jupyter kernel](https://akabe.github.io/ocaml-jupyter/images/screenshot.png)

You can create OCaml notebooks!

Notebooks on your host machine can be mounted to a Docker container by

```
docker run -it -p 8888:8888 -v $PWD:/notebooks akabe/ocaml-jupyter
```

## Distributions

### Default (Alpine)

| Tag | Distribution | OCaml | Dockerfile |
| --- | --- | --- | --- |
| **latest** | Alpine | 4.06.0 | [Dockerfile](dockerfiles/alpine_ocaml4.06.0/Dockerfile) |
| 4.06.0 | Alpine | 4.06.0 | [Dockerfile](dockerfiles/alpine_ocaml4.06.0/Dockerfile) |
| 4.05.0 | Alpine | 4.05.0 | [Dockerfile](dockerfiles/alpine_ocaml4.05.0/Dockerfile) |
| 4.04.2 | Alpine | 4.04.2 | [Dockerfile](dockerfiles/alpine_ocaml4.04.1/Dockerfile) |
| 4.03.0 | Alpine | 4.03.0 | [Dockerfile](dockerfiles/alpine_ocaml4.03.0/Dockerfile) |
| 4.02.3 | Alpine | 4.02.3 | [Dockerfile](dockerfiles/alpine_ocaml4.02.3/Dockerfile) |

### Alpine

| Tag | Distribution | OCaml | Dockerfile |
| --- | --- | --- | --- |
| **alpine** | Alpine | 4.06.0 | [Dockerfile](dockerfiles/alpine_ocaml4.06.0/Dockerfile) |
| alpine_ocaml4.06.0 | Alpine | 4.06.0 | [Dockerfile](dockerfiles/alpine_ocaml4.06.0/Dockerfile) |
| alpine_ocaml4.05.0 | Alpine | 4.05.0 | [Dockerfile](dockerfiles/alpine_ocaml4.05.0/Dockerfile) |
| alpine_ocaml4.04.2 | Alpine | 4.04.2 | [Dockerfile](dockerfiles/alpine_ocaml4.04.1/Dockerfile) |
| alpine_ocaml4.03.0 | Alpine | 4.03.0 | [Dockerfile](dockerfiles/alpine_ocaml4.03.0/Dockerfile) |
| alpine_ocaml4.02.3 | Alpine | 4.02.3 | [Dockerfile](dockerfiles/alpine_ocaml4.02.3/Dockerfile) |

### CentOS

| Tag | Distribution | OCaml | Dockerfile |
| --- | --- | --- | --- |
| **centos** | CentOS 7 | 4.06.0 | [Dockerfile](dockerfiles/centos7_ocaml4.06.0/Dockerfile) |
| centos_4.06.0 | CentOS 7 | 4.06.0 | [Dockerfile](dockerfiles/centos7_ocaml4.06.0/Dockerfile) |
| centos_4.05.0 | CentOS 7 | 4.05.0 | [Dockerfile](dockerfiles/centos7_ocaml4.05.0/Dockerfile) |
| centos_4.04.2 | CentOS 7 | 4.04.2 | [Dockerfile](dockerfiles/centos7_ocaml4.04.1/Dockerfile) |
| centos_4.03.0 | CentOS 7 | 4.03.0 | [Dockerfile](dockerfiles/centos7_ocaml4.03.0/Dockerfile) |
| centos_4.02.3 | CentOS 7 | 4.02.3 | [Dockerfile](dockerfiles/centos7_ocaml4.02.3/Dockerfile) |
| **centos7** | CentOS 7 | 4.06.0 | [Dockerfile](dockerfiles/centos7_ocaml4.06.0/Dockerfile) |
| centos7_4.06.0 | CentOS 7 | 4.06.0 | [Dockerfile](dockerfiles/centos7_ocaml4.06.0/Dockerfile) |
| centos7_4.05.0 | CentOS 7 | 4.05.0 | [Dockerfile](dockerfiles/centos7_ocaml4.05.0/Dockerfile) |
| centos7_4.04.2 | CentOS 7 | 4.04.2 | [Dockerfile](dockerfiles/centos7_ocaml4.04.1/Dockerfile) |
| centos7_4.03.0 | CentOS 7 | 4.03.0 | [Dockerfile](dockerfiles/centos7_ocaml4.03.0/Dockerfile) |
| centos7_4.02.3 | CentOS 7 | 4.02.3 | [Dockerfile](dockerfiles/centos7_ocaml4.02.3/Dockerfile) |

### Debian

| Tag | Distribution | OCaml | Dockerfile |
| --- | --- | --- | --- |
| **debian** | Debian 8 | 4.06.0 | [Dockerfile](dockerfiles/debian8_ocaml4.06.0/Dockerfile) |
| debian_4.06.0 | Debian 8 | 4.06.0 | [Dockerfile](dockerfiles/debian8_ocaml4.06.0/Dockerfile) |
| debian_4.05.0 | Debian 8 | 4.05.0 | [Dockerfile](dockerfiles/debian8_ocaml4.05.0/Dockerfile) |
| debian_4.04.2 | Debian 8 | 4.04.2 | [Dockerfile](dockerfiles/debian8_ocaml4.04.1/Dockerfile) |
| debian_4.03.0 | Debian 8 | 4.03.0 | [Dockerfile](dockerfiles/debian8_ocaml4.03.0/Dockerfile) |
| debian_4.02.3 | Debian 8 | 4.02.3 | [Dockerfile](dockerfiles/debian8_ocaml4.02.3/Dockerfile) |
| **debian8** | Debian 8 | 4.06.0 | [Dockerfile](dockerfiles/debian8_ocaml4.06.0/Dockerfile) |
| debian8_4.06.0 | Debian 8 | 4.06.0 | [Dockerfile](dockerfiles/debian8_ocaml4.06.0/Dockerfile) |
| debian8_4.05.0 | Debian 8 | 4.05.0 | [Dockerfile](dockerfiles/debian8_ocaml4.05.0/Dockerfile) |
| debian8_4.04.2 | Debian 8 | 4.04.2 | [Dockerfile](dockerfiles/debian8_ocaml4.04.1/Dockerfile) |
| debian8_4.03.0 | Debian 8 | 4.03.0 | [Dockerfile](dockerfiles/debian8_ocaml4.03.0/Dockerfile) |
| debian8_4.02.3 | Debian 8 | 4.02.3 | [Dockerfile](dockerfiles/debian8_ocaml4.02.3/Dockerfile) |

### Ubuntu

| Tag | Distribution | OCaml | Dockerfile |
| --- | --- | --- | --- |
| **ubuntu** | Ubuntu 16.04 | 4.06.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.06.0/Dockerfile) |
| ubuntu_4.06.0 | Ubuntu 16.04 | 4.06.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.06.0/Dockerfile) |
| ubuntu_4.05.0 | Ubuntu 16.04 | 4.05.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.05.0/Dockerfile) |
| ubuntu_4.04.2 | Ubuntu 16.04 | 4.04.2 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.04.1/Dockerfile) |
| ubuntu_4.03.0 | Ubuntu 16.04 | 4.03.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.03.0/Dockerfile) |
| ubuntu_4.02.3 | Ubuntu 16.04 | 4.02.3 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.02.3/Dockerfile) |
| **ubuntu16.04** | Ubuntu 16.04 | 4.06.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.06.0/Dockerfile) |
| ubuntu16.04_4.06.0 | Ubuntu 16.04 | 4.06.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.06.0/Dockerfile) |
| ubuntu16.04_4.05.0 | Ubuntu 16.04 | 4.05.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.05.0/Dockerfile) |
| ubuntu16.04_4.04.2 | Ubuntu 16.04 | 4.04.2 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.04.1/Dockerfile) |
| ubuntu16.04_4.03.0 | Ubuntu 16.04 | 4.03.0 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.03.0/Dockerfile) |
| ubuntu16.04_4.02.3 | Ubuntu 16.04 | 4.02.3 | [Dockerfile](dockerfiles/ubuntu16.04_ocaml4.02.3/Dockerfile) |
