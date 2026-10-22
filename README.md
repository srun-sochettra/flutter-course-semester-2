# Flutter Movie Browser

**Semester 2 Flutter coursework exploring movie discovery, API integration and persistent preferences.**

Browse now-playing movies and popular people from TMDB, then open individual detail screens. This project develops beyond static layouts into HTTP services, JSON models, asynchronous loading, Provider state and tab navigation.

This is a catalogue browser, not a film-streaming app. It is coursework rather than a published, production-tested product.

## Explore the app

- **Now playing:** poster cards with title labels and navigation to movie details.
- **Movie details:** poster, overview and release date.
- **Popular people:** profile-image grid and individual biography pages.
- **Request feedback:** loading states, retry buttons and pull-to-refresh handlers.
- **Navigation:** persistent bottom tabs for Home and People, plus a placeholder Settings tab.
- **Layout practice:** orientation-aware movie columns and a scroll-to-top button.

The services request the first page of each listing in English. Pagination metadata is parsed, but the interface does not implement loading subsequent pages.

## Built with

| Area | Implementation |
| --- | --- |
| UI | Flutter and Dart |
| State | Provider / ChangeNotifier |
| Data | TMDB HTTP requests and typed JSON models |
| Images | CachedNetworkImage |
| Navigation | Navigator and persistent_bottom_nav_bar_v2 |
| Preferences | flutter_secure_storage helpers for theme and grid style |
| Response reuse | Static in-memory maps in the service classes |

The theme and grid-style helpers are present, but no toggle controls call them in the supplied screens. The themed MovieApp wrapper is not on the current startup path. These are implementation exercises, not a finished settings feature.

## Before running

**The supplied source contains a hard-coded API credential in `lib/movie_module/api_key.dart`. Treat it as exposed and rotate it before further publication.** Its value is deliberately not reproduced in these documents. This documentation-only overlay does not remove it from source or Git history.

The current services import that file directly; there is no environment-file or dart-define loader. Use your own authorised replacement credential for local development after reviewing [SECURITY.md](SECURITY.md). Do not assume adding a `.env` file changes the application configuration or makes a client-side key secret.

## Local development

Use a Flutter installation compatible with the included lockfile: it records Dart `>=3.10.0 <4.0.0` and Flutter `>=3.38.0`. The manifest's own Dart constraint is `^3.9.2`, which is broader than the resolved lockfile requirements.

From the original repository root:

```sh
flutter pub get
flutter run
```

Keep the original `images/movies.png` and platform assets. Binary contents are not included in the Repomix text export. Network access and a working TMDB credential are required for fresh catalogue requests.

The Android main manifest does not declare INTERNET permission; debug and profile manifests do. Do not assume a release build can fetch the catalogue without reviewing the merged manifest. Android release signing also still uses debug keys.

## Source map

| Path | Purpose |
| --- | --- |
| [lib/main.dart](lib/main.dart) | Starts the provider/splash path |
| [apps](lib/movie_module/apps/) | Providers, startup and separate themed wrapper |
| [screens](lib/movie_module/screens/) | Tabs, listings and detail pages |
| [services](lib/movie_module/services/) | TMDB requests and in-memory response maps |
| [models](lib/movie_module/models/) | Listing and detail JSON conversion |
| [logics](lib/movie_module/logics/) | Stored theme/grid preferences |
| [image downloader](lib/movie_module/utils/image_downloader.dart) | Unconnected image-save helper |
| [widget test](test/widget_test.dart) | Basic MaterialApp smoke assertion |

## Current boundaries

- Settings is a coloured placeholder, not a working preferences screen.
- No search, favourites, watchlist, account system or streaming is implemented in the inspected application.
- API response maps have no time-based expiry or disk persistence. Force refresh clears the relevant map; this is not a complete offline catalogue.
- Some movie model fields and dates are parsed as required values. Missing/null fields or unexpected payloads need regression testing.
- The image downloader is not called by the supplied screens and does not check the gallery-save return value before reporting success.
- Platform folders are included, but device compatibility, permissions and plugin behaviour have not been verified across all targets.

See [implementation notes](docs/implementation-notes.md) for the startup and testing details.

## Verification

Suggested local checks:

```sh
flutter analyze
flutter test
```

The existing test starts movieProvider, advances the clock and checks for a MaterialApp. It does not verify successful catalogue requests, preferences, detail navigation or gallery saves. Storage/network dependencies are not mocked in that test.

No dependency installation, Flutter analysis, tests, builds, device sessions or live API calls were performed during this refresh.

## Contributing and licence

Read [CONTRIBUTING.md](CONTRIBUTING.md) and [SECURITY.md](SECURITY.md) before sharing changes or diagnostics.

No project licence file is included in the supplied export. This refresh does not assign a code licence or establish redistribution rights for TMDB data, artwork or the bundled image. Confirm those separately before publishing a derivative release.
