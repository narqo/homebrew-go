# brew-go

[![experimental](https://badges.github.io/stability-badges/dist/experimental.svg)](https://github.com/badges/stability-badges)

**WARNING**

This is an experimental project and it can break things (*).

---

## Install

~~~
% brew tap narqo/go
~~~

## Usage

~~~
% brew go install github.com/google/pprof
...
% which pprof
/usr/local/bin/pprof
~~~

To see all supported commands do:

~~~
% brew go help
~~~

### Limitations

As it for know, all tools are installed with the `go-` prefix, using the default VCS branch for versioning.

~~~
% brew ls go-pprof
/usr/local/Cellar/go-pprof/devel/bin/pprof
~~~

To update the package run:

~~~
brew go reinstall github.com/google/pprof
~~~

### Shell Completions

TODO

### How It Works

Command generates a temporary brew formula and runs `brew install <formula-file>`, which go-gets the package into a separate, per-package `$GOPATH` in the brew's cache directory, e.g. `$HOME/Library/Caches/Homebrew`, and runs the go install into brew's bin directory.

---

* – I'm not a brew internals expert (neither a ruby developer), so I'm not yet sure how the tool aligns with other brew's things. It works with my test cases, let me know if somthing doesn't work with yours ;)

The project was deeply inspired by [brew-gem](https://github.com/sportngin/brew-gem).

# License

MIT
