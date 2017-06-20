# GeoJuji, installation guide


## The guide

The following guide assume that:
- your OS is up-to-date
- you have installed `geojuji` repository into `~/Sites/geojuji`
- you are familiar with command line installation


If yes, keep reading:
- [Install shell's configurations](./install-shell.md)
- [Install packages managers](./install-pkgs.md)



## Resume list of dependencies

Installation of the most useful packages and creation of symbolic links to replace MacOS native component files by those of the current repository.

1. Install shell's configurations
    - Create a new SSH key
    - Install xCode command line tools
    - Create symlinks for `/shell/git/*` files
        + `gituser` - Your personal profile
        + `gitconfig` - Common configuration
        + `gitaliases` - Contains classic aliases
        + `gitignore` - Global list of files to be ignored
        + `gitattributes` - Common attributes configuration
    - Create symlinks for `/shell/bash/*` files
        + `bashrc` - Common no-login configuration
        + `bash_profile` - Common login configuration
        + `bash_aliases` - Contains classic aliases

2. Install packages managers
    - [Homebrew](http://brew.sh/)
        + [git](http://git-scm.com/)
        + [bash](https://www.gnu.org/software/bash/)
        + bash-completion
        + [node](http://nodejs.org/)
        + [ngrok](https://ngrok.com/) *(with cask)*
        + [mysql](https://dev.mysql.com/doc/refman/5.7/en/)
