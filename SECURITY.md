# Security Policy

## Reporting a vulnerability

Do not place vulnerability details, credentials, access tokens, or private keys in a public issue. Use GitHub's private vulnerability-reporting feature if it is enabled for this repository. If it is not enabled, contact a repository maintainer privately.

## Credential handling

Credentials belong only in local, ignored configuration such as `.env`. If a credential is committed or pushed, rotate it immediately. Removing a file from the latest commit does not remove it from Git history; history rewriting requires explicit maintainer approval.

## Scope notes

The supplied APK is an input artifact, not evidence of its safety or behavior. Do not publish conclusions about it without a reproducible analysis and the necessary authorization.
