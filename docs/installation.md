# GeoJuji, installation guide


## The guide

The following guide assume that:
- your OS is up-to-date
- you have installed `geojuji` repository into `~/Sites/geojuji`
- you are familiar with command line installation


If yes, keep reading:
- [Install shell's configurations](./install-shell.md)
- [Install packages managers](./install-pkgs.md)
- [Install application's configurations](./install-app.md)
- [Install PHP environment tools](./install-envphp.md)



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
    - [Chocolatey](https://chocolatey.org/)
        + [git](http://git-scm.com/)
        + [node](http://nodejs.org/)
        + [ngrok](https://ngrok.com/) *(with cask)*
        + [mysql](https://dev.mysql.com/doc/refman/5.7/en/)
    - [Ruby](https://www.ruby-lang.org/)
    - [Node.Js](http://nodejs.org/)
        + [npm](https://www.npmjs.com/)
        + [bower](https://bower.io/)
        + [gulp-cli](https://github.com/gulpjs/gulp-cli/)
        + [grunt-cli](https://gruntjs.com/)
        + [webpack](https://webpack.github.io/)
    - [Composer](https://getcomposer.org/)

3. Install application's configurations
    - Create symlinks for `/app/sublime-text/*` files
        + that also contain [Package Control](https://packagecontrol.io/) dependencies.

4. Install PHP environment tools
    - Installation
        + [PHP](http://php.net/)
        + [Apache Server](https://httpd.apache.org/)
        + [MySQL](https://www.mysql.com/)
        + [phpMyAdmin](https://www.phpmyadmin.net/)
    - Set default localhost
    - Add a custom local host
