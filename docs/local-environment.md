# Configure a local environment for projects

**Table of content:**

1. [Set a local PHP Environment](#1-set-a-local-php-environment)
1. [VHosts: Default local host](#2-vhosts-default-local-host)
1. [VHosts: Custom local host](#3-vhosts-custom-local-host)
1. [SSL: Generate a certificate](#4-ssl-generate-a-certificate)
1. [SSL: Set Apache to use a certificate](#5-ssl-set-apache-to-use-a-certificate)

---

## 1. Set a local PHP Environment

To develop PHP projects, you will need the following to be installed and set:

-   [PHP](http://php.net/): Should be already installed on your machine.
-   [Apache Server](https://httpd.apache.org/): To serve project on your local machine.
-   [MySQL](https://www.mysql.com/): To get the right one for your OS, [check the MYSQL archives](https://downloads.mysql.com/archives/community/).
-   [Sequel Pro](https://www.sequelpro.com/): To help you manage your local database

:no_entry: Since each OS has its own way to install this differents compoments, I will not go in details and let you use Google to find the correct way to install them.

## 2. VHosts: Default local host

Since we develop multiple websites, we need to configure our local hosts to works properly.

1. Edit `/etc/apache2/httpd.conf` and uncommented `Include /etc/apache2/extra/httpd-vhosts.conf`.
1. Edit `/etc/apache2/extra/httpd-vhosts.conf` to add a basic localhost config:

    ```apache
    #
    # Configuration LOCALHOST
    #

    <VirtualHost *:80>
        ServerName localhost
        DocumentRoot /Users/[username]/Sites/  # <-- To adjust

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
            IndexStyleSheet "localhost.css"  # <-- To adjust
        </ifModule>

        ServerAdmin admin@localhost.com
        ErrorLog "/var/log/apache2/dev_error_log"
        CustomLog "/var/log/apache2/dev_access_log" common
    </VirtualHost>
    ```

    `DocumentRoot` is where you will have all your local websites on your machine.

    `IndexStyleSheet` is a path to your stylesheet for localhost display. If you use a custom stylesheet, the stylesheet file should be under your `[DocumentRoot]` folder to work. Since we can add a custom stylesheet, you can use our example `~/geojuji/app/apache2/localhost.css` or comment that line.

Now, `http://localhost/` should display your folders and files under your `[DocumentRoot]` folder.

## 3. VHosts: Custom local host

Since we have now a default localhost, let's set a custom hosts for projects.

1. Edit `/etc/apache2/extra/httpd-vhosts.conf` and add your custom host configuration.

    ```apache
    # How it works:
    # - http://project.client.folder.domain.ext/
    # - http://%-5.%-4.%-3.%-2.%-1/  # We start replace from the end

    #
    # Configuration *.*.DEV.DOMAIN.com
    #

    <VirtualHost *:80>
        ServerName list.dev.domain.com
        ServerAlias *.*.dev.domain.com
        ServerAlias www.*.*.dev.domain.com
        VirtualDocumentRoot /Users/[username]/Sites/develop/%-4/%-5/ # <--To adjust

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

    127.0.0.1   project1.client.dev.domain.com
    ```

Now, when you go to `http://project1.client.dev.domain.com`, you can see the sources of your website that you develop under `[DocumentRoot]/develop/client/project1/` folder.

## 4. SSL: Generate a certificate

Sometime we want to get a certificate for our localhost website, either to use in local development or for distribution with a native application.

1. Generate a key for the server with no passphrase:

    ```
    mkdir ~/.ssh/ssl/
    cd ~/.ssh/ssl/
    sudo ssh-keygen -f php-server.key
    ```

1. Create the certificate request file with information that will be used in the SSL certificate:

    ```
    sudo openssl req -new -key php-server.key -out php-request.csr
    ```

1. Create the self-signed certificate:

    ```
    sudo openssl x509 -req -days 365 -in php-request.csr -signkey php-server.key -out php-server.crt
    ```

## 5. SSL: Set Apache to use a certificate

Once the certificate generated, you need to configure Apache to use the certificate created.

1. In `/etc/apache2/httpd.conf`, you need to enable `ssl_module` and uncommented `/etc/apache2/extra/httpd-ssl.conf`.
1. Edit `/etc/apache2/extra/httpd-ssl.conf`:

    Add the following/uncommented lines

    ```
    SSLCertificateFile "~/.ssh/ssl/php-server.crt"
    SSLCertificateKeyFile "~/.ssh/ssl/php-server.key"
    ```

    And then remove/comment the following one:

    ```
    SSLCACertificatePath
    SSLCARevocationPath
    ```

1. Go to `/etc/apache2/extra/httpd-vhosts.conf` and adjust our virtual host to use SSL:

    ```apache
    <VirtualHost *:443>
        ServerName list.local
        ServerAlias *.*.local # <--To adjust
        ServerAlias www.*.*.local # <--To adjust
        VirtualDocumentRoot /Users/[username]/Sites/develop/%-4/%-5/ # <--To adjust

        SSLEngine on
        SSLCipherSuite ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP:+eNULL
        SSLCertificateFile /Users/[username]/.ssh/ssl/php-server.crt # <--To adjust
        SSLCertificateKeyFile /Users/[username]/.ssh/ssl/php-server.key # <--To adjust
    </VirtualHost>
    ```

1. Restart Apache and test config to be sure everything works:

    ```
    sudo apachectl restart
    sudo apachectl configtest
    ```
