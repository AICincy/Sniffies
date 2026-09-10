# Sniffies

Initial project workspace for Sniffies. The repository currently includes a supplied Android APK and a local skill-reference library. Application source and a documented build process have not yet been added.

An independent Angular and Capacitor workbench is now available in `app/`. It is configured from static APK metadata, but it is not the original signed application and cannot update it.

## Repository layout

- `sniffies-app-c0f0650.apk`: supplied Android artifact. Keep it unchanged unless a task expressly replaces it.
- `Skills/`: local reference skill archives. Read `Skills/README.txt` before using or changing them.
- `.env.example`: safe environment-variable template. Create a local `.env` from it when configuration is introduced.
- `ARTIFACTS.md`: checksum inventory for supplied binary inputs.
- `config/apk-baseline.json`: machine-readable static metadata observed from the supplied APK.
- `docs/APK-BASELINE.md`: framework, Android, signing, and reproduction boundaries.
- `app/`: Angular 21 LTS and Capacitor 8.5.1 workbench with a separate Android package ID.

## Contributor setup

1. Clone the repository.
2. Copy `.env.example` to `.env` only if the task needs local configuration.
3. Keep credentials, tokens, keys, and private certificates out of Git.
4. Read `AGENTS.md` before making project changes.
5. From `app/`, run `npm run doctor`, then `npm run verify`.

## Current guardrails

- Do not treat the APK filename as proof of application behavior or provenance.
- Do not commit generated build outputs, IDE files, local credentials, or API keys.
- Report security concerns through the process in `SECURITY.md`; do not include secret values in issues.

See `CONTRIBUTING.md` for collaboration expectations.
