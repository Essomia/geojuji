# PHP Environment

**Note**: This local setup is very basic and tailored for HTML, CSS, JS, and basic PHP projects. For more complex PHP projects, consider using a virtual machine or Docker.

## 1. Setup PHP and Apache

To develop PHP projects, you'll need:

-   [PHP](http://php.net/): To compile PHP projects.
-   [Apache Server](https://httpd.apache.org/): To serve projects locally.
-   [MySQL](https://www.mysql.com/): To save information in a local database.

:memo: I recommend using tools like **XAMPP** or **MAMP** for an easy setup. These tools provide a simple interface to run PHP and Apache locally and allow you to manage multiple projects simultaneously.

## 2. Setup Virtual Host: Root

For handling multiple websites, you can configure a virtual host to create easy-to-remember URLs for your local PHP projects.

### Steps:

1. **Edit the Apache configuration file** `/etc/apache2/httpd.conf`:

    - Uncomment this line:
        ```apache
        Include /private/etc/apache2/extra/httpd-vhosts.conf
        ```
    - Set the server name:
        ```apache
        ServerName userhost:80
        ```
    - Update the `User` and `Group` directives:
        ```apache
        User [username]
        Group staff
        ```

2. **Edit the virtual host configuration file** `/etc/apache2/extra/httpd-vhosts.conf` to set up a basic localhost configuration:

    ```apache
    #
    # LOCALHOST Configuration
    #
    <Directory /Users/[username]/Sites/>  # <-- Adjust this to match [DocumentRoot]
        Options FollowSymLinks Multiviews Indexes
        AllowOverride All
        Require all granted
    </Directory>

    <VirtualHost *:80>
        ServerName localhost
        DocumentRoot /Users/[username]/Sites/  # <-- Adjust this to match [DocumentRoot]

        ServerAdmin admin@localhost.com
        ErrorLog "/var/log/apache2/dev_error_log"
        CustomLog "/var/log/apache2/dev_access_log" common
    </VirtualHost>
    ```

    Replace `[DocumentRoot]` with the folder where your local websites are stored.

3. Restart Apache and test the configuration:

    ```bash
    sudo apachectl restart
    sudo apachectl configtest  # This should return 'Syntax OK'
    ```

4. Verify that `http://localhost/` displays the directories and files under your `[DocumentRoot]`.

## 3. Setup Virtual Host: Custom Domain

To simplify project URLs further, you can configure custom hosts.

### Steps:

1. **Enable the virtual host alias module** in `/etc/apache2/httpd.conf`:

    - Uncomment the line:
        ```apache
        LoadModule vhost_alias_module libexec/apache2/mod_vhost_alias.so
        ```

2. **Edit the virtual host configuration file** `/etc/apache2/extra/httpd-vhosts.conf` to define custom hosts:

    ```apache
    # How it works:
    # - http://name4.name3.name2.name1.ext/
    # - http://%-5.%-4.%-3.%-2.%-1/  # We start replace from the end

    #
    # Custom Host Configuration
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

    This configuration supports custom subdomains like `project1.domain.local` and maps them to your project folder automatically.

3. **Update the `/etc/hosts` file** to list your local website URLs:

    ```plaintext
    #
    # VIRTUAL HOSTS
    #

    127.0.0.1   project1.domain.local
    ```

4. Restart Apache and verify the configuration:

    ```bash
    sudo apachectl restart
    sudo apachectl configtest  # This should return 'Syntax OK'
    ```

5. Access your project in a browser by navigating to `http://project1.domain.local`. This will load the website files located in `[DocumentRoot]/develop/project1/`.
