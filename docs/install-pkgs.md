# GeoJuji, install packages managers


## [Homebrew](http://brew.sh/), the missing package manager for MacOS

Install Homebrew with the following command line:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once Homebrew installed, you can install the formulas needed with the following command line:

```bash
# Git
brew install git

# Bash
brew install bash
brew install bash-completion

# Node
brew install node

# Ngrok
brew cask install ngrok

# Mysql
brew install mysql
```



## [Ruby](https://www.ruby-lang.org/), the package manager for object-oriented

On MacOS, `ruby` is already installed, but on Windows, you need to install `ruby` manually.
To check if ruby is installed and get the default ruby information, run the following command:

```bash
gem environment
```

:no_entry: Since I don't really work with `ruby` and `gem` for the moment, I will not explain further and just let you set your own `ruby` environment if you need it.



## [Node.js](http://nodejs.org/), the package manager for Node programs

We install `node` within the Homebrew/Chocolatey formulas.
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

**Note:** Sometime, on MacOS, you could have issue while installing or executing packages into the `/usr/local/` folder. To fix this issue, set your username as the owner of the folder with the following command:

```bash
sudo chown -R $USER:admin /usr/local
```
