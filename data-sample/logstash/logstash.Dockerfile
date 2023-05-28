FROM elastic/logstash:8.7.1

# import the logstash config
COPY logstash.conf /usr/share/logstash/pipeline/logstash.conf

# import the logstash yml config
COPY logstash.yml /usr/share/logstash/config/logstash.yml

# import log sample
COPY web.log /usr/share/logstash/data/web.log

# import the ca cert
COPY ca.crt /usr/share/logstash/config/certs/ca/ca.crt

CMD [ \
    "/usr/share/logstash/bin/logstash", \
    "-f", \
    "/usr/share/logstash/pipeline/logstash.conf" \
    ]