FROM ruby:2.3

ENV DOCKERIZE_VERSION=v0.3.0 \
    FOREMAN_CLI_VERSION=0.9.0 \
    VERIFY_SSL=true

RUN apt-get update && \
    apt-get install -y ca-certificates wget && \
    wget -q https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN gem install hammer_cli_foreman -v $FOREMAN_CLI_VERSION

COPY /files /

ENTRYPOINT ["/entrypoint.sh"]
