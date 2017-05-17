FROM php:latest

# Repository/Image Maintainer
LABEL maintainer Mauricio Rodrigues <mauricio@ooppah.com>

RUN echo " ---> install necessaries dependencies. " && \
        apt-get update -yqq && \
        apt-get install -yqq \
        git \
        nodejs \
        libcurl4-gnutls-dev \
        libicu-dev \
        libmcrypt-dev \
        libvpx-dev \
        libjpeg-dev \
        libpng-dev \
        libxpm-dev \
        zlib1g-dev \
        libfreetype6-dev \
        libxml2-dev \
        libexpat1-dev \
        libbz2-dev \
        libgmp3-dev \
        libldap2-dev \
        unixodbc-dev \
        libpq-dev \
        libsqlite3-dev \
        libaspell-dev \
        libsnmp-dev \
        libpcre3-dev \
        libtidy-dev

RUN echo " ---> install php extensions. " && \
        docker-php-ext-install \
        mbstring \
        mcrypt \
        pdo_mysql \
        curl \
        json \
        intl \
        gd \
        xml \
        zip \
        bz2 \
        opcache \
        soap \
        xml
        
RUN echo "---> Adding the php-user" && \
        adduser --disabled-password --gecos "" php-user && \
        echo "php-user  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
        chown -R php-user:php-user /home/php-user
USER php-user

WORKDIR "/home/php-user/"

RUN curl -sS https://getcomposer.org/installer | php
