Pry Debug Hooks
===============

Experiments on how to display variables from pry sessions in another window.

It currently works by dumping some pry command outputs to a custom file, e.g.
`~/.pry_locals` for the `Pry::Command::Ls::LocalVars` command, and having
another process watch and read from that file to display it in another window.

![Demo](https://i.imgur.com/I8u6XHZ.gif)

Prerequisites
-------------

- [pry](https://github.com/pry/pry)
- [fswatch](https://github.com/emcrisostomo/fswatch)

Installation
------------

1. Copy the contents from `hooks.rb` to `~/.pryrc` or require the file from within `~/.pryrc`.
2. Copy `pry-watch-locals` to somewhere in your path or link to it, e.g. `ln -sr pry-watch-locals /usr/local/bin/pry-watch-locals`

Usage
-----

1. Launch `pry-watch-locals` in some other terminal window / split / tmux pane /
   whatever.
2. Launch a `pry` session and play around.

Note that this will result in a text file at `~/.pry_locals` that will be
overwritten on consecutive variable dumps.

Todos
-----

- [ ] Easier installation (can this be shipped as a Pry plugin?)
- [ ] Dump non-local vars as well
