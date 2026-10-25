//
//  HapticFeedbackModifier.swift
//  
//
//  Created by Emre Ilhan on 8/13/24.
//

import SwiftUI

/// A view modifier to easily apply haptic feedback to SwiftUI views.
@MainActor
public struct HapticFeedbackModifier: ViewModifier {
    @State private var hapticFeedback = HapticFeedback()
    let trigger: Bool
    let feedbackType: FeedbackType

    public init(trigger: Bool, feedbackType: FeedbackType) {
        self.trigger = trigger
        self.feedbackType = feedbackType
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
            hapticFeedback.light()
        case .medium:
            hapticFeedback.medium()
        case .heavy:
            hapticFeedback.heavy()
        case .customLight:
            hapticFeedback.customLightPattern()
        case .lightAndMedium:
            hapticFeedback.lightAndMediumPattern()
        case .heavyAndWarning:
            hapticFeedback.heavyAndWarningPattern()
        }
    }
}
