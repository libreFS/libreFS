# libreFS Documentation

**libreFS** is a community-maintained, fully open-source S3-compatible object storage server — forked from libreFS at `RELEASE.2025-04-22T22-12-26Z`, the last fully open-source libreFS release before the WebUI, LDAP/OIDC support, distributed mode, and pre-built binaries were moved to the proprietary AIStor product.

Everything in libreFS's open-source edition is preserved here, permanently, under the GNU AGPL v3.0.

---

## Quick Start

=== "Docker"

    ```bash
    docker run -d \
      -p 9000:9000 -p 9001:9001 \
      -e MINIO_ROOT_USER=admin \
      -e MINIO_ROOT_PASSWORD=password \
      -v /data:/data \
      ghcr.io/librefs/librefs:latest server /data \
      --console-address :9001
    ```

    S3 API is available on **:9000**, the web console on **:9001**.

=== "Binary (Linux amd64)"

    ```bash
    curl -LO https://github.com/libreFS/libreFS/releases/latest/download/librefs-linux-amd64
    curl -LO https://github.com/libreFS/libreFS/releases/latest/download/librefs-linux-amd64.sha256sum
    sha256sum -c librefs-linux-amd64.sha256sum
    chmod +x librefs-linux-amd64
    ./librefs-linux-amd64 server /tmp/data --console-address :9001
    ```

=== "From Source"

    ```bash
    git clone https://github.com/libreFS/libreFS.git
    cd libreFS
    go build -o librefs .
    ./librefs server /tmp/data --console-address :9001
    ```

---

## What's included

| Feature | Status |
|---------|--------|
| Embedded Web Console (port 9001) | ✅ Included |
| LDAP / Active Directory authentication | ✅ Included |
| OIDC / OpenID Connect (Keycloak, Dex, Okta…) | ✅ Included |
| Distributed erasure coding (multi-node) | ✅ Included |
| Pre-built binaries for all platforms | ✅ Included |
| Server-side encryption (SSE-S3, SSE-C, SSE-KMS) | ✅ Included |
| Bucket lifecycle, versioning, replication | ✅ Included |
| Prometheus metrics & Grafana dashboards | ✅ Included |
| S3 Select (SQL queries on objects) | ✅ Included |
| FTP/SFTP protocol support | ✅ Included |
| 100% S3 API compatibility | ✅ Included |

---

## Key differences from upstream libreFS

libreFS is a **drop-in replacement** for libreFS. The S3 API, environment variable names (`MINIO_*`), and admin API are all identical. Existing applications, SDKs, and tooling work without any changes.

What is different:

- The binary is named **`librefs`** (not `minio`)
- The CLI client is **`lc`** (not `mc`) — available at [github.com/libreFS/librefs-cli](https://github.com/libreFS/librefs-cli)
- Docker images are at `ghcr.io/librefs/librefs` (not `minio/minio`)
- No telemetry, no "update available" calls to external endpoints

---

## Next steps

- [Deploy with Docker](docker/README.md)
- [Configure distributed mode](distributed/README.md)
- [Set up LDAP authentication](sts/ldap.md)
- [Configure TLS](tls/README.md)
- [Enable Prometheus metrics](metrics/prometheus/README.md)
