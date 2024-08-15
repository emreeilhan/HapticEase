//
//  HapticFeedbackModifier.swift
//  
//
//  Created by Emre Ilhan on 8/13/24.
//

import SwiftUI

/// A view modifier to easily apply haptic feedback to SwiftUI views.
public struct HapticFeedbackModifier: ViewModifier {
    let hapticFeedback: HapticFeedback
    let trigger: Bool
    let feedbackType: FeedbackType
 
    public func body(content: Content) -> some View {
        content
            .onChange(of: trigger) { newValue in
                if newValue {
                    triggerFeedback()
                }
            }
    }
 
    /// Triggers the appropriate haptic feedback based on the provided feedback type.
    private func triggerFeedback() {
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
