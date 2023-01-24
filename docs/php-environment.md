# PHP Environment

> Please note that this local setup is very basic and it is oriented for HTML, CSS, JS and basic PHP.

## 1. Setup PHP and Apache

To develop PHP projects, you will need:

-   [PHP](http://php.net/): - To compile PHP projects.
-   [Apache Server](https://httpd.apache.org/) - To serve project on your local machine.
-   [MySQL](https://www.mysql.com/) - To save informations in a local database.

:memo: I recommand to use a tool like XAMPP or MAMP that provides a simple way to run PHP and Apache locally. These tools include a user interface and can be useful if you want to run multiple projects at once.

## 2. Setup Virtual Host: Root

Since we develop multiple websites, we can use a virtual host to get easy-to-remember URL for your local PHP project.

1. Edit `/etc/apache2/httpd.conf`:

    - Uncommented `Include /private/etc/apache2/extra/httpd-vhosts.conf`.
    - Uncommented and modify to have `ServerName userhost:80`.
    - Update `User _www` to `User [username]`
    - Updaye `Group _www` to `Group staff`

1. Edit `/etc/apache2/extra/httpd-vhosts.conf` to add a basic localhost config:

    ```apache
    #
    # Configuration LOCALHOST
    #
    <Directory /Users/[username]/Sites/>  # <-- To adjust, see [DocumentRoot]
        Options FollowSymLinks Multiviews Indexes
        AllowOverride All
        Require all granted
    </Directory>

    <VirtualHost *:80>
        ServerName localhost
        DocumentRoot /Users/[username]/Sites/  # <-- To adjust, see [DocumentRoot]

        ServerAdmin admin@localhost.com
        ErrorLog "/var/log/apache2/dev_error_log"
        CustomLog "/var/log/apache2/dev_access_log" common
    </VirtualHost>
    ```

    `[DocumentRoot]` is where you will have all your local websites on your machine.

1. Restart Apache and test config to be sure everything works:

    ```bash
    sudo apachectl restart
    sudo apachectl configtest # This command should return a 'Syntax OK'
    ```

1. Now, `http://localhost/` should display your folders and files under your `[DocumentRoot]` folder.

## 3. Setup Virtual Host: Custom domain

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

1. Now, when you go to `http://project1.domain.local`, you can see the sources of your website that you develop under `[DocumentRoot]/develop/project1/` folder.
