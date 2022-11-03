# EXAMPLE - kindenv

[Kind][kind] version manager made using [starenv][].

[kind]: https://kind.sigs.k8s.io/
[starenv]: https://github.com/farkasmate/starenv

## Install

1. Install with [whalebrew][].

```shell
whalebrew install matefarkas/kindenv:latest
```

2. Create tool directory.

```shell
mkdir ~/.kind
```

3. Add tool to `PATH`.

```shell
export PATH="~/.kind/bin:${PATH}"
```

4. Optionally, enable auto-install.

```shell
export KINDENV_AUTO_INSTALL=true
```

[whalebrew]: https://github.com/whalebrew/whalebrew

## Usage

```text
$ kindenv --help
NAME
    kindenv

SYNOPSIS
    kindenv TOOL [ARGUMENTS...]
    kindenv [-h | --help]

COMMON FLAGS
    -h, --help
        Display help for this tool

TOOLS
    install - Install a specific version of kindenv
    list - List all installed versions
    use - Switch a version to use
```
