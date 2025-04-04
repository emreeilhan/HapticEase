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
    
    /// Generates custom haptic feedback with a specified intensity and duration.
    /// - Parameters:
    ///   - intensity: The intensity of the haptic feedback, represented as a Float between 0.0 and 1.0.
    ///   - duration: The total duration for which the haptic feedback will be generated.
    public func customFeedback(intensity: Float, duration: TimeInterval) {
        // Create a UIImpactFeedbackGenerator with a medium style.
        let generator = UIImpactFeedbackGenerator(style: .medium)
        
        // Run the haptic feedback in a background thread.
        DispatchQueue.global().async {
            // Record the start time.
            let startTime = Date().timeIntervalSince1970
            
            // Continue generating haptic feedback until the specified duration has passed.
            while Date().timeIntervalSince1970 - startTime < duration {
                // Trigger the haptic feedback on the main thread with the specified intensity.
                DispatchQueue.main.async {
                    generator.impactOccurred(intensity: CGFloat(intensity))
                }
                // Wait for 100ms before triggering the next haptic feedback.
                usleep(useconds_t(100000))
            }
        }
    }
    
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

    /// Triggers a wave haptic feedback pattern.
    public func wavePattern() {
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.mediumGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.heavyGenerator.impactOccurred()
        }
    }

    /// Triggers a heartbeat haptic feedback pattern.
    public func heartbeatPattern() {
        mediumGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.mediumGenerator.impactOccurred()
        }
    }

    /// Triggers a tension and release haptic feedback pattern.
    public func tensionAndReleasePattern() {
        heavyGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.lightGenerator.impactOccurred()
        }
    }

    /// Triggers a double selection haptic feedback pattern.
    public func doubleSelectionPattern() {
        selectionFeedbackGenerator.selectionChanged()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.selectionFeedbackGenerator.selectionChanged()
        }
    }

    /// Triggers a complex feedback haptic feedback pattern.
    public func complexFeedbackPattern() {
        notificationGenerator.notificationOccurred(.warning)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.lightGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.mediumGenerator.impactOccurred()
        }
    }

    /// Triggers a chain reaction haptic feedback pattern.
    public func chainReactionPattern() {
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.mediumGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.heavyGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.mediumGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.lightGenerator.impactOccurred()
        }
    }
    /// Triggers a ripple effect haptic feedback pattern.
    public func rippleEffectPattern() {
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.mediumGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.heavyGenerator.impactOccurred()
        }
    }

    /// Triggers an earthquake effect haptic feedback pattern.
    public func earthquakePattern() {
        heavyGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.lightGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.mediumGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.lightGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.heavyGenerator.impactOccurred()
        }
    }

    /// Triggers a pulse haptic feedback pattern.
    public func pulsePattern() {
        lightGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.lightGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.lightGenerator.impactOccurred()
        }
    }

    /// Triggers an echo effect haptic feedback pattern.
    public func echoPattern() {
        heavyGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.mediumGenerator.impactOccurred()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.lightGenerator.impactOccurred()
        }
    }

    /// Triggers an S.O.S. signal haptic feedback pattern.
    public func sosSignalPattern() {
        for i in 0..<3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(i)) {
                self.lightGenerator.impactOccurred()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            for i in 0..<3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15 * Double(i)) {
                    self.heavyGenerator.impactOccurred()
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            for i in 0..<3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(i)) {
                    self.lightGenerator.impactOccurred()
                }
            }
        }
    }
}
