FROM hexpm/elixir:1.15.8-erlang-26.2.5.1-ubuntu-noble-20240605 AS build
EXPOSE 4000

## Standard Elixir Mix-Based Local Dev Image
#####################################################################################
RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    inotify-tools \
    openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

ENV ERL_AFLAGS="-kernel shell_history enabled"

RUN mix local.hex --force \
    && mix local.rebar --force

ENTRYPOINT ["infra/entrypoint.sh"]
CMD ["bash"]
