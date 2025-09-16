# dotrc-env

User env and app dotrc files.

## Introduction

__dotrc-env__ is yet another \*nix environment.

The whole environment is kick-started with a bootstrap scripts.

## Usage

Clone the repository to the final destination.

```
git clone https://github.com/tschaefer/dotrc-env.git ~/.env
```

Initialize dotrc-env and link up your home.
Beware the script removes all existing destination files!

```
bash ~/.env/bootstrap
```

The vim plugin manager [Vundle.vim](https://github.com/VundleVim/Vundle.vim)
is git cloned and all configured vim plugins, see `etc/vim/configs/plugins.vim`,
are installed.
