# Configure applications

## 1. Terminal

If you use `Terminal` application as a daily tool, you can create a theme to have a friendly shell.

1. Go to `Terminal -> Preferences`.
1. Under the `Profiles` tab, click the settings gear near the bottom and click `Import`.
1. Select the theme (`geojuji.terminal` file) under `~/geojuji/app/terminal/` folder.
1. One imported, select the new theme in the list and set it as default.

## 2. [iTerm2](http://www.iterm2.com/index.html)

As an alternative terminal, you can also use the `iTerm` which offer a lot of great features.

1. Go to `iTerm2 -> Preferences`.
1. Under the `Profiles` tab, click the plus icon near the bottom.
1. Give a name to your profile, and then, go to `Colors` section on the right.
1. In the `Color presets` dropdown, select `Import`.
1. Select the theme (`geojuji.itermcolors` file) under `~/geojuji/app/iterm/` folder.
1. The theme imported, re-select `geojuji` preset profile in the dropdown choice.

:memo: You can also configure `iTerm` to save you preferences into a specific folder under the `General > Preferences` tab.

## 3. [Visual Studio Code](https://code.visualstudio.com/)

If you use `Visual Studio Code` (VSC) as you primary IDE, you have bellow my current configuration setup.

### Configuration

To ensure to have the same configurations installed between working stations in case you can't sync your configuration, we will link Visual Studio Code's configuration files into this repository and symlink the folder to let VSC use them again.

1. Copy all current configurations you could have to the repository:

    ```
    cp -Riv ~/Library/Application\ Support/Code/User/ ~/geojuji/app/visual-studio-code
    ```

1. Delete the current `User` folder:

    ```
    rm -r ~/Library/Application\ Support/Code/User/
    ```

1. Create a symlink to link the configuration again:

    ```
    ln -s ~/geojuji/app/visual-studio-code ~/Library/Application\ Support/Code/User
    ```

Now, all VSC's configurations can be found under `~/geojuji/app/visual-studio-code/` folder.

:warning: If you use vscode on multiple computer, I recommended you to synchronize your configuration with the option: `Code > Preferences > Settings Sync`.

### Binary

To add `vscode` command, create a symlink with the following command:

```
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/vscode
```

### Extensions

Below, I share my recommended extensions for VSC. You can install them easily without find/install. For that, you need to run the following command with the `vscode` binary command we just created:

```bash
vscode --install-extension Atishay-Jain.All-Autocomplete
vscode --install-extension dbaeumer.vscode-eslint
vscode --install-extension dsznajder.es7-react-js-snippets
vscode --install-extension ecmel.vscode-html-css
vscode --install-extension esbenp.prettier-vscode
vscode --install-extension formulahendry.auto-rename-tag
vscode --install-extension GraphQL.vscode-graphql
vscode --install-extension Gruntfuggly.todo-tree
vscode --install-extension ionutvmi.path-autocomplete
vscode --install-extension jerrylopez.magento2-snippets
vscode --install-extension mgmcdermott.vscode-language-babel
vscode --install-extension ms-vscode.vscode-typescript-next
vscode --install-extension naumovs.color-highlight
vscode --install-extension sainoba.px-to-rem
vscode --install-extension sleistner.vscode-fileutils
vscode --install-extension steoates.autoimport
vscode --install-extension stylelint.vscode-stylelint
vscode --install-extension VisualStudioExptTeam.vscodeintellicode
vscode --install-extension xabikos.JavaScriptSnippets
```

:warning: The `~/geojuji/app/visual-studio-code/settings.json` file come with default configurations for these extensions. Please ensure that these settings are correct for you.

:memo: If you need to share your own extension, run the following command `vscode --list-extensions | xargs -L 1 echo vscode --install-extension`.
