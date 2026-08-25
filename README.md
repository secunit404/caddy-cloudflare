# Caddy with Cloudflare DNS

Multi-architecture Caddy image with the official Cloudflare DNS module for
ACME DNS-01 challenges.

```text
ghcr.io/secunit404/caddy-cloudflare:latest
```

The image contains only Caddy and the module. Supply a Caddyfile and set the
Cloudflare token at runtime:

```caddyfile
*.home.example.com {
    tls {
        dns cloudflare {env.CF_API_TOKEN}
        resolvers 1.1.1.1
    }
}
```

The token should be limited to the relevant Cloudflare zone with `Zone:Read`
and `DNS:Edit` permissions.

## Updates

Dependabot monitors the official Caddy base image and the Cloudflare Go module.
Successful dependency pull requests are merged automatically. GitHub Actions
then publishes updated `linux/amd64` and `linux/arm64` images to GHCR, moving the
`latest` tag to the new digest.

Dockhand or another digest-aware container manager can detect and apply the
updated `latest` image like any normal container update.
