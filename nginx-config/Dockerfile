FROM nginx

RUN rm /etc/nginx/conf.d/default.conf

ADD services.conf /etc/nginx/conf.d/

# ADD bihama_cert_chain.crt /etc/ssl/

# ADD bihama.key /etc/ssl


RUN ls /etc/nginx/conf.d/