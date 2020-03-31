FROM nginx:1.14.0-alpine
LABEL mantainer="lmtbelmonte@cloud-bigdata.net"
RUN apk --no-cache add python2 py2-pip && pip2 install j2cli[yaml]
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN rm -rf /usr/share/nginx/html/*
COPY --chown=1 /src /usr/share/nginx/html
COPY --chown=1 nginx.conf.j2 /templates/
COPY --chown=1 docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]