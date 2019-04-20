# `~/geojuji/app` : Configure applications and environment.


**Summary of the following guide:**:

3. [Configure PHP environment tools](#3-configure-php-environment-tools)
    - 1. Set PHP Environment
    - 2. Set default local host
    - 3. Set a custom local host

4. [Install application's configurations](#4-install-applications-configurations)
    - 1. Terminal
    - 2. iTerm2
    - 3. Sublime Text 3, with Package Control


-------------------------------------




## 3. Configure PHP environment tools




### 3.1 Set PHP Environment

To develop PHP projects, you will need the following to be installed and set:
- [PHP](http://php.net/)
- [Apache Server](https://httpd.apache.org/)
- [MySQL](https://www.mysql.com/): To get the right one for your OS, [check the MYSQL archives](https://downloads.mysql.com/archives/community/).
- [Sequel Pro](https://www.sequelpro.com/)

:no_entry: Since each OS has its own way to install this differents compoments, I will not go in details and let you use Google.




### 3.2 Set default local host

Since we develop multiple websites, we need to set our local hosts to works properly.

Edit `/etc/apache2/extra/httpd-vhosts.conf` to add the basic localhost config:

```bash
#
# Default configuration LOCALHOST
#

<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /Users/[username]/Sites/  # <-- where you will have all your local websites (aka [DocumentRoot])

    <IfModule mod_autoindex.c>
        Options Indexes FollowSymLinks
        IndexOptions FancyIndexing
        IndexOptions SuppressColumnSorting
        IndexOptions HTMLTable
        IndexOptions XHTML
        IndexOptions FoldersFirst
        IndexOptions IgnoreCase
        IndexOptions NameWidth=*
        IndexOptions IconsAreLinks
        IndexOptions IconWidth=18
        IndexOptions IconHeight=18
        IndexOptions SuppressHTMLPreamble
        IndexOptions SuppressDescription
        IndexOrderDefault Ascending Name
        # IndexStyleSheet "localhost.css"  # <-- path to your stylesheet for localhost
    </ifModule>

    ServerAdmin admin@localhost.com
    ErrorLog "/var/log/apache2/dev_error_log"
    CustomLog "/var/log/apache2/dev_access_log" common
</VirtualHost>
```

Now, `http://localhost/` should display your folders and files under your `[DocumentRoot]` folder.

:notebook: Since we can add a custom stylesheet, you can use our example  `~/geojuji/app/apache2/localhost.css`. Also, note that the stylesheet file should be under your `[DocumentRoot]` folder.




### 3.3 Set a custom local host

Since we have now a default localhost, now let set a custom hosts for projects. As an example, we will use `*.*.dev.domain.com` model.

Always in `httpd-vhosts.conf`, add your local host configuration:

```bash
# Explain:
# - http://project.client.folder.domain.ext/
# - http://%-5.%-4.%-3.%-2.%-1/  # start from the end

#
# Configuration *.DEV.DOMAIN.com
#

<VirtualHost *:80>
    ServerName list.dev.domain.com
    ServerAlias *.*.dev.domain.com
    ServerAlias www.*.*.dev.domain.com
    VirtualDocumentRoot /Users/[username]/Sites/develop/%-4/%-5/

    ServerAdmin admin@localhost.com
    ErrorLog "/var/log/apache2/dev_error_log"
    CustomLog "/var/log/apache2/dev_access_log" common
</VirtualHost>
```

Then, edit `/etc/hosts` to list your local websites urls:

```bash
#
# VIRTUAL HOSTS
#

127.0.0.1   project1.client.dev.domain.com
```

Now, when you go to `http://project.client.dev.domain.com`, you can see the sources of your website that you develop under `[DocumentRoot]/develop/client/project/` folder.




-------------------------------------




## 4. Install application's configurations




### 4.1 Terminal

As we will use the `Terminal` application as a daily tools, you can create a theme to have a friendly shell. To use the theme `geojuji.terminal` from this repository:
- Go to `Terminal -> Preferences`.
- Under the `Profiles` tab, click the settings gear near the bottom and click `Import`.
- Select the theme (`*.terminal` file) under `~/geojuji/app/terminal/` folder.
- It's done.




### 4.2 [iTerm2](http://www.iterm2.com/index.html)

You can also use the `iTerm` which offer a lot of great feature. To use the theme `geojuji.itermcolors` from this repository:
- Go to `iTerm2 -> Preferences`.
- Under the `Profiles` tab, click the plus icon near the bottom.
- Give a name to your profile, and then, go to `Colors` section on the right.
- In the `Color presets` dropdown, select `Import`.
- Select the theme (`*.itermcolors` file) under `~/geojuji/app/iterm/` folder.
- The theme imported, reselect `geojuji` preset profile in the dropdown choice.
- It's done.




### 4.3 [Sublime Text 3](https://www.sublimetext.com/), with [Package Control](https://packagecontrol.io/)

If you use `Sublime Text` as your editor, you probably already accustomed to use `Package Control` to enhance your coding experience.

To ensure to have the same configurations installed between working stations, we will add Sublime Text's configuration files into the repository and symlink the folder to let Sublime Text use them again.

##### Configuration

Copy all current configurations you could have to the repository:

```bash
cp -Riv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/ ~/geojuji/app/sublime-text
```

Then, delete the current `User` folder and create a symlink to link the configuration again:

```bash
rm -r ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
ln -s ~/geojuji/app/sublime-text ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```

Now, all Sublime Text's configurations can be found under `~/geojuji/app/sublime-text/` folder.

##### Binary

To add `subl` command, create a symlink with the following command:

```bash
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```
