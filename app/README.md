# SniffiesWorkbench

> This is an independent Angular and Capacitor workbench. It is not the original `com.sniffies.app` application and cannot create an update for that signed package.

## Project commands

```powershell
npm run doctor          # Verify Node, JDK 21, Android API 36, and build tools
npm run apk:inspect     # Re-check the supplied APK identity and manifest summary
npm run verify          # Build the web workbench and run unit tests
npm run android:sync    # Build web output and synchronize the Android host
npm run android:build   # Synchronize and assemble a debug APK
```

The native workbench package ID is `org.aicincy.sniffies.workbench`. Keep it distinct unless a future task supplies authorized source and signing material.

This project was generated using [Angular CLI](https://github.com/angular/angular-cli) version 21.2.23.

## Development server

To start a local development server, run:

```bash
ng serve
```

Once the server is running, open your browser and navigate to `http://localhost:4200/`. The application will automatically reload whenever you modify any of the source files.

## Code scaffolding

Angular CLI includes powerful code scaffolding tools. To generate a new component, run:

```bash
ng generate component component-name
```

For a complete list of available schematics (such as `components`, `directives`, or `pipes`), run:

```bash
ng generate --help
```

## Building

To build the project run:

```bash
ng build
```

This will compile your project and store the build artifacts in the `dist/` directory. By default, the production build optimizes your application for performance and speed.

## Running unit tests

To execute unit tests with the [Vitest](https://vitest.dev/) test runner, use the following command:

```bash
ng test
```

## Running end-to-end tests

For end-to-end (e2e) testing, run:

```bash
ng e2e
```

Angular CLI does not come with an end-to-end testing framework by default. You can choose one that suits your needs.

## Additional Resources

For more information on using the Angular CLI, including detailed command references, visit the [Angular CLI Overview and Command Reference](https://angular.dev/tools/cli) page.
