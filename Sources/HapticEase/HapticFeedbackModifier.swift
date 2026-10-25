import SwiftUI

/// A SwiftUI view modifier that plays haptic feedback when a trigger value changes.
@MainActor
public struct HapticFeedbackModifier: ViewModifier {
    @State private var hapticFeedback = HapticFeedback()
    /// The value whose changes cause feedback to play.
    let trigger: Bool
    /// The feedback style to play on each trigger change.
    let feedbackType: FeedbackType
    /// Optional impact intensity in the range `0...1`.
    let intensity: CGFloat?

    /// Creates a modifier that plays `feedbackType` whenever `trigger` changes.
    ///
    /// - Parameters:
    ///   - trigger: A value observed for changes.
    ///   - feedbackType: The ``FeedbackType`` to play.
    ///   - intensity: Optional impact intensity for impact styles.
    public init(
        trigger: Bool,
        feedbackType: FeedbackType,
        intensity: CGFloat? = nil
    ) {
        self.trigger = trigger
        self.feedbackType = feedbackType
        self.intensity = intensity
    }

    public func body(content: Content) -> some View {
        content
            .onChangeCompat(of: trigger) {
                triggerFeedback()
            }
    }

    /// Triggers the appropriate haptic feedback based on the provided feedback type.
    private func triggerFeedback() {
        // Purpose: Honor the global toggle before any SwiftUI-driven playback.
        guard HapticEase.isEnabled else { return }

        switch feedbackType {
        case .success:
            hapticFeedback.success()
        case .error:
            hapticFeedback.error()
        case .warning:
            hapticFeedback.warning()
        case .selection:
            hapticFeedback.selection()
        case .light:
            hapticFeedback.light(intensity: intensity)
        case .medium:
            hapticFeedback.medium(intensity: intensity)
        case .heavy:
            hapticFeedback.heavy(intensity: intensity)
        case .rigid:
            hapticFeedback.rigid(intensity: intensity)
        case .soft:
            hapticFeedback.soft(intensity: intensity)
        case .customLight:
            hapticFeedback.customLightPattern()
        case .lightAndMedium:
            hapticFeedback.lightAndMediumPattern()
        case .heavyAndWarning:
            hapticFeedback.heavyAndWarningPattern()
        }
    }
}
