# GeoJuji, install shell's configurations


## [SSH Key](https://help.github.com/articles/connecting-to-github-with-ssh/)

To create a new SSH key, run the following command and hit return a couple of times for no passphrase:

```bash
ssh-keygen
```

Then, copy the new public SSH key from `~/.ssh/id_rsa.pub` to add the key to any service account you use.



## XCode, the basic command line tool for MacOS

When  you develop with MacOS, you will need the basic command tools.

```bash
xcode-select --install
```

A software update pop-up window will appear that asks:
_“The xcode-select command requires the command line developer tools. Would you like to install the tools now?”_.
Choose to confirm this by clicking _Install_ and then agree to the Terms of Service when requested.

Once complete, the installer goes away and you should have `git`, `svn`, `make` and more command available in `/Library/Developer/CommandLineTools/usr/bin/`.



## [Git](https://git-scm.com/)

First, rename `gituser.example` into `gituser`. In this file, update the `name` and `email` to let Git use your information when you will commit your changes.

As we use `git` as versioning tool, we will symlink our configuration to be use when we run related command line.

```bash
# MacOS
ln -sf ~/Sites/geojuji/shell/git/gituser       ~/.gituser
ln -sf ~/Sites/geojuji/shell/git/gitconfig     ~/.gitconfig
ln -sf ~/Sites/geojuji/shell/git/gitaliases    ~/.gitaliases
ln -sf ~/Sites/geojuji/shell/git/gitignore     ~/.gitignore
ln -sf ~/Sites/geojuji/shell/git/gitattributes ~/.gitattributes

# Windows
mklink ~/Sites/geojuji/shell/git/gituser       ~/.gituser
mklink ~/Sites/geojuji/shell/git/gitconfig     ~/.gitconfig
mklink ~/Sites/geojuji/shell/git/gitaliases    ~/.gitaliases
mklink ~/Sites/geojuji/shell/git/gitignore     ~/.gitignore
mklink ~/Sites/geojuji/shell/git/gitattributes ~/.gitattributes
```



## [Bash](https://www.gnu.org/software/bash/)

As we use `bash` as command-line interface, we will symlink our configuration to be sourced when a new shell is started.

```bash
# MacOS
ln -sf ~/Sites/geojuji/shell/bash/bash_aliases ~/.bash_aliases
ln -sf ~/Sites/geojuji/shell/bash/bash_profile ~/.bash_profile
ln -sf ~/Sites/geojuji/shell/bash/bashrc       ~/.bashrc

# Windows
mklink ~/Sites/geojuji/shell/bash/bash_aliases ~/.bash_aliases
mklink ~/Sites/geojuji/shell/bash/bash_profile ~/.bash_profile
mklink ~/Sites/geojuji/shell/bash/bashrc       ~/.bashrc
```
