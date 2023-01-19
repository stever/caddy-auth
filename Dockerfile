FROM caddy:2 AS base

FROM caddy:2-builder AS caddybuild
RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v1.1

FROM base AS final
COPY --from=caddybuild /usr/bin/caddy /usr/bin/caddy
