FROM nginx
WORKDIR /home/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./start.sh /home/start.sh
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists
USER nginx
ENTRYPOINT ["sh", "./start.sh"]
HEALTHCHECK NONE
