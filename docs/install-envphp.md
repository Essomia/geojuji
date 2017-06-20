# GeoJuji, install PHP environment tools


## Installation

To develop PHP project, you will need the following to be installed and set:
- [PHP](http://php.net/)
- [Apache Server](https://httpd.apache.org/)
- [MySQL](https://www.mysql.com/) (Should be installed with Homebrew/Chocolatey formulas)
- [phpMyAdmin](https://www.phpmyadmin.net/)

Since each OS has its own way to install the differents compoments, I will not go in detail and let you use Google.



## Set default localhost

Since we develop multiple websites, we need to set our local hosts to works properly.

First, edit `/etc/apache2/extra/httpd-vhosts.conf` or `C:\xampp\apache\conf\extra\httpd-vhosts.conf` to add the basic localhost config:

```bash
#
# Default configuration LOCALHOST
#

<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /Users/[username]/Sites/

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
        # IndexStyleSheet "localhost.css"  # <-- you can add stylesheet for localhost
    </ifModule>

    ServerAdmin admin@localhost.com
    ErrorLog "/var/log/apache2/dev_error_log"
    CustomLog "/var/log/apache2/dev_access_log" common
</VirtualHost>
```

Now, when going to http://localhost/, you should see your projects list.



## Add a custom local host

Always in `httpd-vhosts.conf`, add any local host configuration.

Below, an example for `*.dev.domain.com`:

```bash
#
# Configuration *.DEV.DOMAIN.com
#

<VirtualHost *:80>
    ServerName list.dev.domain.com
    ServerAlias *.dev.domain.com
    ServerAlias www.*.dev.domain.com
    VirtualDocumentRoot /Users/[username]/Sites/dev/%-4/htdocs/

    ServerAdmin admin@localhost.com
    ErrorLog "/var/log/apache2/dev_error_log"
    CustomLog "/var/log/apache2/dev_access_log" common
</VirtualHost>
```

Then, edit `/etc/hosts` or `C:\windows\system32\drivers\etc\hosts` file to list all your local websites preceded by your localhost IP:

```bash
#
# VIRTUAL HOSTS
#

127.0.0.1   project1.dev.domain.com
127.0.0.1   project2.dev.domain.com
```

Now, when you go to `http://project1.dev.domain.com`, you will see the sources of the website you develop under `/Users/[username]/Sites/dev/project1/htdocs/` folder.
