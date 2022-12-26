FROM caddy:2 AS base

FROM caddy:2-builder AS caddybuild
RUN xcaddy build \
    --with github.com/greenpau/caddy-security

FROM base AS final
COPY --from=caddybuild /usr/bin/caddy /usr/bin/caddy
