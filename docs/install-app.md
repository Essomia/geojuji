# GeoJuji, install application's configurations


## [Sublime Text 3](https://www.sublimetext.com/) with [Package Control](https://packagecontrol.io/)

If you use Sublime Text as a code editor, you probably already accustomed to use Package Control to enhance your coding experience.

To ensure to have the same packages and configurations installed between working stations, we will add Sublime Text's configuration files into the repository and symlink the folder to let Sublime Text use them.

Copy all current configurations you could have to the repository:

```bash
cp -Riv ~/Library/Application Support/Sublime Text 3/Packages/User/ ~/Sites/geojuji/app/sublime-text
```

Then, delete the current Sublime Text folder and create a symlink to link the configuration again:

```bash
rm -r ~/Library/Application Support/Sublime Text 3/Packages/User/
ln -s ~/Sites/geojuji/app/sublime-text ~/Library/Application Support/Sublime Text 3/Packages/User
```

Now, all Sublime Text's configurations can be found under `/app/sublime-text/` folder of this repository.
