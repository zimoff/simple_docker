# Используем базовый образ nginx
FROM nginx

# Устанавливаем рабочий каталог в /home/
WORKDIR /home/

# Копируем локальный файл nginx.conf внутрь контейнера по пути /etc/nginx/nginx.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Копируем локальные файлы server.c, start.sh внутрь контейнера
COPY ./server.c .
COPY ./start.sh .

# Обновляем пакеты в контейнере
RUN apt-get update 

# Устанавливаем необходимые пакеты gcc, spawn-fcgi, libfcgi-dev
RUN apt-get install -y gcc spawn-fcgi libfcgi-dev

# Устанавливаем точку входа для контейнера, запускаем start.sh
ENTRYPOINT ["sh", "./start.sh"]

