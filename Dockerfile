# Usa imagem oficial do PHP com Apache
FROM php:8.2-apache

# Instala dependências necessárias + extensões do PostgreSQL
RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Baixa o Adminer e salva como index.php
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/html/index.php

# Permissão
RUN chmod 755 /var/www/html/index.php

# Expondo porta do Apache
EXPOSE 80
