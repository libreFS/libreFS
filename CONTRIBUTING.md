# libreFS Contribution Guide

The libreFS community welcomes your contribution. To make the process as seamless as possible, we recommend you read this guide before opening a pull request.

## Development Workflow

Fork the repository, make changes in a branch, and send a pull request. We encourage pull requests to discuss code changes. Here are the steps in detail:

### Set up your local repository

Fork [libreFS](https://github.com/libreFS/libreFS/fork) on GitHub, then clone your fork:

```sh
git clone https://github.com/<your-username>/libreFS
cd libreFS
```

All builds run inside Docker — no Go toolchain installation needed on your machine:

```sh
make -f Makefile.docker image   # build the dev image once
make -f Makefile.docker build   # compile the librefs binary
```

### Set up the upstream remote

```sh
git remote add upstream https://github.com/libreFS/libreFS
git fetch upstream
git merge upstream/master
```

### Create a feature branch

Before making code changes, create a separate branch:

```sh
git checkout -b my-new-feature
```

### Test your changes

After making code changes:

- Add test cases for new code
- Run `make -f Makefile.docker test` — all tests must pass
- Run `make -f Makefile.docker verifiers` — linting must pass with zero warnings
- Squash your commits into a single commit with `git rebase -i`

### Commit format

```
<type>: <short description>

<longer description if needed>

Fixes #<issue number>
```

Types: `fix`, `feat`, `docs`, `refactor`, `test`, `chore`, `security`

### Push and open a Pull Request

```sh
git push origin my-new-feature
```

Then open a pull request on GitHub against the `master` branch. Pull requests are reviewed and merged once approved.

## Core Principles

Please read these before contributing — they reflect why libreFS exists:

1. **Never remove user-facing features.** The whole point of libreFS is preserving features MinIO removed. If something needs deprecating, open a GitHub Discussion first.
2. **No telemetry.** libreFS must never send usage data or call external endpoints without explicit user opt-in.
3. **S3 API compatibility.** Never break S3 API or `mc` admin API compatibility.
4. **Security first.** Report vulnerabilities privately to `hello@librefs.org` — do not open public issues for security bugs.

## FAQs

### How does libreFS manage dependencies?

libreFS uses `go mod` to manage its dependencies.

- Run `go get foo/bar` in the source folder to add a dependency to `go.mod`
- Run `go mod tidy` to remove unused dependencies

All `go` commands should be run inside Docker via `make -f Makefile.docker`.

### What are the coding guidelines?

libreFS follows standard Go style. Refer to [Effective Go](https://go.dev/doc/effective_go) and [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments).

If you observe offending code, feel free to send a pull request or open an issue.
