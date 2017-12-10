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

As it for now, all tools are installed with the `go-` prefix, using the default VCS branch for versioning.

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

### Motivation

It might be simple to add `$GOPATH/bin` to the system's `$PATH`. IMHO having third-party tools mixed with your code is not a perfect way of organising development environment. Every time I tried to update a third-party tool via `go get -u <package>` I had to deal with weird dependency collisions, which happened because of reasons. 

I tried to have multiple items in the `$GOPATH` (see my shell configs in the [dotfiles][] repo, if you care) to make some distinguishing between third-party tools and my stuff. But this didn't help when I wanted to remove tools I didn't need or want to have anymore.

homebrew-go is an attempt to solve this issues, by providing a way to manage tools written in Go without the need of pollution your development environment.

### How It Works

Command generates a temporary brew formula and runs `brew install <formula-file>`, which go-gets the package into a separate, per-package `$GOPATH` in the brew's cache directory, e.g. `$HOME/Library/Caches/Homebrew`, and runs the go install into brew's bin directory.

---

\* – I'm not a brew internals expert (neither a ruby developer), so I'm not yet sure how the tool aligns with other brew's things. It works with my test cases, let me know if something doesn't work with yours ;)

The project was deeply inspired by [brew-gem](https://github.com/sportngin/brew-gem).

# License

MIT

[dotfiles]: https://github.com/narqo/dotfiles
