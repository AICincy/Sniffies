# Sniffies Agent Guide

## Project status

This workspace contains a supplied Android APK, an independent Angular and Capacitor workbench in `app/`, and a local `Skills/` reference library. Treat the APK as an immutable input unless a task explicitly authorizes replacing it. Do not infer the app's behavior, ownership, licensing, or intended deployment from its filename alone.

The workbench uses Angular 21 LTS and Capacitor 8.5.1. Its Android application ID is `org.aicincy.sniffies.workbench`, intentionally distinct from the APK's signed package ID. Do not try to ship it as an update to the supplied APK without the original source and signing key.

## Sources of truth

1. The user's latest request controls scope and acceptance criteria.
2. The current repository state controls files, configuration, and history.
3. The local `Skills/README.txt` describes the intended skill-library direction. Read it before relying on or changing the local skill archives.
4. The files in `Skills/` are reference packages. Do not unpack, install, modify, or publish them unless the task explicitly requires it.

## Working rules

- Inspect `git status`, the relevant source files, and existing configuration before editing.
- Keep changes small, reviewable, and compatible with Windows and GitHub Actions.
- Preserve user changes and binary artifacts. Do not rewrite Git history, force-push, delete files, or change repository visibility without explicit approval.
- Do not claim that an Android artifact works without a reproducible install or runtime check.
- When source code is added, use the repository's existing formatter, linter, test runner, and package manager. Do not introduce a second toolchain without a clear need.
- Run the narrowest relevant validation after each change. Report the command and result.
- Run `npm run doctor` from `app/` before native Android work, `npm run verify` before a handoff, and `npm run android:build` before claiming the Android host builds.

## Secrets and sensitive material

- Never read, print, commit, or transmit credentials from `.env`, `*-key.txt`, `PAT.txt`, or similarly named files.
- Commit only documented variable names and safe placeholders in `.env.example`.
- If a credential was tracked or pushed, remove it from current tracking, require rotation, and obtain explicit approval before any history rewrite.
- Do not use real keys in tests, examples, issue reports, or GitHub Actions logs.

## GitHub collaboration

- Keep repository documentation current when project capabilities or setup steps change.
- Use the templates in `.github/` for issues and pull requests.
- Treat GitHub repository settings, branch protection, secrets, releases, and external publishing as human-controlled settings unless the user explicitly authorizes those changes.

## Completion standard

For reusable changes, complete: inspect -> edit -> validate -> report. Include remaining human-controlled GitHub actions when they cannot be verified locally.
