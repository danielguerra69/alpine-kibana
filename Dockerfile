FROM alpine:3.4
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>
ENV KIBANA_VER=5.3.0
RUN apk --update --no-cache add nodejs openssl ca-certificates \
&& cd /usr/share \
&& wget https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VER-linux-x86_64.tar.gz -O - | tar xvfz - \
&& mv kibana-$KIBANA_VER-linux-x86_64 kibana \
&& rm -rf kibana/node \
&& apk del openssl ca-certificates \
&& rm  -rf /tmp/* /var/cache/apk/*
RUN addgroup kibana
RUN adduser  -G kibana -s /bin/false -D kibana
RUN chown -R kibana:kibana /usr/share/kibana
RUN sed -i "s/#elasticsearch\.url/elasticsearch\.url/g" /usr/share/kibana/config/kibana.yml
RUN sed -i "s/:\/bin/:\/bin:\/usr\/share\/kibana\/bin/" /etc/profile
ADD docker-entrypoint.sh /usr/sbin
EXPOSE 5601
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["kibana"]
