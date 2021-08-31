# Install packages managers

## 1. [Homebrew](http://brew.sh/)

Install Homebrew with the command line given here: https://brew.sh/

Once Homebrew is installed, you can install the formulas you need, with the following command line:

```
brew install <package-name>
```

:no_entry: If your version of macOS is installed on an initially unsupported Mac, you may receive an `illegal instruction: 4` when using certain packages. This is due to the implementation of the pre-build packages in Homebrew (`nehalem`). As a workaround the problem, you can adjust Homebrew to revert to the old version (mostly `core2`):

-   Edit `/usr/local/Homebrew/Library/Homebrew/extend/os/mac/hardware.rb` to use `:core2` for you OS version.
-   Reinstall your packages with the `--build-from-source` flag.

## 2. [Ruby](https://www.ruby-lang.org/)

On macOS, `ruby` is already installed. Check which version and packages is installed by default, run the following command:

```
gem environment
```

:memo: Since for development `gem` or `ruby` aren't always necessary, you can use Google to find the correct way to install them if you need them.

## 3. [Node.Js](http://nodejs.org/)

We install `node` with the package installer available here: https://nodejs.org/en/download/current/

Once installed, please adjust right for the packages folder with :

```
sudo chown -R $USER /usr/local/lib/node_modules
```

Once done, you can install needed packages globally with the following command line:

```
npm install -g <package-name>
```

## 4. [Composer](https://getcomposer.org/)

As `composer` became a usefull tools to manage dependencies for PHP projects, you can install the executable in `/usr/local/bin` folder for MacOS with the following command:

```
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```

## 5. Bonus: Envresume

Once the packages managers listed above are installed, you can use the custom made script called `envresume`, located in `~/geojuji/shell/bash/bin/`, to keep all the managers and packages up-to-date.

You can run the following command for all managers (or for a specific one):

```bash
# Get list of outdated packages
envresume outdated
# Update main packages manager
envresume update
# Update global outdated packages
envresume upgrade
# Check paths and current version of installed packages
envresume doctor
```

Or do all the above in correct order for a specific manager:

```
envresume all [brew|ruby|node|composer]
```

:memo: For more detail, you check the [envresume](../shell/bash/bin/envresume) script file.

:bulb: If you are interested, you can consult my lastest [environment checkup](../docs/envresume-checkup.md).
