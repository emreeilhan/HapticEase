//
//  View+HapticFeedback.swift
//  
//
//  Created by Emre Ilhan on 8/13/24.
//

import SwiftUI

public extension View {
    /// Applies haptic feedback to the view based on the specified trigger and feedback type.
    @MainActor
    func hapticFeedback(trigger: Bool, type: FeedbackType) -> some View {
        self.modifier(HapticFeedbackModifier(trigger: trigger, feedbackType: type))
    }
}
