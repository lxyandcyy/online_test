FROM nginx
WORKDIR /app
COPY dist .

COPY cret/ /cret
COPY nginx.conf /etc/nginx/nginx.conf
