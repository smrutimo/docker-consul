FROM consul:latest

RUN apk --no-cache add bash

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/local/bin/wait-for-it.sh

COPY *.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wait-for-it.sh /usr/local/bin/startup.sh /usr/local/bin/import-keys.sh

RUN mkdir -p /kv-init

VOLUME /kv-init

ENTRYPOINT ["startup.sh"]

CMD ["agent", "-dev", "-client", "0.0.0.0"]
