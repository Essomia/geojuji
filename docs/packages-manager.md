# Install packages managers

## 1. [Homebrew](http://brew.sh/)

Install Homebrew with the command line given here: https://brew.sh/

Once Homebrew is installed, you can install the formulas you need, with the following command line:

```
brew install <package-name>
```

## 2. [Ruby](https://www.ruby-lang.org/)

On macOS, `ruby` is already installed. Check which version and packages is installed by default, run the following command:

```
gem environment
```

:memo: Since for development `gem` or `ruby` aren't always necessary, you can use Google to find the correct way to install them if you need them.

## 3. [Node.js](http://nodejs.org/)

We install `node` with Homebrew:

```
brew install node
```

Once done, you can install needed packages globally with the following command line:

```
npm install -g <package-name>
```

## 5. Bonus: `resume-env`

Once the packages managers listed above are installed, you can use our custom-made script called `resume-env`. That script help you to keep all the managers and packages up-to-date.

You can run the following command for all managers (or for a specific one):

```bash
# Get list of outdated packages
resume-env outdated
# Update main packages manager
resume-env update
# Update global outdated packages
resume-env upgrade
# Check paths and current version of installed packages
resume-env doctor
```

:memo: For more detail, you check the [resume-env](../shell/bash/bin/resume-env) script file.

:bulb: You also generate a checkup with `resume-env doctor -- print > docs/_checkup-env.md`.
