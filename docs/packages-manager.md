# Install needed packages managers

**Table of content:**

1. [Homebrew](#1-homebrew)
1. [Ruby](#2-ruby)
1. [Node.Js](#3-node.js)
1. [Composer](#4-composer)
1. [Bonus: Envresume](#5-bonus:-envresume)

---

## 1. [Homebrew](http://brew.sh/)

Install Homebrew with the following command line:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once Homebrew is installed, you can install the formulas you need, with the following command line:

```
brew install <package-name>
```

## 2. [Ruby](https://www.ruby-lang.org/)

On MacOS, `ruby` is already installed. To check if ruby is installed and get the default ruby information, run the following command:

```
gem environment
```

:no_entry: Since I don't use `gem` and `ruby` in my projects, I will not go in details and let you use Google to find the correct way to install them.

## 3. [Node.Js](http://nodejs.org/)

We install `node` within the Homebrew formulas.

So, once `node` is installed, you can install needed packages globally with the following command line:

```
npm install -g <package-name>
```

:warning: Sometime, on MacOS, you could have issue while installing or executing packages from the `/usr/local/` folder. To fix this issue, the following command will set your username as the owner of the folder:

```
sudo chown -R $USER:admin /usr/local
```

## 4. [Composer](https://getcomposer.org/)

As `composer` became a usefull tools to manage dependencies for PHP projects, you can install the executable in `/usr/local/bin` folder for MacOS with the following command:

```
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```

## 5. Bonus: Envresume

Once the packages managers listed above are installed, you can use the custom made script called `envresume`, located in `~/shell/bash/bin/`, to keep all the managers and packages up-to-date.

1. You can run the following command for all managers (or for a specific one):

    ```bash
    # Get list of outdated packages
    envresume outdated
    # Update main packages manager
    envresume update
    # Update global outdated packages
    envresume upgrade
    # Check paths and current version of installed packages
    envresume check
    ```

1. Or do all the above in correct order for a specific manager:

    ```
    envresume all [brew|ruby|node|composer]
    ```

For more detail, check the [envresume](../shell/bash/bin/envresume) script file.

:notebook: If you are interested, you can consult my lastest [Environment checkup](../docs/envresume-checkup.md).
