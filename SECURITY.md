# Security Policy

## Supported Versions

We always provide security updates for the [latest release](https://github.com/libreFS/libreFS/releases/latest).
When a security update is available, upgrade to the latest version.

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Report security bugs by email to **hello@librefs.org**. Your email will be acknowledged
within 48 hours, and you will receive a more detailed response within 72 hours indicating
the next steps in handling your report.

Please provide a detailed explanation of the issue — in particular, the type of vulnerability
(DoS, authentication bypass, information disclosure, etc.) and the assumptions you are making
(e.g. whether access credentials are required for a successful exploit).

## Disclosure Process

libreFS uses the following disclosure process:

1. The security report is received and a maintainer verifies and reproduces the issue to determine its impact.
2. A maintainer responds to confirm or reject the report. If rejected, the response explains why.
3. The codebase is audited for similar problems.
4. A fix is prepared and tested against the latest release.
5. The fix is applied and a security advisory is published on the [GitHub repository](https://github.com/libreFS/libreFS/security/advisories).

Please indicate in your report email whether you would like to be credited for the discovery.
By default we will **not** publish your name or contact details to protect your privacy.

This process can take time, especially when coordination with maintainers of other projects is required.
Every effort will be made to handle the issue as quickly as possible while following the process above.
