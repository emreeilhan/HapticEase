# HapticEase

[![Swift](https://img.shields.io/badge/Swift-5.7-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![CI](https://github.com/emreeilhan/HapticEase/actions/workflows/ci.yml/badge.svg)](https://github.com/emreeilhan/HapticEase/actions/workflows/ci.yml)

`HapticEase` is a lightweight Swift library that simplifies haptic feedback in SwiftUI. It wraps UIKit feedback generators behind a small API for common notification, impact, selection, and built-in multi-step patterns.

## Features

- **Simple Integration**: Add haptic feedback to SwiftUI views with a view modifier or direct API calls.
- **Built-in Patterns**: Trigger fixed multi-step sequences such as `customLightPattern`, `lightAndMediumPattern`, and `heavyAndWarningPattern`.
- **Multiple Feedback Types**: Light, medium, heavy, rigid, and soft impacts (optional intensity); success, error, and warning notifications; selection feedback.

## Requirements

- **iOS 14.0+**
- **Xcode 14.0+**
- **Swift 5.7+**

On iOS 17 and later, SwiftUI's built-in `.sensoryFeedback(_:trigger:)` covers basic cases. HapticEase is useful when you need iOS 14–16 support, UIKit, or the predefined patterns.

## Installation

### Swift Package Manager

To integrate `HapticEase` into your project using Swift Package Manager, add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/emreeilhan/HapticEase.git", from: "1.6.0")
]
```

Or, you can add the package directly within Xcode by going to:

`File > Add Package Dependencies…` and enter the repository URL:

```
https://github.com/emreeilhan/HapticEase.git
```

## Usage

### Basic Haptic Feedback

To use basic haptic feedback, create an instance of `HapticFeedback` and call the desired method on the main actor:

```swift
import HapticEase

Task { @MainActor in
    let haptic = HapticFeedback()
    haptic.success() // Triggers a success haptic feedback
    haptic.rigid(intensity: 0.8) // Rigid impact with custom intensity
    haptic.soft() // Soft impact at default intensity
}
```

### Built-in Haptic Patterns

`HapticEase` includes a few fixed multi-step patterns. These are predefined sequences, not user-defined patterns:

```swift
import HapticEase

Task { @MainActor in
    let haptic = HapticFeedback()
    haptic.customLightPattern()      // Two light impacts
    haptic.lightAndMediumPattern()   // Light impact, then medium
    haptic.heavyAndWarningPattern()  // Heavy impact, then warning
}
```

### Global Toggle

Disable or re-enable all haptic playback with `HapticEase.isEnabled` (defaults to `true`). When it is `false`, SwiftUI modifiers and UIKit helpers become no-ops:

```swift
import HapticEase

Task { @MainActor in
    HapticEase.isEnabled = false
}
```

### Integrating with SwiftUI

You can use `HapticFeedbackModifier` to easily integrate haptic feedback into any SwiftUI view. Haptics fire whenever the `trigger` value changes (for example, each `toggle()`), not only when it becomes `true`:

```swift
import SwiftUI
import HapticEase

struct ContentView: View {
    @State private var triggerHaptic = false

    var body: some View {
        Button("Trigger Success Haptic") {
            triggerHaptic.toggle()
        }
        .hapticFeedback(trigger: triggerHaptic, type: .success)
        // Impact styles can also pass intensity:
        // .hapticFeedback(trigger: triggerHaptic, type: .rigid, intensity: 0.6)
    }
}
```

## Documentation

- Start with the [Usage](#usage) examples above for `HapticFeedback`, built-in patterns, `HapticEase.isEnabled`, and the SwiftUI modifier.
- Public types live under `Sources/HapticEase`. Symbol documentation is in DocC comments and the `HapticEase.docc` catalog.
- Release history is tracked in [CHANGELOG.md](CHANGELOG.md).

## Contributing

Contributions are welcome. Fork the repository, use a topic branch, and open a pull request against `main`.

Preferred branch prefixes:

- `feat/` for new features
- `fix/` for bug fixes
- `docs/` for documentation-only changes
- `chore/` for maintenance and tooling

1. Fork the repository.
2. Create your branch (`git checkout -b feat/short-description`).
3. Commit your changes.
4. Push the branch and open a pull request.

## License

`HapticEase` is available under the MIT license. See the [LICENSE](https://github.com/emreeilhan/HapticEase/blob/main/LICENSE) file for more information.
