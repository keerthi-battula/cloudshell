FROM nginx:latest
RUN rm -v /etc/nginx/conf.d/default.conf

# Copy a configuration file from the current directory
COPY default.conf /etc/nginx/conf.d/
COPY . /usr/share/nginx/custom/
