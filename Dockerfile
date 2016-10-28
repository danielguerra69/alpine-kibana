FROM alpine:3.4
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

RUN apk --update --no-cache add nodejs
WORKDIR /usr/share
RUN wget http://download.elastic.co/kibana/kibana/kibana-4.6.2-linux-x86_64.tar.gz -O - | tar xvfz - \
    && mv kibana-4.6.2-linux-x86_64 kibana \
    && rm -rf kibana/node
RUN addgroup kibana
RUN adduser  -G kibana -s /bin/false -D kibana
RUN chown -R kibana:kibana /usr/share/kibana
RUN sed -i "s/# elasticsearch\.url/elasticsearch\.url/g" /usr/share/kibana/config/kibana.yml
RUN sed -i "s/localhost:9200/elasticsearch:9200/g" /usr/share/kibana/config/kibana.yml
RUN sed -i "s/:\/bin/:\/bin:\/usr\/share\/kibana\/bin/" /etc/profile
ADD docker-entrypoint.sh /usr/sbin
EXPOSE 5601
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["kibana"]
