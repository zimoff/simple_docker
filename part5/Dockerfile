# Используем базовый образ nginx
#FROM nginx
# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Обновляем пакеты и устанавливаем Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочий каталог в /home/
WORKDIR /home/

# Копируем локальный файл nginx.conf внутрь контейнера по пути /etc/nginx/nginx.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Копируем локальные файлы server.c, start.sh внутрь контейнера
COPY ./server.c /home/server.c
COPY ./start.sh /home/start.sh

# Объединяем apt-get update с apt-get install и oчищаем кэш apt-get после установки пакетов
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists

USER nginx
# Устанавливаем точку входа для контейнера, запускаем start.sh
ENTRYPOINT ["sh", "./start.sh"]
HEALTHCHECK NONE


