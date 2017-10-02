# GeoJuji, install shell's configurations


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
