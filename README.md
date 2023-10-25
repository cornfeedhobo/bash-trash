# bash-trash

Trash management, in BASH!

## Install

### Basher

[basher](https://github.com/basherpm/basher/) is a package manager for shell scripts and functions.

```shell
basher install cornfeedhobo/bash-trash
echo 'eval "$(bash-trash init -)' >> .bashrc
```

### Manually

```shell
git clone https://github.com/cornfeedhobo/bash-trash .bash-trash
echo 'eval "$($HOME/.bash-trash/bin/bash-trash init -)' >> .bashrc
```

## Usage

```plain
Usage: bash-trash <command> [<args>]

Some useful bash-trash commands are:
   commands     List all bash-trash commands
   completions  Returns completions for the given bash-trash command
   init         Outputs shell commands for initializing bash-trash
   ls           List all trash files
   lsd          List all trash files in the current directory
   put          Put files in the trash
   restore      Restore trash files
   restored     Restore trash files from the current or any child directories

See 'bash-trash help <command>' for information on a specific command.
```

## Todo

* [x] Support home trash
* [ ] Support removable volumes

## Is it any good?

[Yes](http://news.ycombinator.com/item?id=3067434)
