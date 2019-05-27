# `~/geojuji/shell` : Install and configure shell for development.


**Summary of the following guide:**:

1. [Install shell's configurations](#1-install-shells-configurations)
    - 1. SSH Key
    - 2. XCode
    - 3. Git
    - 4. Bash
    - 5. Bonus: CMD

2. [Install packages managers](#2-install-packages-managers)
    - 1. Homebrew, the missing package manager for MacOS
    - 2. Ruby, the package manager for object-oriented
    - 3. Node.js
    - 4. Composer


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

A software update pop-up window will appear that asks: _"The xcode-select command requires the command line developer tools. Would you like to install the tools now?"_.
Choose to confirm this by clicking the _Install_ button and then agree to the Terms of Service when requested.
Once complete, the installer will go away and you should have `git`, `svn`, `make` and more command available in `/Library/Developer/CommandLineTools/usr/bin/`.




### 1.3 [Git](https://git-scm.com/)

First, rename `~/geojuji/shell/git/gituser.example` into `~/geojuji/shell/git/gituser`. In this file, update the `name`, `username` and `email` to let Git use your information when you will commit your changes. Also, note that this repository ignore the `~/geojuji/shell/git/gituser` file.

Then, since we use `git` as versioning tool, we need to symlink the configuration files to be use when we run related command line.

```bash
ln -sf ~/geojuji/shell/git/gituser       ~/.gituser           # Your personal configuration.
ln -sf ~/geojuji/shell/git/gitconfig     ~/.gitconfig         # The common configuration.
ln -sf ~/geojuji/shell/git/gitignore     ~/.gitignore         # List global files to be ignored.
ln -sf ~/geojuji/shell/git/gitaliases    ~/.gitaliases        # All needed aliases.
```

:warning: Since merging and rebasing with `git` can be difficult, you can use a third-party software like [Diffmerge](https://sourcegear.com/diffmerge/). If you use another software, you need to change the configuration in `~/geojuji/shell/git/gitconfig`.




### 1.4 [Bash](https://www.gnu.org/software/bash/)

Since MacOS use by default `bash` as command-line interface, we will symlink our own configuration to be sourced when a new shell is started.

```bash
ln -sf ~/geojuji/shell/bash/bash_profile ~/.bash_profile      # Common login configuration.
ln -sf ~/geojuji/shell/bash/bash_aliases ~/.bash_aliases      # Contains needed aliases.
```

:warning: The `~/geojuji/shell/bash/bin/` folder have been added by default in `$PATH` as directories to search for executable files. Please be aware that all bash scripts added to this folder need to have its permissions set as `755` to be to executable.




### 1.5 Bonus: CMD

All the documentation written in his guide is MACOS-oriented.
However if you use Windows, you can find under `~/geojuji/shell/cmd/` folder a really basic configuration for   `cmd.exe` to initialize some aliases inspired from linux shell:
- First, install the `~/geojuji/shell/cmd/aliases.cmd` file under your folders name as `c:\[username]\aliases.cmd`.
- Then, run the `~/geojuji/shell/cmd/register-aliases.reg` file to register theses aliases.




-------------------------------------




## 2. Install packages managers




### 2.1 [Homebrew](http://brew.sh/), the missing package manager for MacOS

Install Homebrew with the following command line:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once Homebrew is installed, you can install the formulas you need, with the following command line:

```bash
# brew: /usr/local/bin/brew - version 2.1.1
#--------------------

brew install bash            # v5.0.7
brew install bash-completion # v1.3_3
brew install git             # v2.21.0
brew install node@8          # v8.15.1_1
```

:notebook: If you want to keep your Homebrew formulas up-to-date, here some usefull command:

```bash
brew update
brew outdated
brew upgrade
brew cleanup
```




### 2.2 [Ruby](https://www.ruby-lang.org/), the package manager for object-oriented

##### Default configuration

On MacOS, `ruby` is already installed. To check if ruby is installed and get the default ruby information, run the following command:

```bash
gem environment
```

You can find below the following default `gem` and `ruby` version, path and packages installed on my MacOS ElCapitain:

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

##### Installed with Homebrew

In case you need to use `ruby` as a working tool, you can install a more recent version with Homebrew:

```bash
brew install ruby # v2.6.3
```

Once `gem` and `ruby` are installed, you will have the following version, path and packages installed:

```bash
# ruby: /usr/local/opt/ruby/bin/ruby - version 2.6.3p62
# gem:  /usr/local/opt/ruby/bin/gem  - version 3.0.3
#--------------------

bundler (2.0.1, default: 1.17.3)
chunky_png (1.3.11)
compass (1.0.3)
compass-core (1.0.3)
compass-import-once (1.0.5)
did_you_mean (1.3.0)
ffi (1.10.0)
minitest (5.11.3)
multi_json (1.13.1)
net-telnet (0.2.0)
power_assert (1.1.4, 1.1.3)
rake (12.3.2)
rb-fsevent (0.10.3)
rb-inotify (0.10.0)
rubygems-update (3.0.3)
sass (3.7.4, 3.4.25)
sass-listen (4.0.0)
test-unit (3.3.2, 3.2.9)
xmlrpc (0.3.0)
```

:notebook: If you want to keep your `gem` up-to-date, here some usefull command:

```bash
gem update --system
gem outdated
gem update
gem cleanup
```




### 2.3 [Node.js](http://nodejs.org/), the package manager for Node programs

We install `node` within the Homebrew formulas. So, once `node` is installed, you can install needed packages globally with the following command line:

```bash
# node: /usr/local/opt/node@8/bin/node - version 8.15.1
# npm:  /usr/local/opt/node@8/bin/npm  - version 6.4.1
#--------------------

npm install -g bower     # v1.8.8
npm install -g grunt-cli # v1.3.2
npm install -g gulp-cli  # v2.2.0
npm install -g less      # v3.9.0
npm install -g npm       # v6.9.0
npm install -g webpack   # v4.30.0
```

:notebook: If you want to keep your `npm` packages up-to-date, here some usefull command:

```bash
npm outdated -g --depth=0
npm update -g
```

:warning: Sometime, on MacOS, you could have issue while installing or executing packages from the `/usr/local/` folder. To fix this issue, the following command will set your username as the owner of the folder:

```bash
sudo chown -R $USER:admin /usr/local
```




### 2.4 [Composer](https://getcomposer.org/), the dependency manager for PHP

As `composer` became a usefull tools to manage dependencies for PHP projects, you can install the executable in `/usr/local/bin` folder for MacOS with the following command:

```bash
# composer: /usr/local/bin/composer - version 1.8.5
#--------------------
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```

:notebook: If you want to keep your `composer` up-to-date, here some usefull command:

```bash
composer self-update
```
