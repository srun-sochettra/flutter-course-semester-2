# Contributing

Keep changes focused on the coursework's learning goals: Flutter UI, navigation, API integration and state handling. Read the [README](README.md) and [implementation notes](docs/implementation-notes.md) first.

## Working rules

- Trace the active startup path before modifying the separate MovieApp wrapper.
- Preserve the package name and platform identifiers unless an explicit migration is requested. A GitHub rename does not require changing Dart imports.
- Use synthetic response fixtures for tests; never commit a real API key or credential-bearing request URL.
- Retain the lockfile and review dependency changes separately from unrelated UI work.
- Do not advertise helpers as user-facing features until the active interface calls them.

## Verification

Run flutter analyze and flutter test in the real project and report exact results. The existing smoke test is narrow and does not mock storage or network dependencies. A passing MaterialApp assertion is not evidence that data loaded successfully.

For non-trivial changes, add focused checks for model parsing, failed HTTP responses, force refresh and detail navigation. Relevant manual scenarios include empty lists, missing images, invalid credentials, offline requests, long biographies, orientation changes and returning from detail screens.

If connecting preferences, verify both visible behaviour and restart persistence. If exposing image saving, verify permission denial and the gallery-save result before reporting success. Test Android release networking separately from debug operation.

For UI changes, check text scaling, narrow layouts, keyboard/focus where applicable and loading/error recovery. Do not claim accessibility conformance from screenshots alone.

## Pull requests

Describe the problem, focused change, checks run and remaining gaps. Include credential, permission, persistence and platform implications where relevant. Keep generated build reports and private local paths out of commits. Follow [SECURITY.md](SECURITY.md) for sensitive concerns.
