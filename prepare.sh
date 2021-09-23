#!/bin/bash

if [[ ! -f "docker-entrypoint-initdb.d/02-postgresql-wordnet30-data.sql" ]]; then
  gunzip -k data.sql.gz && mv data.sql docker-entrypoint-initdb.d/02-data.sql
fi
