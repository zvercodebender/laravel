FROM fedora:31
MAINTAINER Rick Broker <rbroker@blackpugsoftware.com>

RUN dnf -y install httpd httpd-tools php-imap php-mbstring php-pecl-memcache php-mcrypt php-pear-Mail \
    php-pear-Mail-Mime php-cli php-pdo php-mysqlnd php-xml php-xmlrpc php-ldap php-bcmath php-mbstring php-pdo php-xml php-zip \
    php-pecl-apcu php-common php-pear-Net-Socket php-pear-Net-SMTP php-json php-pecl-json-post \
    php-pear-HTTP-Request php php-odbc php-soap php-pear php-gd php-fpm \
    php-pear-Auth-SASL php-pear-Net-URL mod_ssl mod_perl \
    php-pear-MDB2-Driver-mysqli php-zendframework-zend-db.noarch \
    sudo libjpeg-turbo libmcrypt libpng12 procps  git findutils wget && \
    dnf -y update && \
    dnf clean all

COPY composer-install.sh /composer-install.sh
COPY start.sh /start.sh

RUN chmod +x /composer-install.sh && \
    chmod +x /start.sh && \
    /composer-install.sh && \
    cp /composer.phar /bin/composer

RUN composer global require laravel/installer && \
    ln -s /root/.composer/vendor/bin/laravel /bin/laravel

VOLUME /var/www
EXPOSE 8000

CMD ["/start.sh"]
