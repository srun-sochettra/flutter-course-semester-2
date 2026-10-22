# Repository refresh

## Recommended identity

- Current slug: flutter-course-semester-2.
- Recommended slug: **flutter-movie-browser**.
- Display title: **Flutter Movie Browser**.
- Suggested description: **Semester 2 Flutter coursework with TMDB movie and people browsing, detail navigation, Provider state and in-memory response caching.**
- Suggested topics: flutter, dart, tmdb, provider, coursework, movie-app.

The name describes this repository's actual example and avoids colliding with the first-semester repository already renamed flutter-coursework. Semester context remains in the README. No GitHub rename, description/topic update, commit or push was performed.

The internal package name flutter_application_123 and platform identifiers remain unchanged.

## Apply

Extract into the existing repository root. Replace README.md and add CONTRIBUTING.md, SECURITY.md and the two files under docs/. Keep all original source, lockfile, binary assets, platform files and Git history. This is a documentation overlay, not a full application archive.

The exposed API credential is not included in this ZIP. The original source still contains it; credential rotation and source cleanup are separate tasks. No code, permissions, dependencies or signing settings were changed.

## Editorial changes

The README replaces the starter template with a concise account of movie/people browsing and the coursework architecture. It distinguishes stored preference helpers from working settings controls, in-memory response maps from a complete offline catalogue and an unused downloader from a shipped feature.

No screenshots, licence, test results, release downloads or API configuration mechanism were invented.

## Verification boundary

Read all application Dart files and the widget test, plus the manifest/lockfile and relevant Android/macOS configuration. Other platform scaffolding was inventoried rather than exhaustively audited. The generated build report was identified; it was not rendered or treated as a current build result. Binary assets were not visually inspected.

Checked local documentation links, selected source assertions, archive integrity and delivered bytes. No dependency installation, Dart/Flutter compilation, analysis, tests, API requests, image downloads or device/browser sessions were performed.

To revert, restore the original README and remove the four added documents using version control.
