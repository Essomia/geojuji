# GeoJuji

Geojuji is a kit to install all front-end tools and basic PHP environment on MacOS.


## Concept

Geojuji contains all the basic configurations and dependencies needed to develop PHP projects.

The concept is to keep versioned shell configuration files and software configurations files. Then, it is possible to remount a user station quickly with a constant configuration between each station.


## Installation

Get a version of this repository on your git account and then clone the repository on your working station.

```bash
git clone git@github.com:[username]/geojuji.git /path/to/folder/geojuji
```


## Step-by-Step Guide

You can read the complete [guide](./GUIDE.md) here.


-------------------------------------


## Notes

- All the documentation is MACOS-oriented. However if you use Windows, you will find in `/shell/cmd/` some basic aliases inspired from linux shell for `cmd.exe`.
   - First, install the `aliases.cmd` file under your folders name as `~/aliases.cmd`
   - Then, run the `*.reg` file to register theses aliases.
