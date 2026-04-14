# Post-Baseline Cherry-Pick Analysis

Baseline: `RELEASE.2025-04-22T22-12-26Z`

This document classifies every commit in each post-baseline upstream release.
Use it as the reference when cherry-picking fixes into libreFS.

## Legend

- ✅ **TAKE** — safe to cherry-pick (bug fix, security fix, perf, new non-breaking feature)
- ❌ **SKIP** — do not cherry-pick (removes features, libreFS branding/docs, AIStor-era console, release bumps)
- ⚠️ **REVIEW** — cherry-pick with care; see note

## Console module note

The `github.com/minio/console` repo has been deleted from GitHub. Our baseline
pins to `v1.7.6` (last public release, Feb 2025) which includes the full WebUI
with LDAP/OIDC. **All post-baseline "Update console" commits are automatically
skipped** — they point to pseudo-versions from the now-deleted AIStor-era repo
that cannot even be fetched.

---

## Interval 1 — baseline → `RELEASE.2025-05-24T17-08-30Z`

| Hash | Commit | Decision |
|------|--------|----------|
| `12a6ea89c` | fix: Use mime encode for Non-US-ASCII metadata (#21282) | ✅ TAKE |
| `63e102c04` | heal: Avoid disabling scanner healing in single/dist erasure mode (#21302) | ✅ TAKE |
| `ef9b03fbf` | fix: unable to get net.Interface cause panic (#21277) | ✅ TAKE |
| `c0a33952c` | Allow FTPS to force TLS (#21251) | ✅ TAKE |
| `6d18dba9a` | return error for AppendObject() API (#21272) | ✅ TAKE |
| `9ea14c88d` | cleanup: use NewWithOptions replace deprecated one (#21243) | ✅ TAKE |
| `30a1261c2` | fix: track object and bucket for expireAll (#21241) | ✅ TAKE |
| `0e017ab07` | feat: support nats nkey seed auth (#21231) | ✅ TAKE |
| `93c389dbc` | fix: return actual error from RemoveRemoteTargetsForEndpoint (#21238) | ✅ TAKE |
| `ddd9a84cd` | allow concurrent aborts on active uploadParts() (#21229) | ✅ TAKE |
| `f01374950` | Use go mod tool to install tools for go generate (#21232) | ✅ TAKE |
| `18aceae62` | Fix nil dereference in adding service account (#21235) | ✅ TAKE |
| `427826abc` | update minio/kms-go/kms SDK (#21233) | ✅ TAKE |
| `2780778c1` | Revert "Fix: Change TTFB metric type to histogram (#20999)" | ✅ TAKE |
| `8cad40a48` | Update UI console to the latest version (#21278) | ❌ SKIP — AIStor-era console (repo deleted) |
| `160f8a901` | Update Console UI to latest version (#21294) | ❌ SKIP — AIStor-era console (repo deleted) |
| `1d50cae43` | remove support for FIPS 140-2 with boringcrypto (#21292) | ❌ SKIP — removes compliance feature |
| `ecde75f91` | docs: use github-style-notes in the readme (#21308) | ❌ SKIP — libreFS-specific docs |
| `b7540169a` | Add documentation for replication_max_lrg_workers (#21236) | ❌ SKIP — libreFS docs |
| `2d8ba15b9` | Correct spelling (#21225) | ❌ SKIP — libreFS docs |
| `f14198e3d` | update with newer pkger release | ❌ SKIP — libreFS release tooling |
| `bd6dd55e7` | Update yaml files to latest version RELEASE.2025-04-22T22-12-26Z | ❌ SKIP — release bump |

---

## Interval 2 — `RELEASE.2025-05-24` → `RELEASE.2025-06-13T11-33-47Z`

| Hash | Commit | Decision |
|------|--------|----------|
| `a6c538c5a` | fix: honor renamePart's PathNotFound (#21378) | ✅ TAKE |
| `e1fcaebc7` | fix: ListMultipartUploads append result should filter with bucket (#21376) | ✅ TAKE |
| `21409f112` | add networkpolicy for job and egress ports in helm (#20951) | ✅ TAKE |
| `417c8648f` | use provided region in tier configuration for S3 backend (#21365) | ✅ TAKE |
| `e2245a0b1` | allow cross-compiling support for RISC-V 64 (#21348) | ✅ TAKE |
| `b4b3d208d` | Add targetArn label for bucket replication metrics (#21354) | ✅ TAKE |
| `0a36d41dc` | modernizes for loop in cmd/, internal/ (#21309) | ✅ TAKE |
| `ea77bcfc9` | fix: panic for TestListObjectsWithILM (#21322) | ✅ TAKE |
| `9f24ca5d6` | fix: empty fileName cause Reader nil for PostPolicyBucketHandler (#21323) | ✅ TAKE |
| `2c7fe094d` | s3: Fix early listing stopping when ILM is enabled (#472) (#21246) | ✅ TAKE |
| `816666a4c` | make some targeted updates to README.md (#21125) | ❌ SKIP — libreFS branding/docs |
| `9ebe16878` | add pull requests etiquette | ❌ SKIP — libreFS-specific governance docs |
| `ee2028cde` | Update yaml files to latest version RELEASE.2025-05-24T17-08-30Z | ❌ SKIP — release bump |

---

## Interval 3 — `RELEASE.2025-06-13` → `RELEASE.2025-07-18T21-56-31Z`

| Hash | Commit | Decision |
|------|--------|----------|
| `4021d8c8e` | fix: lambda handler response to match the lambda return status (#21436) | ✅ TAKE |
| `de234b888` | fix: admin api - SetPolicyForUserOrGroup avoid nil deref (#21400) | ✅ TAKE |
| `2718d9a43` | CopyObject must preserve checksums and encrypt them if required (#21399) | ✅ TAKE |
| `a65292cab` | Update Console to latest version (#21397) | ❌ SKIP — AIStor-era console (repo deleted) |
| `e0c79be25` | Update yaml files to latest version RELEASE.2025-06-13T11-33-47Z | ❌ SKIP — release bump |

---

## Interval 4 — `RELEASE.2025-07-18` → `RELEASE.2025-07-23T15-54-02Z`

| Hash | Commit | Decision |
|------|--------|----------|
| `50fcf9b67` | fix boundary value bug when objTime ends in whole seconds (#21419) | ✅ TAKE |
| `64f5c6103` | wait for metadata reads on minDisks+1 for HEAD/GET when data==parity (#21449) | ✅ TAKE |
| `e909be638` | send replication requests to correct pool (#1162) | ✅ TAKE |
| `83b2ad418` | fix: restrict SinglePool by the minimum free drive threshold (#21115) | ✅ TAKE |
| `7a64bb976` | Add support for X25519MLKEM768 (#21435) | ✅ TAKE |
| `7ced9663e` | simplify validating policy mapping (#21450) | ⚠️ REVIEW — removes `validateAndAddRolePolicyMappings` which logged warnings when OpenID/authn-plugin role policies don't exist; functionally equivalent but drops the warning log |
| `34679befe` | Update yaml files to latest version RELEASE.2025-07-18T21-56-31Z | ❌ SKIP — release bump |

---

## Interval 5 — `RELEASE.2025-07-23` → `RELEASE.2025-09-07T16-13-09Z`

| Hash | Commit | Decision |
|------|--------|----------|
| `07c3a429b` | fix: conditional checks write for multipart (#21567) | ✅ TAKE |
| `d0f50cdd9` | fix: use correct dummy ARN for claim-based OIDC provider when listing access keys (#21549) | ✅ TAKE — OIDC fix |
| `da532ab93` | Fix support for legacy compression env variables (#21533) | ✅ TAKE |
| `558fc1c09` | fix: return error on conditional write for non existing object (#21550) | ✅ TAKE |
| `5c87d4ae8` | fix: when save the rebalanceStats not found the config file (#21547) | ✅ TAKE |
| `f0b91e550` | Run modernize (#21546) | ✅ TAKE |
| `3b7cb6512` | Revert dns.msgUnPath, fixes #21541 (#21542) | ✅ TAKE |
| `4ea6f3b06` | fix: invalid checksum on site replication with conforming checksum types (#21535) | ✅ TAKE |
| `86d9d9b55` | fix: use amqp.ParseURL to parse amqp url (#21528) | ✅ TAKE |
| `5a35585ac` | http/listener: fix bugs and simplify (#21514) | ✅ TAKE |
| `b44b2a090` | fix: when claim-based OIDC is configured, treat unknown roleArn as claim-based auth (#21512) | ✅ TAKE — OIDC fix |
| `c7d6a9722` | Modify permission verification type (#21505) | ✅ TAKE |
| `a8abdc797` | fix: add name and description to ldap accesskey list (#21511) | ✅ TAKE — LDAP fix |
| `0638ccc5f` | fix: claim based oidc for official aws libraries (#21468) | ✅ TAKE — OIDC fix |
| `b1a34fd63` | fix: errUploadIDNotFound will be ignored when err is from peer client (#21504) | ✅ TAKE |
| `ffcfa36b1` | Check legalHoldPerm (#21508) | ✅ TAKE |
| `376fbd11a` | fix(helm): do not suspend versioning by default for buckets (#21494) | ✅ TAKE |
| `c76f209cc` | Optimize outdated commands in the log (#21498) | ✅ TAKE |
| `7a6a2256b` | imagePullSecrets consistent types for global, local (#21500) | ✅ TAKE |
| `d002beaee` | feat: add variable for datasource in grafana dashboards (#21470) | ✅ TAKE |
| `71f293d9a` | fix: record extra skippedEntry for listObject (#21484) | ✅ TAKE |
| `e3d183b6a` | bring more idempotent behavior to AbortMultipartUpload() (#21475) | ✅ TAKE |
| `02ba581ec` | custom user-agent transport wrapper (#21483) | ⚠️ REVIEW — adds libreFS User-Agent header to outbound OIDC/LDAP HTTP requests; not telemetry, but rename "libreFS" → "libreFS" in the UA string before cherry-picking |
| `9fdbf6fe8` | Updated object-browser to the latest version v2.0.4 (#21564) | ❌ SKIP — AIStor-era console (repo deleted) |
| `752abc2e2` | Update console to v2.0.3 (#21474) | ❌ SKIP — AIStor-era console (repo deleted) |
| `0848e6960` | Update docs links throughout (#21513) | ❌ SKIP — libreFS docs links |
| `0cde98290` | Update yaml files to latest version RELEASE.2025-09-06T17-38-46Z | ❌ SKIP — release bump |
| `b9f0e8c71` | Update yaml files to latest version RELEASE.2025-07-23T15-54-02Z | ❌ SKIP — release bump |

---

## Interval 6 — `RELEASE.2025-09-07` → `RELEASE.2025-10-15T17-29-55Z` (CVE release)

| Hash | Commit | Decision |
|------|--------|----------|
| `c1a49490c` | fix: check sub-policy properly when present (#21642) | ✅ TAKE — IAM/security fix |
| `1b8ac0af9` | fix: allow trailing slash in AWS S3 POST policies (#21612) | ✅ TAKE — S3 compatibility |
| `ba3c0fd1c` | Bump Go version in toolchain directive to 1.24.8 (#21629) | ✅ TAKE — toolchain update |
| `534f4a9fb` | fix: timeN function return final closure not be called (#21615) | ✅ TAKE |
| `b8631cf53` | Use new gofumpt (#21613) | ✅ TAKE |
| `456d9462e` | fix: after saveRebalanceStats cancel will be empty (#21597) | ✅ TAKE |
| `756f3c814` | fix: incorrect poolID when after decommission adding pools (#21590) | ✅ TAKE |
| `7a80ec1cc` | fix: LDAP TLS handshake fails with StartTLS and tls_skip_verify=off (#21582) | ✅ TAKE — important LDAP fix |
| `ae71d7690` | fix: remove unnecessary replication checks (#21569) | ✅ TAKE |
| `9e49d5e7a` | update README.md and other docs to point to source only releases | ❌ SKIP — libreFS marketing (declares source-only distribution, irrelevant to us) |
| `334c313da` | Change documentation link in README (#21636) | ❌ SKIP — libreFS docs |
| `d51a4a4ff` | Update README with Docker and Helm installation instructions (#21627) | ❌ SKIP — libreFS docs |
| `62383dfbf` | Fix formatting of features in README.md | ❌ SKIP — libreFS docs |
| `bde0d5a29` | Updating readme for libreFS docs (#21625) | ❌ SKIP — libreFS docs |

> **Note on the CVE fix:** The CVE (GHSA-jjjj-jwhf-8rgr — privilege escalation via session policy bypass) is the primary reason for this release. The fix is spread across several commits in this interval. `c1a49490c` is the most directly related one. Verify all IAM-touching commits before cherry-picking.

---

## Summary counts

| Interval | TAKE | REVIEW | SKIP |
|----------|------|--------|------|
| 1 (baseline → May) | 14 | 0 | 8 |
| 2 (May → Jun) | 10 | 0 | 3 |
| 3 (Jun → Jul-18) | 3 | 0 | 2 |
| 4 (Jul-18 → Jul-23) | 5 | 1 | 1 |
| 5 (Jul-23 → Sep) | 22 | 1 | 5 |
| 6 (Sep → Oct) | 9 | 0 | 5 |
| **Total** | **63** | **2** | **24** |

## REVIEW items to resolve before cherry-picking

1. **`7ced9663e`** (interval 4) — `simplify validating policy mapping`: removes warning logs when OpenID/authn-plugin role policies don't exist. Low risk; lean toward TAKE.
2. **`02ba581ec`** (interval 5) — `custom user-agent transport wrapper`: cherry-pick with a one-line change to replace `"libreFS"` with `"libreFS"` in the user-agent string.
