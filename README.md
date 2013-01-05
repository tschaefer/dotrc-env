# dotrc-env

User env and app dotrc files.

## Introduction

__dotrc-env__ provides the _public_ part of yet another nix environment.
It contains configuration files of following apps:

	bash vim git screen nano

The _private_ env and app dotrc files are included as git submodule.
The repository provides configuration files of following apps:

	ssh openvpn gnupg irssi mccabber

The whole environment is kick-started with two bootstrap scripts.

## Usage

### Base

Clone the repository to the final destination.

	$ git clone https://github.com/tschaefer/dotrc-env.git ~/.env

Initialize public dotrc-env and link up your home.
Beware script removes all existing destination files!

	$ bash ~/.env/public/bootstrap

### Advanced

Adjust submodules and add path to your private dotrc-env repository.

	$ vim -p ~/.env/.gitmodules ~/.env/.git/config

Init and update submodules.

	$ cd ~/.env && git submodule update --init

Checkout master branch and fetch remote data.

	$ cd ~/.env/private && git checkout master && git pull

Initialize private dotrc-env and link up your home.
Beware script removes all existing destination files!

	$ bash ~/.env/private/bootstrap

### License

License CC BY-SA 3.0: Creative Commons Attribution-ShareAlike 3.0 Unported or
later [http://creativecommons.org/licenses/by-sa/3.0/](http://creativecommons.org/licenses/by-sa/3.0/)
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

This is significant preconditioned no other license is violated.
