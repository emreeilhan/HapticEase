# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Documentation comments across the public API.
- CI workflow badge in the README.
- `@MainActor` annotations on haptic-triggering SwiftUI APIs.
- Skip generator `prepare()` when `HapticEase.isEnabled` is `false`.

## [1.7.0] - 2026-10-25

### Added

- Global `HapticEase.isEnabled` toggle for SwiftUI and UIKit trigger paths.
- Unit test target and macOS GitHub Actions CI for the iOS Simulator.

### Fixed

- CI simulator destination selection on `macos-15` runners.

## [1.6.0] - 2026-10-25

### Changed

- README accuracy for built-in patterns, SPM version pin, and Xcode install path.
- Documented SwiftUI `.sensoryFeedback` as an alternative on iOS 17+.
- Aligned documented minimum platform versions with `Package.swift`.

[Unreleased]: https://github.com/emreeilhan/HapticEase/compare/v1.7.0...HEAD
[1.7.0]: https://github.com/emreeilhan/HapticEase/compare/v1.6.0...v1.7.0
[1.6.0]: https://github.com/emreeilhan/HapticEase/releases/tag/v1.6.0
