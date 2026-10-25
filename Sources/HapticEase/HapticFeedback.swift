//
//  HapticFeedback.swift
//
//
//  Created by Emre Ilhan on 8/13/24.
//

import SwiftUI

/// Plays common UIKit haptic feedback patterns from app code.
///
/// Create an instance and call the matching method for the feedback you need.
/// All trigger methods respect ``HapticEase/isEnabled``.
@MainActor
public class HapticFeedback {
 
    private let lightGenerator = UIImpactFeedbackGenerator(style: .light)
    private let mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
 
    private let notificationGenerator = UINotificationFeedbackGenerator()
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
 
    /// Creates a helper and prepares generators when haptics are enabled.
    public init() {
        // Purpose: Avoid prepare() work when haptics are globally disabled.
        guard HapticEase.isEnabled else { return }
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
 
    /// Plays a success notification haptic.
    public func success() {
        guard canPlay else { return }
        notificationGenerator.notificationOccurred(.success)
    }
 
    /// Plays an error notification haptic.
    public func error() {
        guard canPlay else { return }
        notificationGenerator.notificationOccurred(.error)
    }
 
    /// Plays a warning notification haptic.
    public func warning() {
        guard canPlay else { return }
        notificationGenerator.notificationOccurred(.warning)
    }
 
    /// Plays a selection-change haptic.
    public func selection() {
        guard canPlay else { return }
        selectionFeedbackGenerator.selectionChanged()
    }
 
    /// Plays a light impact haptic.
    public func light() {
        guard canPlay else { return }
        lightGenerator.impactOccurred()
    }
 
    /// Plays a medium impact haptic.
    public func medium() {
        guard canPlay else { return }
        mediumGenerator.impactOccurred()
    }
 
    /// Plays a heavy impact haptic.
    public func heavy() {
        guard canPlay else { return }
        heavyGenerator.impactOccurred()
    }
 
    /// Plays the built-in two light-impact pattern.
    public func customLightPattern() {
        guard canPlay else { return }
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            guard HapticEase.isEnabled else { return }
            self.lightGenerator.impactOccurred()
        }
    }
 
    /// Plays the built-in light-then-medium impact pattern.
    public func lightAndMediumPattern() {
        guard canPlay else { return }
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            guard HapticEase.isEnabled else { return }
            self.mediumGenerator.impactOccurred()
        }
    }
 
    /// Plays the built-in heavy impact followed by a warning notification.
    public func heavyAndWarningPattern() {
        guard canPlay else { return }
        heavyGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            guard HapticEase.isEnabled else { return }
            self.notificationGenerator.notificationOccurred(.warning)
        }
    }
}
