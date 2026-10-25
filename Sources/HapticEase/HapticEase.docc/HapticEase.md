# ``HapticEase``

A lightweight Swift package for common haptic feedback in SwiftUI and UIKit-backed apps.

## Overview

HapticEase wraps UIKit feedback generators behind a small API for notification, impact, selection, and a few built-in multi-step patterns. Use ``HapticFeedback`` directly, or attach ``View/hapticFeedback(trigger:type:)`` to a SwiftUI view.

On iOS 17 and later, SwiftUI's built-in `.sensoryFeedback(_:trigger:)` covers many basic cases. HapticEase remains useful for iOS 14–16 support, UIKit call sites, and the package's predefined patterns.

## Topics

### Essentials

- ``HapticFeedback``
- ``FeedbackType``
- ``HapticEase/isEnabled``

### SwiftUI

- ``View/hapticFeedback(trigger:type:)``
- ``HapticFeedbackModifier``
