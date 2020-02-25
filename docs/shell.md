# Set shell's configurations

**Table of content:**

1. [SSH Key](#1-ssh-key)
1. [XCode](#2-xcode)
1. [Bash](#3-bash)
1. [Git](#4-git)
1. [Bonus: CMD](#5-bonus-cmd)

---

## 1. [SSH Key](https://help.github.com/articles/connecting-to-github-with-ssh/)

To create a new SSH key, run the following command and hit return a couple of times for no passphrase:

```
ssh-keygen
```

Then, copy the new public SSH key from `~/.ssh/id_rsa.pub` to add the key to any service account you use.

## 2. XCode

When you develop with MacOS, you will need the basic command line tools already available on MacOS.

1. Run the command to install tools:

    ```
    xcode-select --install
    ```

1. If not aleady installed, a software update pop-up window will appear that asks:

    > The xcode-select command requires the command line developer tools. Would you like to install the tools now?.

1. Click the `Install` button, then agree to the Terms of Service when requested.

Once complete, the installer will go away and you should have `git`, `svn`, `make` and more command available in `/Library/Developer/CommandLineTools/usr/bin/`.

## 3. [Bash](https://www.gnu.org/software/bash/)

Since MacOS use by default `bash` as command-line interface, we will symlink our own configuration to be sourced when a new shell is started.

```bash
# Common login configuration
ln -sf ~/geojuji/shell/bash/bash_profile  ~/.bash_profile
# Contains needed aliases
ln -sf ~/geojuji/shell/bash/bash_aliases  ~/.bash_aliases
```

:warning: The `~/geojuji/shell/bash/bin/` folder have been added by default in `$PATH` as directories to search for executable files. Please be aware that all bash scripts added to this folder need to have its permissions set as `755` to be to executable.

## 4. [Git](https://git-scm.com/)

First, rename `~/geojuji/shell/git/gituser.example` into `~/geojuji/shell/git/gituser`.

In this file, update the `name`, `username` and `email` to let Git use your information when you will commit your changes. Also, note that this repository ignore the `~/geojuji/shell/git/gituser` file to preserve privacy.

Then, since we use `git` as versioning tool, we need to symlink the configuration files to be use when we run related command line.

```bash
# Your personal configuration
ln -sf ~/geojuji/shell/git/gituser     ~/.gituser
# The common configuration
ln -sf ~/geojuji/shell/git/gitconfig   ~/.gitconfig
# List global files to be ignored
ln -sf ~/geojuji/shell/git/gitignore   ~/.gitignore
# All needed aliases
ln -sf ~/geojuji/shell/git/gitaliases  ~/.gitaliases
```

:warning: Since merging and rebasing with `git` can be difficult, you can use a third-party software like [Diffmerge](https://sourcegear.com/diffmerge/). If you use another software, you need to change the configuration in `~/geojuji/shell/git/gitconfig` accordingly.

## 5. Bonus: CMD

All the documentation written in his guide is MACOS-oriented.

However if you use Windows, you can find under `~/geojuji/shell/cmd/` folder a really basic configuration for `cmd.exe` to initialize some aliases inspired from linux shell:

-   First, install the `~/geojuji/shell/cmd/aliases.cmd` file under your folders name as `c:\[username]\aliases.cmd`.
-   Then, run the `~/geojuji/shell/cmd/register-aliases.reg` file to register theses aliases.
