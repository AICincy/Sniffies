# APK Development Baseline

## Evidence scope

This baseline comes from static inspection of `sniffies-app-c0f0650.apk`. It records observable package metadata and bundled configuration. It does not establish ownership, source availability, backend access, licensing, application safety, or authority to distribute a derivative.

## Observed technology

| Area | Static observation | Workbench decision |
| --- | --- | --- |
| Web application | Angular entry point and bundled web assets | Angular 21 LTS |
| Native bridge | Capacitor configuration and generated bridge | Capacitor 8.5.1 |
| Android API | Minimum API 26, target and compile API 36 | API 26 minimum, API 36 target and compile |
| CPU support | arm64-v8a, armeabi-v7a, x86, x86_64 | Use the standard Capacitor host; select device ABI when testing |
| Signing | APK Signature Scheme v2 verifies | Use a new debug signing identity for the workbench |

The machine-readable record is in `config/apk-baseline.json`. The artifact checksum is in `ARTIFACTS.md`.

## Workbench boundaries

The Android host uses `org.aicincy.sniffies.workbench`, not `com.sniffies.app`. Android will not accept a replacement for the supplied package unless it has the original signing key. The workbench therefore begins as an independent environment for authorized development and analysis.

The supplied package declares Capacitor integrations for analytics, camera, device data, file access, geolocation, in-app browser, network state, preferences, push notifications, splash screen, status bar, update delivery, crash reporting, native settings, and safe-area handling. Plugin names alone do not establish their configurations or behavior. Add a plugin only with a stated feature requirement and the required credentials or platform configuration.

## Local requirements

- Node.js 24.13 or newer for the current Angular 21 LTS workspace.
- Temurin JDK 21.
- Android SDK platform 36, Build Tools 36.0.0, and platform tools.
- An Android 26 or newer device or emulator for runtime testing.

Run `npm run doctor` from `app/` to verify the first three requirements. Run `npm run apk:inspect` to confirm the supplied APK checksum and report its manifest summary without unpacking it into the project.

## Development sequence

1. Implement or revise web code in `app/src/`.
2. Run `npm run verify`.
3. Run `npm run android:sync`.
4. Run `npm run android:build` to assemble the separate debug workbench package.
5. Before enabling a native capability, document its permission, data handling, and any required provider configuration.

Do not add production signing keys, Firebase configuration, update URLs, analytics identifiers, or service credentials to the repository.
