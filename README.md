# cernivec-si

Personal homepage built with Jekyll.

## Dependencies

This repository tracks Ruby dependencies with Bundler:

- `Gemfile`
- `Gemfile.lock`

Both development (`docker-compose.yml`) and production (`Dockerfile` + `docker-compose.prod.yml`) expect these files to be present.

## Overview

This project now uses two modes:

- **Development**: run Jekyll locally for authoring/preview.
- **Production**: build static site and serve it from Nginx via Docker.

Production does **not** use `jekyll serve`.

---

## Development (local preview)

If you already have a dev `docker-compose.yml`, keep using it for local editing and live preview.

Typical command:

````bash
docker compose up -d
````

Then open:

- `http://localhost:4000` (or your configured port)

---

## Production setup

Production files:

- `Dockerfile` (multi-stage: Jekyll build + Nginx runtime)
- `deploy/nginx.conf`
- `docker-compose.prod.yml`

### Build and run

````bash
cd /home/ales/Workspace/site/cernivec-si
docker compose -f docker-compose.prod.yml up --build -d
````

Site is served on:

- `http://localhost:8080`

### Stop

````bash
docker compose -f docker-compose.prod.yml down
````

### Rebuild after content changes

````bash
git pull
docker compose -f docker-compose.prod.yml up --build -d
````

---

## Quick test recommendations

Run these checks after deployment:

### 1) Container is healthy/running

````bash
docker compose -f docker-compose.prod.yml ps
docker compose -f docker-compose.prod.yml logs --tail=100
````

### 2) Homepage responds

````bash
curl -I http://localhost:8080
````

Expected: `HTTP/1.1 200 OK`.

### 3) Cache headers are correct

HTML should be no-cache:

````bash
curl -I http://localhost:8080/
````

Expected header includes:

- `Cache-Control: no-cache`

Assets should be long-lived cache (if `/assets/...` exists):

````bash
curl -I http://localhost:8080/assets/<your-asset-file>
````

Expected header includes:

- `Cache-Control: public, immutable`

### 4) Security headers present

````bash
curl -I http://localhost:8080 | grep -Ei 'x-content-type-options|x-frame-options|referrer-policy'
````

Expected to include:

- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: SAMEORIGIN`
- `Referrer-Policy: strict-origin-when-cross-origin`

---

## Notes

- Posts with future dates are not published by default.
- Use external TLS termination (for example Cloudflare or reverse proxy with Let’s Encrypt) for HTTPS in production.