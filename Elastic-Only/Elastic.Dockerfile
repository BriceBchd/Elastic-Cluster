FROM elastic/elasticsearch:8.7.0

COPY certs/ config/certs/

USER 0

RUN bin/elasticsearch-certutil ca --silent --pem -out config/certs/ca.zip; \
    unzip config/certs/ca.zip -d config/certs;

RUN chown -r elasticsearch:elasticsearch config/certs; \
    chmod -R 750 config/certs; \
    chmod 640 config/certs/ca/ca.crt;

RUN ls -la /usr/share/elasticsearch/config/certs/ca/; \
    sleep 10

RUN chown -R elasticsearch:elasticsearch config/certs/ca/ca.crt; \
    chmod 640 config/certs/ca/ca.crt;

ENV ELASTIC_PASSWORD=changeme1
ENV xpack.security.transport.ssl.enabled=true
ENV xpack.security.http.ssl.enabled=true
ENV xpack.security.http.ssl.key=certs/ca/ca.key
ENV xpack.security.http.ssl.certificate=certs/ca/ca.crt
ENV xpack.security.http.ssl.certificate_authorities=certs/ca/ca.crt
ENV xpack.security.transport.ssl.key=certs/ca/ca.key
ENV xpack.security.transport.ssl.certificate=certs/ca/ca.crt
ENV xpack.security.transport.ssl.certificate_authorities=certs/ca/ca.crt
ENV cluster.name=docker-cluster
ENV cluster.initial_master_nodes=es01
ENV discovery.seed_hosts=es01,es02

USER elasticsearch

CMD ["bin/elasticsearch"]