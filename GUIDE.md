# Step-by-Step Guide

Summary of the following guide:

1. [Install shell's configurations](#1-install-shells-configurations)
2. [Install packages managers](#2-install-packages-managers)
3. [Install application's configurations](#3-install-applications-configurations)
4. [Install PHP environment tools](#4-install-php-environment-tools)


-------------------------------------


## 1. Install shell's configurations


### 1.1 [SSH Key](https://help.github.com/articles/connecting-to-github-with-ssh/)

To create a new SSH key, run the following command and hit return a couple of times for no passphrase:

```bash
ssh-keygen
```

Then, copy the new public SSH key from `~/.ssh/id_rsa.pub` to add the key to any service account you use.


### 1.2 XCode, the basic command line tool for MacOS

When you develop with MacOS, you will need the basic command line tools.

```bash
xcode-select --install
```

A software update pop-up window will appear that asks:
_“The xcode-select command requires the command line developer tools. Would you like to install the tools now?”_.
Choose to confirm this by clicking the _Install_ button and then agree to the Terms of Service when requested.

Once complete, the installer will go away and you should have `git`, `svn`, `make` and more command available in `/Library/Developer/CommandLineTools/usr/bin/`.


### 1.3 [Git](https://git-scm.com/)

First, rename `~/geojuji/shell/git/gituser.example` into `~/geojuji/shell/git/gituser`. In this file, update the `name` and `email` to let Git use your information when you will commit your changes. Also, note that this repository ignore that file.

As we will use `git` as versioning tool, we will symlink the configuration files to be use when we run related command line.

```bash
ln -sf ~/geojuji/shell/git/gituser       ~/.gituser             # Your personal configuration.
ln -sf ~/geojuji/shell/git/gitconfig     ~/.gitconfig           # The common configuration.
ln -sf ~/geojuji/shell/git/gitignore     ~/.gitignore           # List global files to be ignored for all repositories.
ln -sf ~/geojuji/shell/git/gitaliases    ~/.gitaliases          # All needed aliases.
ln -sf ~/geojuji/shell/git/gitattributes ~/.gitattributes       # Define common attributes for files.
```

:warning: Also, since merging and rebasing with `git` can be difficult, you can use a third-party software like [Diffmerge](https://sourcegear.com/diffmerge/). For this software in particular, you can uncomment in `~/geojuji/shell/git/gitconfig` the `#MAC:` word before the line config.


### 1.4 [Bash](https://www.gnu.org/software/bash/)

Also, since MacOS use by default `bash` as command-line interface, we will symlink our configuration to be sourced when a new shell is started.

```bash
ln -sf ~/geojuji/shell/bash/bash_profile ~/.bash_profile        # Common login configuration.
ln -sf ~/geojuji/shell/bash/bash_aliases ~/.bash_aliases        # Contains needed aliases.
```


-------------------------------------


## 2. Install packages managers


### 2.1 [Ruby](https://www.ruby-lang.org/), the package manager for object-oriented

On MacOS, `ruby` is already installed.
To check if ruby is installed and get the default ruby information, run the following command:

```bash
gem environment
```

:no_entry: Since I don't really work with `ruby` and `gem` for the moment, I will not explain further and just let you set your own `ruby` environment if you need it.

:closed_book: Also, if needed, you can find below the following default `gem` and `ruby` version, path and packages installed on my MacOS ElCapitain:

```bash
# ruby: /usr/bin/ruby - version 2.0.0p648
# gem:  /usr/bin/gem  - version 2.0.14.1
#--------------------
bigdecimal (1.2.0)
CFPropertyList (2.3.5)
io-console (0.4.2)
json (1.7.7)
libxml-ruby (3.0.0)
minitest (4.3.2)
nokogiri (1.5.6)
psych (2.0.0)
rake (0.9.6)
rdoc (4.0.0)
sqlite3 (1.3.13)
test-unit (2.0.0.0)
```


### 2.2 [Homebrew](http://brew.sh/), the missing package manager for MacOS

Install Homebrew with the following command line:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once Homebrew installed, you can install the formulas needed with the following command line:

```bash
# Bash
brew install bash
brew install bash-completion

# Node
brew install node

# Mysql
brew install mysql
```


### 2.3 [Node.js](http://nodejs.org/), the package manager for Node programs

We install `node` within the Homebrew formulas.
So, once `node` is installed, you can install needed packages globally with the following command line:

```bash
# NPM (should be installed with Node.JS)
npm install -g npm

# Bower [legacy]
npm install -g bower

# Task runners
npm install -g gulp-cli
npm install -g grunt-cli
npm install -g webpack
```

:warning: Sometime, on MacOS, you could have issue while installing or executing packages from the `/usr/local/` folder. To fix this issue, the following command will set your username as the owner of the folder:

```bash
sudo chown -R $USER:admin /usr/local
```


### 2.4 [Composer](https://getcomposer.org/), the dependency manager for PHP

As `composer` became a usefull tools to manage dependencies for PHP projects, you can install the executable in `/usr/local/bin` folder for MacOS with the following command:

```bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```


-------------------------------------


## 3. Install application's configurations


### 3.1 [Sublime Text 3](https://www.sublimetext.com/) with [Package Control](https://packagecontrol.io/)

If you use Sublime Text as a code editor, you probably already accustomed to use Package Control to enhance your coding experience.

To ensure to have the same packages and configurations installed between working stations, we will add Sublime Text's configuration files into the repository and symlink the folder to let Sublime Text use them.

Copy all current configurations you could have to the repository:

```bash
cp -Riv ~/Library/Application Support/Sublime Text 3/Packages/User/ ~/geojuji/app/sublime-text
```

Then, delete the current Sublime Text folder and create a symlink to link the configuration again:

```bash
rm -r ~/Library/Application Support/Sublime Text 3/Packages/User/
ln -s ~/geojuji/app/sublime-text ~/Library/Application Support/Sublime Text 3/Packages/User
```

Now, all Sublime Text's configurations can be found under `/app/sublime-text/` folder of this repository.

We also add `subl` command to our shell by creating a symlink with the following command:

```bash
ln -s "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```


### 3.2 Terminal theme

As we will use the terminal application as a daily tools, you can create a theme to be more friendly.
To use the theme `geojuji.terminal` from this repository:
- Go to `Terminal -> Preferences`.
- Under the `Profiles` tab, click the settings gear near the bottom and click `Import`.
- Select the theme (`*.terminal` file).


### 3.3 [iTerm2](http://www.iterm2.com/index.html)

You can also use the iTerm which offer a lot of great feature. To use the theme `geojuji.itermcolors` from this repository:
- Go to `iTerm2 -> Preferences`.
- Under the `Profiles` tab, click the plus icon near the bottom.
- Give a name to your profile than go to `Colors` section on the right.
- In the `Color presets` dropdown, select `Import`.
- Select the theme (`*.itermcolors` file).


### 3.3 [Atom](https://atom.io/)

You can also install Atom, as a code editor, and link a default config:
- Download and install `atom` from the app website.
- Open Atom to initialize the application and close it.
- Run `rm -rf ~/.atom` to delete default folder
- Then link the config in the repository with `ln -s ~/geojuji/app/atom ~/.atom`.
- Initialize `atom` package manager by runing `apm install package-sync` command.
- Open the application and sync all packages with `Package > Package sync. > Sync. packages`.
- Wait for all packages to be installed, close and restart `atom` to enjoy.


-------------------------------------


## 4. Install PHP environment tools


### 4.1 PHP Environment

To develop PHP projects, you will need the following to be installed and set:
- [PHP](http://php.net/)
- [Apache Server](https://httpd.apache.org/)
- [MySQL](https://www.mysql.com/) (Should be installed with Homebrew/Chocolatey formulas)
- [phpMyAdmin](https://www.phpmyadmin.net/)

:no_entry: Since each OS has its own way to install this differents compoments, I will not go in detail and let you use Google.


### 4.2 Set default localhost

Since we develop multiple websites, we need to set our local hosts to works properly.

First, edit `/etc/apache2/extra/httpd-vhosts.conf` to add the basic localhost config:

```bash
#
# Default configuration LOCALHOST
#

<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /Users/[username]/Sites/  # <-- where you will have all your local websites

    <IfModule mod_autoindex.c>
        Options Indexes FollowSymLinks
        IndexOptions FancyIndexing
        IndexOptions SuppressColumnSorting
        IndexOptions HTMLTable
        IndexOptions XHTML
        IndexOptions FoldersFirst
        IndexOptions IgnoreCase
        IndexOptions NameWidth=*
        IndexOptions IconsAreLinks
        IndexOptions IconWidth=18
        IndexOptions IconHeight=18
        IndexOptions SuppressHTMLPreamble
        IndexOptions SuppressDescription
        IndexOrderDefault Ascending Name
        # IndexStyleSheet "localhost.css"  # <-- you can add stylesheet for localhost
    </ifModule>

    ServerAdmin admin@localhost.com
    ErrorLog "/var/log/apache2/dev_error_log"
    CustomLog "/var/log/apache2/dev_access_log" common
</VirtualHost>
```

Now, http://localhost/ should display your folders and files list from `/Users/[username]/Sites/`.

:closed_book: Since we can add a custom stylesheet for your localhost, you can find under `~/geojuji/app/apache2/` folder an example.


### 4.3 Add a custom local host

First, always in `httpd-vhosts.conf`, add your local host configuration. Below, an example for `*.dev.domain.com`:

```bash
# Note:
# http://sub.folder.domain.ext/
# http://%-4.%-3.%-2.%-1/  # start from the end

#
# Configuration *.DEV.DOMAIN.com
#

<VirtualHost *:80>
    ServerName list.dev.domain.com
    ServerAlias *.dev.domain.com
    ServerAlias www.*.dev.domain.com
    VirtualDocumentRoot /Users/[username]/Sites/dev/%-4/

    ServerAdmin admin@localhost.com
    ErrorLog "/var/log/apache2/dev_error_log"
    CustomLog "/var/log/apache2/dev_access_log" common
</VirtualHost>
```

Then, edit `/etc/hosts` to list your local websites:

```bash
#
# VIRTUAL HOSTS
#

127.0.0.1   project1.dev.domain.com
127.0.0.1   project2.dev.domain.com
```

Now, when you go to `http://project1.dev.domain.com`, you will see the sources of the website you develop under `/Users/[username]/Sites/dev/project1/` folder.