# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.8.1] - 2026-10-25

### Fixed

- `onChangeCompat` uses the single-parameter `onChange` closure when the compiler is older than Swift 5.9, so the package builds with Xcode 14.
- Main-actor isolation on the internal haptic generator protocols. CI tests Swift 5 and Swift 6 with complete strict concurrency.
- README usage samples run inside `Task { @MainActor in }`. CI typechecks them with `Scripts/check-readme-examples.py`.

## [1.8.0] - 2026-10-25

### Added

- Rigid and soft impact styles (`FeedbackType.rigid`, `FeedbackType.soft`, `HapticFeedback.rigid(intensity:)`, and `HapticFeedback.soft(intensity:)`).
- Optional intensity on light, medium, heavy, rigid, and soft impacts, including `.hapticFeedback(trigger:type:intensity:)`.
- `CaseIterable`, `Hashable`, and `Sendable` conformance on `FeedbackType`.
- DocC catalog (`Sources/HapticEase/HapticEase.docc`) and this changelog.
- Mock-generator tests for prepare, playback, intensity, and built-in patterns.

### Changed

- `HapticEase` is isolated to the main actor.
- README examples cover rigid and soft impacts and optional intensity.
- Contributing guide documents `feat/`, `fix/`, `docs/`, and `chore/` branch prefixes.

## [1.7.1] - 2026-10-25

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

[Unreleased]: https://github.com/emreeilhan/HapticEase/compare/v1.8.1...HEAD
[1.8.1]: https://github.com/emreeilhan/HapticEase/compare/v1.8.0...v1.8.1
[1.8.0]: https://github.com/emreeilhan/HapticEase/compare/v1.7.1...v1.8.0
[1.7.1]: https://github.com/emreeilhan/HapticEase/compare/v1.7.0...v1.7.1
[1.7.0]: https://github.com/emreeilhan/HapticEase/compare/v1.6.0...v1.7.0
[1.6.0]: https://github.com/emreeilhan/HapticEase/releases/tag/v1.6.0
