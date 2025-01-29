# Dockerfile
# Use base image for container
FROM richarvey/nginx-php-fpm:latest
# Copy all application code into your Docker container
COPY . .
# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

RUN apk update
# Install the `npm` package
RUN apk add --no-cache npm
# Install NPM dependencies
RUN npm install
# Build Vite assets
RUN npm run build
CMD ["/start.sh"]