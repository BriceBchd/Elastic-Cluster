# Path: Kibana.Dockerfile
FROM elastic/kibana:8.7.0

COPY ./certs/ /usr/share/kibana/config/certs/

RUN bin/kibana-keystore create && \
    bin/kibana-keystore add elasticsearch.ssl.certificateAuthorities /usr/share/kibana/config/certs/ca.crt && \
    bin/kibana-keystore add elasticsearch.ssl.certificate /usr/share/kibana/config/certs/kibana.crt && \
    bin/kibana-keystore add elasticsearch.ssl.key /usr/share/kibana/config/certs/kibana.key && \
    chown -R kibana:kibana config/certs/ && \
    chmod -R 755 config/certs/