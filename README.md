# libreFS

libreFS is a community-maintained, full-featured S3-compatible object storage server,
forked from MinIO at `RELEASE.2025-04-22T22-12-26Z` — the last release before MinIO Inc.
moved the WebUI, LDAP/OIDC support, and distributed mode into their proprietary AIStor product.

**libreFS preserves and maintains:**
- Full embedded WebUI with LDAP and OIDC/external IDP login (on port 9001)
- Distributed erasure coding (multi-node deployments)
- Pre-compiled binary releases
- 100% S3 API compatibility
- Compatible with existing `mc` (MinIO Client) tooling

Licensed under [GNU AGPL v3.0](LICENSE).

## Quickstart

### Build from source

Requires [Go 1.24+](https://golang.org/dl/#stable).

```sh
git clone https://github.com/libreFS/libreFS.git
cd libreFS
go build -o librefs .
./librefs server /tmp/data --console-address :9001
```

The server starts with default root credentials `minioadmin:minioadmin`.
Open <http://127.0.0.1:9001> in your browser to access the web console.

### Run with Docker

```sh
docker build -f Dockerfile.dev -t librefs:dev .
docker run -p 9000:9000 -p 9001:9001 \
  -e MINIO_ROOT_USER=admin \
  -e MINIO_ROOT_PASSWORD=password \
  -v /tmp/librefs-data:/data \
  librefs:dev server /data --console-address :9001
```

### Connect with mc

```sh
mc alias set local http://localhost:9000 minioadmin minioadmin
mc admin info local
mc mb local/mybucket
mc cp ~/myfile local/mybucket/
```

## Test connectivity

### Web console

Point your browser to <http://127.0.0.1:9001> to access the embedded web console.
Log in with your root credentials. The console supports LDAP and OIDC login
when configured via environment variables.

## Explore further

- [libreFS documentation](docs/)
- [Erasure coding](docs/erasure/README.md)
- [Distributed deployment](docs/distributed/README.md)
- [IAM / external IDP (LDAP, OIDC)](docs/iam/)
- [KMS / encryption](docs/kms/README.md)
- [Metrics](docs/metrics/)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Security vulnerabilities should be
reported to `hello@librefs.org` — do not open public issues for security bugs.

## License

libreFS source is licensed under the [GNU AGPLv3](LICENSE).
Documentation is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
