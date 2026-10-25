import SwiftUI

public extension View {
    /// Plays haptic feedback whenever `trigger` changes.
    ///
    /// Feedback fires on every change of `trigger` (for example each `toggle()`),
    /// not only when the value becomes `true`.
    ///
    /// - Parameters:
    ///   - trigger: A value observed for changes.
    ///   - type: The ``FeedbackType`` to play.
    ///   - intensity: Optional impact intensity in the range `0...1`.
    /// - Returns: A view that plays haptics when `trigger` changes.
    @MainActor
    func hapticFeedback(
        trigger: Bool,
        type: FeedbackType,
        intensity: CGFloat? = nil
    ) -> some View {
        self.modifier(
            HapticFeedbackModifier(
                trigger: trigger,
                feedbackType: type,
                intensity: intensity
            )
        )
    }
}
