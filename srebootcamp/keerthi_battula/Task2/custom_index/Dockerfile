FROM nginx:latest
RUN rm -v /etc/nginx/conf.d/default.conf
copy .  /usr/share/nginx/custom_index
copy default.conf /etc/nginx/conf.d/
