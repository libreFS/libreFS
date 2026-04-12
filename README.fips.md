# libreFS FIPS Builds

libreFS supports FIPS builds using the `GOEXPERIMENT=boringcrypto` Go toolchain, which uses BoringCrypto (from BoringSSL, which is [FIPS 140-2 validated](https://csrc.nist.gov/csrc/media/projects/cryptographic-module-validation-program/documents/security-policies/140sp2964.pdf)) published by the Go team [here](https://github.com/golang/go/tree/dev.boringcrypto/misc/boring).

FIPS builds are published as part of each release on [GitHub Releases](https://github.com/libreFS/libreFS/releases) for `linux-amd64` with the suffix `.fips`.

We are not making any statements or representations about the suitability of this code or build in relation to the FIPS 140-2 standard. Users will need to evaluate for themselves whether this meets their own requirements.
