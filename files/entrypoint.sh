#!/bin/bash

if [ -z "$PS1" ]; then
  export INTERACTIVE=false
else
  export INTERACTIVE=true
fi

mkdir -p /etc/hammer/cli.modules.d
dockerize \
  -template /cli_config.yml:/etc/hammer/cli_config.yml \
  -template /foreman.yml:/etc/hammer/cli.modules.d/foreman.yml

exec /usr/local/bundle/bin/hammer $@
