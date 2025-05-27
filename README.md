<a href="https://flutter.dev/">
  <h1 align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png">
      <img alt="Flutter" src="https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png">
    </picture>
  </h1>
</a>

[![Flutter CI Status](https://flutter-dashboard.appspot.com/api/public/build-status-badge?repo=flutter)](https://flutter-dashboard.appspot.com/#/build?repo=flutter)
[![Discord badge][]][Discord instructions]
[![Twitter handle][]][Twitter badge]
[![BlueSky badge][]][BlueSky handle]
[![codecov](https://codecov.io/gh/flutter/flutter/branch/master/graph/badge.svg?token=11yDrJU2M2)](https://codecov.io/gh/flutter/flutter)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/5631/badge)](https://bestpractices.coreinfrastructure.org/projects/5631)
[![SLSA 1](https://slsa.dev/images/gh-badge-level1.svg)](https://slsa.dev)

Flutter is Google's SDK for crafting beautiful, fast user experiences for
mobile, web, and desktop from a single codebase. Flutter works with existing
code, is used by developers and organizations around the world, and is free and
open source.

## Documentation

- [Install Flutter](https://flutter.dev/get-started/)
- [Flutter documentation](https://docs.flutter.dev/)
- [Development wiki](./docs/README.md)
- [Contributing to Flutter](https://github.com/flutter/flutter/blob/main/CONTRIBUTING.md)

For announcements about new releases, follow the
[flutter-announce@googlegroups.com](https://groups.google.com/forum/#!forum/flutter-announce)
mailing list. Our documentation also tracks [breaking
changes](https://docs.flutter.dev/release/breaking-changes) across releases.

# Song.Social

This is the mobile application for Songs.Social, a platform for sharing and discovering music. It is built with Flutter and interacts with the Songs.Social Backend API.

## Tech Stack

The app is built using the following technologies:

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: GetX

### Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run**

    ```bash
    flutter run --release -t lib/main_dev.dart --flavor dev (dev env)
    ```

    ```bash
    flutter run --release -t lib/main_prod.dart --flavor prod (prod env)
    ```

./create_feature.sh <folder_name>
