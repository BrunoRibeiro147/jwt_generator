#!/usr/bin/env bash

set -e

mix local.hex --if-missing --force
mix local.rebar --if-missing --force
mix deps.get

cp infra/.bashrc ~/.bashrc

echo "ENTRYPOINT: Complete"

exec "$@"
