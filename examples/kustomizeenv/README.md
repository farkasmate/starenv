# EXAMPLE - kustomizeenv

[Kustomize][kustomize] version manager made using [starenv][].

[kustomize]: https://kustomize.io/
[starenv]: https://github.com/farkasmate/starenv

## Install

1. Install with [whalebrew][].

```shell
whalebrew install matefarkas/kustomizeenv:latest
```

2. Create tool directory.

```shell
mkdir ~/.kustomize
```

3. Add tool to `PATH`.

```shell
export PATH="~/.kustomize/bin:${PATH}"
```

4. Optionally, enable auto-install.

```shell
export KUSTOMIZEENV_AUTO_INSTALL=true
```

[whalebrew]: https://github.com/whalebrew/whalebrew

## Usage

```text
$ kustomizeenv --help
NAME
    kustomizeenv

SYNOPSIS
    kustomizeenv TOOL [ARGUMENTS...]
    kustomizeenv [-h | --help]

COMMON FLAGS
    -h, --help
        Display help for this tool

TOOLS
    install - Install a specific version of kustomizeenv
    list - List all installed versions
    use - Switch a version to use
```
