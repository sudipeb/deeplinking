# Flutter Deep Linking Example

A small Flutter project demonstrating how to handle deep links (custom URL schemes and universal/app links) and route incoming URIs into an app router.

This repository contains a minimal app that:
- Handles cold-start links (initial link that opened the app).
- Listens for runtime/warm links when the app is already running.
- Normalizes incoming paths (for example, removes a `/deeplinking` prefix used in some example URIs) while preserving query parameters.
- Routes to pages like `/profile` and `/notification` using a lightweight `AppRouter` in `lib/app_router.dart`.

Why this repo exists
- To show a practical, small example of deep link handling in Flutter projects.
- To demonstrate preserving query parameters and cleaning incoming URIs before navigation.

Quick links
- Main entry: `lib/main.dart`
- Router implementation: `lib/app_router.dart`
- Pages: `lib/home_page.dart`, `lib/profile_page.dart`, `lib/notification_page.dart`

Getting started (local development)

Prerequisites
- Flutter SDK (stable channel recommended)
- Xcode for iOS builds on macOS
- Android Studio / Android SDK for Android builds

Clone and fetch dependencies

```bash
git clone <repo-url>
cd deeplinking
flutter pub get
```

Run on a connected device or simulator

```bash
flutter run
```

Build release artifacts

```bash
flutter build apk   # Android
flutter build ios   # iOS (use Xcode for signing and export)
```

Run tests

```bash
flutter test
```

Deep link behavior (examples)

- Example incoming URI (custom scheme):
  myapp://example.com/deeplinking/profile?id=123

  The app will remove the `/deeplinking` prefix and navigate to:
  `/profile?id=123`

- Runtime (foreground) links and cold-start links are both supported. The code listens to the link stream and also checks the initial link on startup.

Platform configuration notes

Android
- If you use a custom scheme, add an intent filter to `android/app/src/main/AndroidManifest.xml` in your activity to receive the scheme/host.
- For Android App Links (verified links), host a valid `assetlinks.json` on your web domain and configure the intent filters accordingly.

iOS
- For custom URL schemes, add a URL Type in Xcode (Runner > Info > URL Types) with your scheme.
- For Universal Links, enable Associated Domains in project capabilities and add the appropriate `applinks:your-domain.com` entry.

Behavioral details and edge cases

- Query parameters are preserved (e.g., `?id=123`).
- Incoming paths are normalized to remove an example prefix (`/deeplinking`) used for demo/testing; adjust or remove that logic if your app's path structure differs.
- If a link is malformed, the app falls back to opening the home page.

Troubleshooting

- Links not opening on Android devices: verify the intent filter and that the device has the correct app installed; check `adb logcat` for messages from the activity.
- Links not opening on iOS: ensure the URL scheme or Associated Domains are configured in Xcode and that the app is reinstalled after changes.

Contributing

- Fork, create a branch, add tests for any new behavior, and open a pull request.
- Keep changes focused and include a brief description of why the change is needed.

License

This project does not include a license file by default. Add a LICENSE.md (for example MIT) if you plan to open-source it.

Contact

Open issues or PRs on the repository for questions or improvements.
