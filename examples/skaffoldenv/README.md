# EXAMPLE - skaffoldenv

[Skaffold][skaffold] version manager made using [starenv][].

[skaffold]: https://skaffold.dev/
[starenv]: https://github.com/farkasmate/starenv

## Install

1. Install with [whalebrew][].

```shell
whalebrew install matefarkas/skaffoldenv:latest
```

2. Create tool directory.

```shell
mkdir ~/.skaffold
```

3. Add tool to `PATH`.

```shell
export PATH="~/.skaffold/bin:${PATH}"
```

4. Optionally, enable auto-install.

```shell
export SKAFFOLDENV_AUTO_INSTALL=true
```

[whalebrew]: https://github.com/whalebrew/whalebrew

## Usage

```text
$ skaffoldenv --help
NAME
    skaffoldenv

SYNOPSIS
    skaffoldenv TOOL [ARGUMENTS...]
    skaffoldenv [-h | --help]

COMMON FLAGS
    -h, --help
        Display help for this tool

TOOLS
    install - Install a specific version of skaffoldenv
    list - List all installed versions
    use - Switch a version to use
```
