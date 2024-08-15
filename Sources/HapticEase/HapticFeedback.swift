//
//  HapticFeedback.swift
//
//
//  Created by Emre Ilhan on 8/13/24.
//

import SwiftUI

/// A class to simplify the usage of haptic feedback in SwiftUI applications.
@MainActor
public class HapticFeedback {
 
    private let lightGenerator = UIImpactFeedbackGenerator(style: .light)
    private let mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
 
    private let notificationGenerator = UINotificationFeedbackGenerator()
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
 
    /// Initializes the HapticFeedback class and prepares the generators for use.
    public init() {
        prepareGenerators()
    }
 
    /// Prepares all haptic feedback generators to reduce latency on first use.
    private func prepareGenerators() {
        lightGenerator.prepare()
        mediumGenerator.prepare()
        heavyGenerator.prepare()
        notificationGenerator.prepare()
        selectionFeedbackGenerator.prepare()
    }
 
    /// Triggers a success notification haptic feedback.
    public func success() {
        notificationGenerator.notificationOccurred(.success)
    }
 
    /// Triggers an error notification haptic feedback.
    public func error() {
        notificationGenerator.notificationOccurred(.error)
    }
 
    /// Triggers a warning notification haptic feedback.
    public func warning() {
        notificationGenerator.notificationOccurred(.warning)
    }
 
    /// Triggers a selection change haptic feedback.
    public func selection() {
        selectionFeedbackGenerator.selectionChanged()
    }
 
    /// Triggers a light impact haptic feedback.
    public func light() {
        lightGenerator.impactOccurred()
    }
 
    /// Triggers a medium impact haptic feedback.
    public func medium() {
        mediumGenerator.impactOccurred()
    }
 
    /// Triggers a heavy impact haptic feedback.
    public func heavy() {
        heavyGenerator.impactOccurred()
    }
 
    /// Triggers a custom haptic feedback pattern with two light impacts.
    public func customLightPattern() {
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.lightGenerator.impactOccurred()
        }
    }
 
    /// Triggers a custom haptic feedback pattern with a light impact followed by a medium impact.
    public func lightAndMediumPattern() {
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.mediumGenerator.impactOccurred()
        }
    }
 
    /// Triggers a custom haptic feedback pattern with a heavy impact followed by a warning notification.
    public func heavyAndWarningPattern() {
        heavyGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.notificationGenerator.notificationOccurred(.warning)
        }
    }
}
