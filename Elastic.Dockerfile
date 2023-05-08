FROM elastic/elasticsearch:8.7.0

COPY certs/ config/certs/

ENV ELASTIC_PASSWORD=changeme
ENV xpack.security.transport.ssl.enabled=true

USER 0

RUN bin/elasticsearch-certutil ca --silent --pem -out config/certs/ca.zip; \
    unzip config/certs/ca.zip -d config/certs;

RUN chown -r elasticsearch:elasticsearch config/certs; \
    chmod -R 750 config/certs; \
    chmod 640 config/certs/ca/ca.crt;

RUN ls -la /usr/share/elasticsearch/config/certs/ca/; \
    sleep 10

ENV xpack.security.http.ssl.enabled=true
ENV xpack.security.http.ssl.key=certs/ca/ca.key
ENV xpack.security.http.ssl.certificate=certs/ca/ca.crt


USER elasticsearch

CMD ["bin/elasticsearch"]