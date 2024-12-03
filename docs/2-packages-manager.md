# Package Managers

## 1. [Homebrew](http://brew.sh/)

Install Homebrew with the command line given here: https://brew.sh/

Once Homebrew is installed, you can install the formulas you need, with the following command line:

```bash
brew install <package-name>
```

## 2. [Ruby](https://www.ruby-lang.org/)

On macOS, `ruby` is already installed. Check which version and packages is installed by default:

```bash
gem environment
```

## 3. [Node.js](http://nodejs.org/)

Install `node` using Homebrew:

```bash
brew install node
```

Once done, you can install needed packages globally with the following command line:

```bash
npm install -g <package-name>
```

## 5. Bonus: `envmanager`

Once the packages managers listed above are installed, you can use our custom-made script called `envmanager`. That script help you to keep all the managers and packages up-to-date.

You can run the following command for all managers (or for a specific one):

```bash
# Get list of outdated packages
envmanager outdated
# Update main packages manager
envmanager update
# Update global outdated packages
envmanager upgrade
# Check paths and current version of installed packages
envmanager doctor
```

:memo: For more detail, you check the [envmanager](../shell/bash/bin/envmanager) script file.

:bulb: You can generate a checkup with `envmanager doctor --print > docs/_checkup-env.md`.
