# Shell Configurations

## 1. [SSH Key](https://help.github.com/articles/connecting-to-github-with-ssh/)

You will need a public SSH key to authenticate with services like GitHub.

1. Create a new SSH key:
    ```bash
    ssh-keygen -t ed25519 -C "admin@localhost.com"
    ```
2. Adjust your `~/.ssh/config` file.

    ```plaintext
    ###########
    #  ~/.ssh/config
    ###########

    Host *
      AddKeysToAgent yes
      UseKeychain yes

    Host github.com
      HostName github.com
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/github-id_ed25519
    ```

3. Copy your new public SSH key (`~/.ssh/*.pub`)
4. Add it to your Git account as an authentication key and a signing key.

## 2. XCode

If you're developing on macOS, you'll need XCode command-line tools.

1. Run the command to install:

    ```bash
    xcode-select --install
    ```

2. Follow the on-screen instructions to complete the installation.
3. After installation, verify the tools (e.g., `git`, `svn`, `make`) are available in: `/Library/Developer/CommandLineTools/usr/bin/`.

## 3. [Bash](https://www.gnu.org/software/bash/)

For a better terminal experience, customize it to fit your workflow.

1. Check your current shell:

    ```bash
    echo $SHELL
    ```

2. If you want to switch to `bash`, run the following command:

    ```bash
    chsh -s /bin/bash
    ```

3. Set up configuration symlinks:

    ```bash
    # Common login configuration
    ln -sf ~/geojuji/shell/bash/bash_profile  ~/.bash_profile
    # Contains some needed aliases
    ln -sf ~/geojuji/shell/bash/bash_aliases  ~/.bash_aliases
    ```

:memo: In the `bash_profile` file, a reference to the `~/geojuji/shell/bash/bin/` folder has been added to the `$PATH` for executable files. You can add new binaries to that folder but make sure all scripts added have their permissions set to executable (e.g., `chmod 755`).

## 4. [Git](https://git-scm.com/)

Configure `git` for version control.

1. Rename and update your personal Git configuration file:

    ```bash
    mv ~/geojuji/shell/git/gituser.example ~/geojuji/shell/git/gituser
    ```

    Update `name`, `username`, and `email` fields.

2. Symlink `git` configuration files:

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

:memo: For installing some `git` autocompletion, run:

```bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
```
