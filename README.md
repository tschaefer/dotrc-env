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

### License

MIT License

Copyright (c) 2012-2024 Tobias Schäfer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

THIS IS SIGNIFICANT PRECONDITIONED NO OTHER LICENSE IS VIOLATED.
