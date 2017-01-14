# dotrc-env

User env and app dotrc files.

## Introduction

__dotrc-env__ is yet another \*nix environment.
It contains configuration files of following apps:

    bash vim git screen nano ssh irssi

The whole environment is kick-started with two bootstrap scripts.

## Usage

Clone the repository to the final destination.

    $ git clone https://github.com/tschaefer/dotrc-env.git ~/.env

Initialize dotrc-env and link up your home.
Beware the script removes all existing destination files!

    $ bash ~/.env/bootstrap

The vim plugin manager [https://github.com/VundleVim/Vundle.vim](Vundle.vim)
is git cloned and all configured vim plugins are installed.

### License

License CC BY-SA 3.0: Creative Commons Attribution-ShareAlike 3.0 Unported or
later [http://creativecommons.org/licenses/by-sa/3.0/](http://creativecommons.org/licenses/by-sa/3.0/)
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

This is significant preconditioned no other license is violated.
