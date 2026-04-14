# libreFS Roadmap

This document describes the strategic direction for the libreFS project.
It is a living document — priorities will shift based on community feedback.

---

## What's already shipped

- Fork baseline at `RELEASE.2025-04-22T22-12-26Z` — preserving WebUI, LDAP/OIDC, distributed mode
- CI/CD pipeline with automated builds, tests, and vulnerability scanning
- First release `RELEASE.2026-04-12T22-27-24Z` — binaries for linux/amd64, linux/arm64, darwin/amd64, windows/amd64
- Docker image on GHCR (`ghcr.io/librefs/librefs`)
- Website live at librefs.org
- Server fully rebranded (binary, banners, log messages, logo)
- All known vulnerabilities patched (Go 1.26, updated dependencies)
- WebUI console rebranded with libreFS logo and color palette

---

## Phase 1 — Foundation (now → community of 10 users)

**Goal:** Be a trustworthy, easy-to-deploy drop-in replacement.
Do not add features yet. Build trust and findability.

### 1.1 Console rebranding
The WebUI (`console/` repo) still shows libreFS branding throughout.
Rebrand the console with the libreFS logo, colors, and name.
This is the most visible user-facing change remaining.

### 1.2 mc branding (`libreFS/mc`)
`minio/mc` is forked at `libreFS/mc`. Next steps: apply libreFS branding
(binary name, help text, update URLs), then release pre-built binaries
alongside the server on the same tag cadence.

**Why this matters:** Users searching for "how to use libreFS" will look
for a client. Having our own fork means we control the release cadence
and can patch quickly.

### 1.3 Documentation site
The website (librefs.org) currently has a Quick Start section but no
real documentation. We need at minimum:
- Deploy with Docker (single node)
- Deploy distributed (multi-node erasure coding)
- Configure LDAP authentication
- Configure OIDC login
- Using `mc` with libreFS

These docs are the primary SEO target — people searching for
"libreFS LDAP fork" or "open source libreFS alternative" should find us.

### 1.4 Community channels
- GitHub Discussions (enable on the repo) for Q&A and RFCs
- A simple `GOVERNANCE.md` explaining how decisions are made
- Clear "good first issue" labels to attract contributors

---

## Phase 2 — Community (10 users → first external contributor)

**Goal:** Make it easy for someone else to contribute a real fix.

### 2.1 Integration test suite
The current tests are unit tests only. Add integration tests that:
- Spin up a single-node libreFS instance (Docker)
- Run the S3 conformance test suite (e.g. libreFS's own `s3tests`)
- Verify LDAP authentication end-to-end
- Verify distributed mode with 4 nodes

This catches regressions that unit tests miss.

### 2.2 Helm chart
The existing Helm chart (`helm/`) is based on libreFS's. Rebrand and
validate it. Publish to a Helm repository (GitHub Pages is fine).
Kubernetes users are a large part of the target audience.

### 2.3 Cherry-pick automation
Currently cherry-picks from upstream are done manually. Build a
lightweight tool or GitHub Action that:
- Monitors libreFS releases for new commits
- Categorizes them (security, bug, feature, removal)
- Opens a GitHub Issue with the analysis for human review

This makes maintenance sustainable for a small team.

---

## Phase 3 — Differentiation (once we have contributors)

**Goal:** Add value that libreFS AIStor doesn't offer, rather than
trying to match AIStor feature-for-feature.

### 3.1 Better observability
Richer Prometheus metrics, structured JSON logs by default,
OpenTelemetry tracing support. DevOps teams care about this.

### 3.2 Plugin/extension system
An HTTP plugin interface so users can add custom authentication,
event handlers, or storage backends without forking the core.
This is the kind of architectural investment that builds a real ecosystem.

### 3.3 First-class PostgreSQL integration
S3-compatible storage is frequently used alongside PostgreSQL
(WAL archiving, backups via pgBackRest/Barman). First-class docs,
tested configurations, and potentially a `pg_librefs` extension
for direct SQL queries over object storage.

This is a concrete niche with an existing, underserved audience.

---

## What we will NOT do

- ❌ Reverse-engineer AIStor proprietary features — legally risky, enormous effort
- ❌ Add features before we have users asking for them
- ❌ Change `MINIO_*` env var names — breaks existing deployments
- ❌ Break S3 API or `mc` client compatibility
- ❌ Add telemetry of any kind

