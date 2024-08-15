//
//  View+HapticFeedback.swift
//  
//
//  Created by Emre Ilhan on 8/13/24.
//

import SwiftUI

public extension View {
    /// Applies haptic feedback to the view based on the specified trigger and feedback type.
    func hapticFeedback(trigger: Bool, type: FeedbackType) -> some View {
        self.modifier(HapticFeedbackModifier(hapticFeedback: HapticFeedback(), trigger: trigger, feedbackType: type))
    }
}
