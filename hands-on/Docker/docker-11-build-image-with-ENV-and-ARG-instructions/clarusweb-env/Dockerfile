
FROM nginx:latest
ENV COLOR=red
RUN apt-get update ; apt-get install curl -y
WORKDIR /usr/share/nginx/html
COPY . /usr/share/nginx/html
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost/ || exit 1
CMD sed -e s/COLOR// clarusweb.html > index.html ; rm clarusweb.html ; nginx -g 'daemon off;'

