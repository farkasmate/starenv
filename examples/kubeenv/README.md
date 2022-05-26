# EXAMPLE - kubeenv

[Kubectl][kubectl] version manager made using [starenv][].

[kubectl]: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
[starenv]: https://github.com/farkasmate/starenv

## Install

1. Install with [whalebrew][].

```shell
whalebrew install kubeenv:latest
```

2. Create tool directory.

```shell
mkdir ~/.kubectl
```

3. Add tool to `PATH`.

```shell
export PATH="~/.kubectl/bin:${PATH}"
```

4. Optionally, enable auto-install.

```shell
export KUBEENV_AUTO_INSTALL=true
```

## Usage

```text
$ kubeenv --help
NAME
    kubeenv

SYNOPSIS
    kubeenv TOOL [ARGUMENTS...]
    kubeenv [-h | --help]

COMMON FLAGS
    -h, --help
        Display help for this tool

TOOLS
    install - Install a specific version of kubeenv
    list - List all installed versions
    use - Switch a version to use
```
