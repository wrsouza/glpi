FROM php:7.4-apache

COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  software-properties-common \
  apt-utils \
  libzip-dev zip unzip \
  libpq-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libicu-dev \
  git \
  wget \
  vim \
  nodejs \
  yarn

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-configure intl

RUN docker-php-ext-install gd intl pdo_mysql mysqli zip

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clear package lists
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR /var/www

RUN a2enmod rewrite

RUN wget https://github.com/glpi-project/glpi/archive/refs/tags/9.5.7.zip

RUN unzip 9.5.7.zip -d /var/www

RUN mv /var/www/glpi-9.5.7/* /var/www/html

RUN chmod 755 /var/www/html

RUN chmod 777 -R /var/www/html/files

RUN chmod 777 -R /var/www/html/config

RUN chmod +x /var/www/html/bin/console

RUN php /var/www/html/bin/console dependencies install

WORKDIR /var/www/html

EXPOSE 80