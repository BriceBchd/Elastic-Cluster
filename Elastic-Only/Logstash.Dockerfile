# Path: Logstash.Dockerfile
FROM elastic/logstash:8.7.0

COPY ./certs/ /usr/share/logstash/config/certs/

RUN bin/logstash-keystore create && \
    bin/logstash-keystore add elasticsearch.ssl.certificateAuthorities /usr/share/logstash/config/certs/ca.crt && \
    bin/logstash-keystore add elasticsearch.ssl.certificate /usr/share/logstash/config/certs/logstash.crt && \
    bin/logstash-keystore add elasticsearch.ssl.key /usr/share/logstash/config/certs/logstash.key && \
    chown -R logstash:logstash config/certs/ && \
    chmod -R 755 config/certs/