# Shell's configurations

## 1. [SSH Key](https://help.github.com/articles/connecting-to-github-with-ssh/)

You will need a public SSH key to be identified in some services (like GitHub).

1. Create a new SSH key with no passphrase.
    ```
    ssh-keygen -t ed25519 -C "admin@localhost.com"
    ```
2. Adjust your `~/.ssh/config` file. You have an example under the `~/geojuji/shell/secure` folder.
3. Copy your new public SSH key (`~/.ssh/*.pub`) and add it to your git account (as "authentication" key).

## 2. XCode

When you develop on macOS, you will need some basic command-line tools.

1. Run the command to install:

    ```
    xcode-select --install
    ```

1. A software pop-up window will appear. Click the `Accept` or `Install` button.
1. Agree to the Terms of Service when requested.
1. Once complete, the installer will go away.

:memo: You should have `git`, `svn`, `make` and more commands available in `/Library/Developer/CommandLineTools/usr/bin/` at the end of the installation.

## 3. [Bash](https://www.gnu.org/software/bash/)

For developers, the terminal is used on a daily basis.
For a better experience, you would probably like to improve it according to your needs.

1. Since macOS set your terminal to use `bash` or `zsh` by default, check which shell your terminal is currently using:

    ```
    echo $SHELL
    ```

1. If you have `/bin/zsh` and you want to use `/bin/bash` instead, change with the following command:

    ```
    chsh -s /bin/bash
    ```

1. If you choose to use `bash` as default, you can symlink the custom configuration to be sourced when a new shell is started:

    ```bash
    # Common login configuration
    ln -sf ~/geojuji/shell/bash/bash_profile  ~/.bash_profile
    # Contains some needed aliases
    ln -sf ~/geojuji/shell/bash/bash_aliases  ~/.bash_aliases
    ```

:memo: The `~/geojuji/shell/bash/bin/` folder have been added to the default `$PATH` as directories to search for executable files. You can add new binaries to that folder. Please ensure that all scripts added to the `~/geojuji/shell/bash/bin/` folder have its permissions set to be executable (i.e. 755).

## 4. [Git](https://git-scm.com/)

If you use `git` as version control, you would probably add your own configuration.

1. Rename `~/geojuji/shell/git/gituser.example` into `~/geojuji/shell/git/gituser`.
2. Think to update the `name`, `username` and `email` with the correct information.
3. Symlink the `git` configuration files:

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

:memo: Also, if you work a lot with `git`, you may want to add autocompletion for command lines:

```
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
```

## 5. SSH & GIT - Get "verified" commits

After the basic configuration of `git` and `ssh` keys, we can now configure the "verified" flag for our commits with `git`.

:memo: You can commit with a "public" email and use a "private" email for your SSH keys.

1. Create a new file under the `~/.ssh/` folder:
    ```bash
    cd ~/.ssh/
    touch allowed_signers
    ```
2. Add this new file to your global `gitconfig` file:
    ```bash
    git config gpg.ssh.allowedSignersFile "~/.ssh/allowed_signers"
    ```
3. Run the following to add your SSH key (use for "authentication") into the `allowed_signers` file:
    ```bash
    # Replace <MY_KEY> by your SSH KEY filename
    echo "$(git config --get user.email) namespaces=\"git\" $(cat ~/.ssh/<MY_KEY>.pub)" >> ~/.ssh/allowed_signers
    ```
4. Now, [add your SSH key to your account](https://docs.github.com/en/"authentication"/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account), but be sure to set it as "signing" key.
   At the end, you should have the same key twice: one as "authentication" and one as signing.

Now, you can commit on a repository and validate that your new commit is verified with: `git log --show-signature`.
