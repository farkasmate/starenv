# starenv

`*` version manager inspired by `[tfenv|rbenv]`.

## Why?

I really like [tfenv][], it's great, use it.

I wanted to manage some other tools in a similar way, like `kubectl`.

I'm usually working on multiple Kubernetes projects at once, some are more bleeding edge and some are based on EKS.
Since `kubectl` guarantees (only) `n-1`-`n+1` version compatibility, I like to have multiple versions around.

Installing versions with `kubeenv install` is handy. Selecting the right version with a `.kubectl-version` is even better.

`starenv` is a tool to make this possible.

[tfenv]: https://github.com/tfutils/tfenv

## How?

Check out the [examples][].

[examples]: ./examples
