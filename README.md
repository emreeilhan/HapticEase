

---

# HapticEase

[![Swift](https://img.shields.io/badge/Swift-5.5-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`HapticEase` is a lightweight Swift library that simplifies the integration of haptic feedback in your SwiftUI applications. Whether you're looking to add a simple vibration or a complex pattern, `HapticEase` provides an easy-to-use interface to enhance your app's user experience with tactile feedback.

## Features

- **Simple Integration**: Easily add haptic feedback to any SwiftUI view with minimal code.
- **Custom Patterns**: Create and trigger custom haptic feedback patterns.
- **Multiple Feedback Types**: Includes support for light, medium, heavy impacts, and success, error, warning notifications.

## Requirements

- **iOS 13.0+**
- **Xcode 11.0+**
- **Swift 5.5+**

## Installation

### Swift Package Manager

To integrate `HapticEase` into your project using Swift Package Manager, add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/emreeilhan/HapticEase.git", from: "1.0.0")
]
```

Or, you can add the package directly within Xcode by going to:

`File > Swift Packages > Add Package Dependency...` and enter the repository URL:

```
https://github.com/emreeilhan/HapticEase.git
```

## Usage

### Basic Haptic Feedback

To use basic haptic feedback, create an instance of `HapticFeedback` and call the desired method:

```swift
import HapticEase

let haptic = HapticFeedback()
haptic.success() // Triggers a success haptic feedback
```

### Custom Haptic Patterns

`HapticEase` also allows you to create custom haptic patterns:

```swift
let haptic = HapticFeedback()
haptic.customLightPattern() // Triggers a custom light pattern
```

### Integrating with SwiftUI

You can use `HapticFeedbackModifier` to easily integrate haptic feedback into any SwiftUI view:

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
    }
}
```

## Documentation

Comprehensive documentation is available [here](https://github.com/emreeilhan/HapticEase/wiki).

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests should be made against the `main` branch.

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

`HapticEase` is available under the MIT license. See the [LICENSE](https://github.com/emreeilhan/HapticEase/blob/main/LICENSE) file for more information.

---
