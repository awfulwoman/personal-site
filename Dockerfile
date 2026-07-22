FROM nginx
ARG SOURCEDIR=public
COPY ${SOURCEDIR} /usr/share/nginx/html
