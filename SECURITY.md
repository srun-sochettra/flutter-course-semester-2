# Security guidance

## Exposed credential

The supplied source includes a hard-coded TMDB API credential in lib/movie_module/api_key.dart, repeated in two declarations. Treat it as exposed. Revoke or rotate it through the account that owns it and review repository history and shared exports. The value is not reproduced here.

This overlay changes documentation only. It does not rotate credentials, remove the source value or rewrite Git history. Ignoring a file after it was committed does not remove earlier copies.

The current services import this Dart file directly. There is no environment-file or dart-define configuration path in the supplied code. A future configuration change must update the actual consumers and be tested; merely adding a template would be misleading. A client-distributed credential must not be described as server-side secret storage.

## Network and local files

API requests include the credential in query parameters. Redact request URLs and exception output before sharing diagnostics. Catalogue images and metadata are external content; their availability and usage rights are outside this project's guarantees.

Preference helpers use flutter_secure_storage, but that does not protect the credential embedded in source. The image-save helper writes a temporary file and attempts a gallery save; it is not currently wired into the screens. Review permissions, destination behaviour and failure handling before enabling it.

A generated Android build report is included in the export and contains machine-specific paths. Review generated artefacts before publishing them; this documentation does not remove tracked files.

## Reporting

Do not post credentials, private account information or exploit details publicly. Use a verified private maintainer channel if available, or request a private contact without including sensitive details. No dedicated security mailbox, response deadline or supported-release programme is established by the supplied files.

Provide the affected path, environment and a minimal redacted reproduction. This guide is not a security audit or a claim of remediation.
