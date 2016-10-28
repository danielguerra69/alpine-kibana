# Alpine kibana
This is image works the same as the official kibana image.
The nodejs from kibana was remove and the nodejs from Alpine
was added.

# What is Kibana?
Kibana is an open source data visualization plugin for Elasticsearch. It provides visualization capabilities on top of the content indexed on an Elasticsearch cluster. Users can create bar, line and scatter plots, or pie charts and maps on top of large volumes of data.

Kibana is a registered trademark of Elasticsearch BV.

wikipedia.org/wiki/Kibana

# How to use this image
You can run the default kibana command simply:

$ docker run --link some-elasticsearch:elasticsearch -d kibana
You can also pass in additional flags to kibana:

$ docker run --link some-elasticsearch:elasticsearch -d danielguerra/alpine-kibana --plugins /somewhere/else
This image includes EXPOSE 5601 (default port). If you'd like to be able to access the instance from the host without the container's IP, standard port mappings can be used:

$ docker run --name some-kibana --link some-elasticsearch:elasticsearch -p 5601:5601 -d danielguerra/alpine-kibana
You can also provide the address of elasticsearch via ELASTICSEARCH_URL environnement variable:

$ docker run --name some-kibana -e ELASTICSEARCH_URL=http://some-elasticsearch:9200 -p 5601:5601 -d danielguerra/alpine-kibana
Then, access it via http://localhost:5601 or http://host-ip:5601 in a browser.
