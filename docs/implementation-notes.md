# Implementation notes

## Startup

main.dart calls movieProvider, which registers MovieThemeLogic and MovieGridstyleLogic before displaying MovieSplashScreen. The splash waits two seconds and reads stored preferences, then returns ParentScreen within its existing MaterialApp/Scaffold structure.

MovieApp defines light/dark themes and watches the theme provider, but it is not instantiated on this startup path. No supplied screen calls toggleDark or toggleStyle. NowplayingScreen reads the grid-style value, so a stored value can affect its layout, but no current UI control changes it.

## Services and models

TheMovieService and ThePeopleService issue HTTP GET requests to TMDB and parse successful responses through compute. Each keeps static maps for listing/detail results. There is no cache timestamp or automatic expiry. A force refresh clears the relevant map before requesting data.

Listing requests use page 1 and en-US. Parsed pagination fields do not implement pagination by themselves. Some movie fields are non-nullable and dates are parsed directly, so response variation requires testing rather than assuming robust parsing.

## Interface boundaries

Home and People open list/detail screens. Settings is a placeholder Container. The Home title still reads Fox Shop, which is not consistent movie-app branding; this documentation does not silently change it.

Refresh handlers replace the Future inside setState but do not await completion of the replacement request. Do not claim the refresh indicator tracks the complete network operation without testing or changing that behaviour.

The movie list owns a ScrollController and registers a listener, but the supplied state class has no dispose override. This is a lifecycle review item, not an executed leak diagnosis.

ImageDownloader is defined but not called elsewhere in the supplied Dart source. It awaits GallerySaver.saveImage without inspecting the result before showing success. It should not be advertised as a verified gallery-download feature.

## Platform and tests

The Android main manifest lacks INTERNET permission; debug/profile manifests include it. Release signing uses debug configuration. macOS entitlements do not declare network-client access in the inspected files. Platform scaffolding alone does not establish release readiness or working network/plugin behaviour.

The widget test checks that a MaterialApp exists after starting the provider path. It neither mocks secure storage/networking nor asserts successful data loading. No test result was obtained in this refresh.
