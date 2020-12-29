# Configure local environment

## 1. Set a local PHP Environment

To develop PHP projects, you will need the following binaries to be installed and setted:

-   [PHP](http://php.net/): To compile PHP projects.
-   [Apache Server](https://httpd.apache.org/): To serve project on your local machine.
-   [MySQL](https://www.mysql.com/): To save informations in a local database. To get the right one for your OS, [check the MYSQL archives](https://downloads.mysql.com/archives/community/).

Sometime, your OS could come with some version already installed. You can try the following command to know if they are already installed:

```bash
which php
which mysql
which apachectl ; which httpd
```

:no_entry: Since each OS has its own way to install this differents compoments, I will not go in details and let you use Google to find the correct way to install them.

:memo: Please note that this local setup is very basic and it is oriented for HTML, CSS, JS and basic PHP.

:warning: Nowadays, each project, whether it be done in php, javascript, .net or others, often requires a complex and particular setup. For better maintenance over time, I strongly recommend that you look at virtual machines (like docker or kubernetes) to create easily maintainable setups.

## 2. VHosts: Default localhost

Since we develop multiple websites, we need to configure our local hosts to works properly.

1. Edit `/etc/apache2/httpd.conf`:

    - Uncommented `Include /etc/apache2/extra/httpd-vhosts.conf`.
    - Uncommented and modify to have `ServerName userhost:80`.

1. Edit `/etc/apache2/extra/httpd-vhosts.conf` to add a basic localhost config:

    ```apache
    #
    # Configuration LOCALHOST
    #
    <Directory /Users/[username]/Sites/>  # <-- To adjust [DocumentRoot]
        Options FollowSymLinks Multiviews Indexes
        Require all granted
    </Directory>

    <VirtualHost *:80>
        ServerName localhost
        DocumentRoot /Users/[username]/Sites/  # <-- To adjust [DocumentRoot]

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
            IndexStyleSheet "localhost.css"  # <-- To adjust [IndexStyleSheet]
        </ifModule>

        ServerAdmin admin@localhost.com
        ErrorLog "/var/log/apache2/dev_error_log"
        CustomLog "/var/log/apache2/dev_access_log" common
    </VirtualHost>
    ```

    `[DocumentRoot]` is where you will have all your local websites on your machine.

    `[IndexStyleSheet]` is a path to your stylesheet for localhost display. If you use a custom stylesheet, the stylesheet file should be under your `[DocumentRoot]` folder to work. Since we can add a custom stylesheet, you can use our example `~/geojuji/app/apache2/localhost.css` or comment that line.

1. Restart Apache and test config to be sure everything works:

    ```bash
    sudo apachectl restart
    sudo apachectl configtest # This command should return a 'Syntax OK'
    ```

:memo: Now, `http://localhost/` should display your folders and files under your `[DocumentRoot]` folder.

## 3. VHosts: Custom localhost domain

Since we have now a default localhost, let's set a custom hosts for projects.

1. Edit `/etc/apache2/httpd.conf`:

    - Uncommented `LoadModule vhost_alias_module libexec/apache2/mod_vhost_alias.so`.

1. Edit `/etc/apache2/extra/httpd-vhosts.conf` and add your custom host configuration or adjust the one bellow:

    ```apache
    # How it works:
    # - http://name4.name3.name2.name1.ext/
    # - http://%-5.%-4.%-3.%-2.%-1/  # We start replace from the end

    #
    # Configuration custom
    #

    <VirtualHost *:80>
        ServerName list.domain.local
        ServerAlias *.domain.local
        ServerAlias www.*.domain.local
        VirtualDocumentRoot /Users/[username]/Sites/develop/%-3/

        ServerAdmin admin@localhost.com
        ErrorLog "/var/log/apache2/dev_error_log"
        CustomLog "/var/log/apache2/dev_access_log" common
    </VirtualHost>
    ```

1. Then, edit `/etc/hosts` to list your local websites urls.

    ```apache
    #
    # VIRTUAL HOSTS
    #

    127.0.0.1   project1.domain.local
    ```

1. Restart Apache and test config to be sure everything works:

    ```bash
    sudo apachectl restart
    sudo apachectl configtest # This command should return a 'Syntax OK'
    ```

:memo: Now, when you go to `http://project1.domain.local`, you can see the sources of your website that you develop under `[DocumentRoot]/develop/project1/` folder.

## 4. VHosts: Allow PHP on localhost project

Now we do have our project showing and displaying, but PHP script doesn't works. We need to load the related module on our Apache configuration.

1. Edit `/etc/apache2/httpd.conf`:

    - Uncommented `LoadModule php7_module libexec/apache2/libphp7.so`.

1. Restart Apache and test config to be sure everything works:

    ```bash
    sudo apachectl restart
    sudo apachectl configtest # This command should return a 'Syntax OK'
    ```
