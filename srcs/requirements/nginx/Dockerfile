FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl /var/www/html && \
    rm -rf /var/lib/apt/lists/*

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=BG/L=Benguerir/O=42/OU=Student/CN=abouramt.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
