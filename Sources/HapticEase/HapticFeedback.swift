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

    // Purpose: Shared gate for every UIKit trigger path.
    private var canPlay: Bool {
        HapticEase.isEnabled
    }
 
    /// Triggers a success notification haptic feedback.
    public func success() {
        guard canPlay else { return }
        notificationGenerator.notificationOccurred(.success)
    }
 
    /// Triggers an error notification haptic feedback.
    public func error() {
        guard canPlay else { return }
        notificationGenerator.notificationOccurred(.error)
    }
 
    /// Triggers a warning notification haptic feedback.
    public func warning() {
        guard canPlay else { return }
        notificationGenerator.notificationOccurred(.warning)
    }
 
    /// Triggers a selection change haptic feedback.
    public func selection() {
        guard canPlay else { return }
        selectionFeedbackGenerator.selectionChanged()
    }
 
    /// Triggers a light impact haptic feedback.
    public func light() {
        guard canPlay else { return }
        lightGenerator.impactOccurred()
    }
 
    /// Triggers a medium impact haptic feedback.
    public func medium() {
        guard canPlay else { return }
        mediumGenerator.impactOccurred()
    }
 
    /// Triggers a heavy impact haptic feedback.
    public func heavy() {
        guard canPlay else { return }
        heavyGenerator.impactOccurred()
    }
 
    /// Triggers a custom haptic feedback pattern with two light impacts.
    public func customLightPattern() {
        guard canPlay else { return }
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            guard HapticEase.isEnabled else { return }
            self.lightGenerator.impactOccurred()
        }
    }
 
    /// Triggers a custom haptic feedback pattern with a light impact followed by a medium impact.
    public func lightAndMediumPattern() {
        guard canPlay else { return }
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            guard HapticEase.isEnabled else { return }
            self.mediumGenerator.impactOccurred()
        }
    }
 
    /// Triggers a custom haptic feedback pattern with a heavy impact followed by a warning notification.
    public func heavyAndWarningPattern() {
        guard canPlay else { return }
        heavyGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            guard HapticEase.isEnabled else { return }
            self.notificationGenerator.notificationOccurred(.warning)
        }
    }
}
