
# About
Kibana on alpine linux
> [wikipedia.org/wiki/Kibana](https://en.wikipedia.org/wiki/Kibana)


For elasticsearch on alpine check.
[danielguerra/alpine-elasticsearch](https://hub.docker.com/r/danielguerra/alpine-elasticsearch/)

# Alpine kibana
This is image works the same as the official kibana image.
The nodejs from kibana was removed and the nodejs from Alpine
was added.

![Kibana](https://www.runabove.com/images/apps/elasticsearch-and-kibana.png)


# About
Kibana on alpine linux
> [wikipedia.org/wiki/Kibana](https://en.wikipedia.org/wiki/Kibana)

For elasticsearch on alpine check.
[danielguerra/elasticsearch-kibana](https://hub.docker.com/r/danielguerra/elasticsearch-kibana/)


## Tags

latest  kibana 6.3.0 (use with elasticsearch 6.3.0)
6.1.1   kibana 6.2.4 (use with elasticsearch 6.2.4)
6.2.2   kibana 6.2.2 (use with elasticsearch 6.2.2)
6.1.2	kibana 6.1.2 (use with elasticsearch 6.1.1/2)
6.1.1   kibana 6.1.1 (use with elasticsearch 6.1.1)
5.3.0   kibana 5.3.0 (use with elasticsearch 5.3.0)
5.0.0   kibana 5.0.0 (use with elasticsearch 5.0.0)



# Usage

You can run the default kibana command simply:

$ docker run --link some-elasticsearch:elasticsearch -d kibana
You can also pass in additional flags to kibana:

$ docker run --link some-elasticsearch:elasticsearch -d danielguerra/alpine-kibana --plugins /somewhere/else
This image includes EXPOSE 5601 (default port). If you'd like to be able to access the instance from the host without the container's IP, standard port mappings can be used:

$ docker run --name some-kibana --link some-elasticsearch:elasticsearch -p 5601:5601 -d danielguerra/alpine-kibana
You can also provide the address of elasticsearch via ELASTICSEARCH_URL environnement variable:

$ docker run --name some-kibana -e ELASTICSEARCH_URL=http://some-elasticsearch:9200 -p 5601:5601 -d danielguerra/alpine-kibana
Then, access it via http://localhost:5601 or http://host-ip:5601 in a browser.
