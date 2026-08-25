FROM caddy:2.11.4-builder-alpine AS builder

WORKDIR /build
COPY go.mod ./

RUN CLOUDFLARE_VERSION="$(go list -m -f '{{.Version}}' github.com/caddy-dns/cloudflare)" \
    && xcaddy build \
        --with "github.com/caddy-dns/cloudflare@${CLOUDFLARE_VERSION}"

FROM caddy:2.11.4-alpine

LABEL org.opencontainers.image.source="https://github.com/secunit404/caddy-cloudflare" \
      org.opencontainers.image.description="Caddy with the Cloudflare DNS module" \
      org.opencontainers.image.licenses="MIT"

COPY --from=builder /build/caddy /usr/bin/caddy
