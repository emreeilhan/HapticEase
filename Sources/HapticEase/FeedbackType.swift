/// Feedback styles that can be played through ``HapticFeedback`` or the SwiftUI modifier.
public enum FeedbackType: CaseIterable, Hashable, Sendable {
    /// A success notification haptic.
    case success
    /// An error notification haptic.
    case error
    /// A warning notification haptic.
    case warning
    /// A selection-change haptic.
    case selection
    /// A light impact haptic.
    case light
    /// A medium impact haptic.
    case medium
    /// A heavy impact haptic.
    case heavy
    /// A rigid impact haptic.
    case rigid
    /// A soft impact haptic.
    case soft
    /// Built-in pattern: two light impacts in sequence.
    case customLight
    /// Built-in pattern: a light impact followed by a medium impact.
    case lightAndMedium
    /// Built-in pattern: a heavy impact followed by a warning notification.
    case heavyAndWarning
}
