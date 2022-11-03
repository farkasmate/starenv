# EXAMPLE - fluxenv

[Flux][flux] version manager made using [starenv][].

[flux]: https://fluxcd.io/
[starenv]: https://github.com/farkasmate/starenv

## Install

1. Install with [whalebrew][].

```shell
whalebrew install matefarkas/fluxenv:latest
```

2. Create tool directory.

```shell
mkdir ~/.flux
```

3. Add tool to `PATH`.

```shell
export PATH="~/.flux/bin:${PATH}"
```

4. Optionally, enable auto-install.

```shell
export FLUXENV_AUTO_INSTALL=true
```

[whalebrew]: https://github.com/whalebrew/whalebrew

## Usage

```text
$ fluxenv --help
NAME
    fluxenv

SYNOPSIS
    fluxenv TOOL [ARGUMENTS...]
    fluxenv [-h | --help]

COMMON FLAGS
    -h, --help
        Display help for this tool

TOOLS
    install - Install a specific version of fluxenv
    list - List all installed versions
    use - Switch a version to use
```
