#!/bin/bash

# Компилируем сервер из файла server.c в исполняемый файл server, используя библиотеку libfcgi
gcc -o server server.c -lfcgi

# Запускаем FastCGI-процесс на порту 8080, используя скомпилированный серверный исполняемый файл ./server
spawn-fcgi -p 8080 ./server

# Запускаем сервис Nginx
service nginx start

# Очищаем переменные среды после использования
unset NGINX_GPGKEY NGINX_GPGKEY_PATH GNUPGHOME found server savedAptMark tempDir dpkgArch nginxPackages

# Запускаем интерактивную оболочку Bash для поддержания активности контейнера
/bin/bash

