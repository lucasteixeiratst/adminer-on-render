# Use imagem oficial do PHP com Apache
FROM php:8.2-apache

# Instala extensão do PostgreSQL no PHP
RUN docker-php-ext-install pdo pdo_pgsql pgsql

# Baixa o Adminer
RUN mkdir -p /var/www/html
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/html/index.php

# Permissões
RUN chmod 755 /var/www/html/index.php

# Expõe a porta padrão do Apache
EXPOSE 80
