#!/usr/bin/env bash

set -e

if [ "$1" = 'convert' ]; then
  exec clinvar-rdf "$@"
fi

exec "$@"
