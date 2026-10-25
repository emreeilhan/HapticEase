import SwiftUI

/// Plays common UIKit haptic feedback patterns from app code.
///
/// Create an instance and call the matching method for the feedback you need.
/// All trigger methods respect ``HapticEase/isEnabled``.
@MainActor
public class HapticFeedback {

    private let lightGenerator: ImpactHapticGenerating
    private let mediumGenerator: ImpactHapticGenerating
    private let heavyGenerator: ImpactHapticGenerating
    private let rigidGenerator: ImpactHapticGenerating
    private let softGenerator: ImpactHapticGenerating

    private let notificationGenerator: NotificationHapticGenerating
    private let selectionFeedbackGenerator: SelectionHapticGenerating

    /// Creates a helper and prepares generators when haptics are enabled.
    public init() {
        self.lightGenerator = UIImpactFeedbackGenerator(style: .light)
        self.mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
        self.heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
        self.rigidGenerator = UIImpactFeedbackGenerator(style: .rigid)
        self.softGenerator = UIImpactFeedbackGenerator(style: .soft)
        self.notificationGenerator = UINotificationFeedbackGenerator()
        self.selectionFeedbackGenerator = UISelectionFeedbackGenerator()

        // Purpose: Avoid prepare() work when haptics are globally disabled.
        guard HapticEase.isEnabled else { return }
        prepareGenerators()
    }

    /// Creates a helper with injectable generators for tests.
    init(
        lightGenerator: ImpactHapticGenerating,
        mediumGenerator: ImpactHapticGenerating,
        heavyGenerator: ImpactHapticGenerating,
        rigidGenerator: ImpactHapticGenerating,
        softGenerator: ImpactHapticGenerating,
        notificationGenerator: NotificationHapticGenerating,
        selectionFeedbackGenerator: SelectionHapticGenerating
    ) {
        self.lightGenerator = lightGenerator
        self.mediumGenerator = mediumGenerator
        self.heavyGenerator = heavyGenerator
        self.rigidGenerator = rigidGenerator
        self.softGenerator = softGenerator
        self.notificationGenerator = notificationGenerator
        self.selectionFeedbackGenerator = selectionFeedbackGenerator

        guard HapticEase.isEnabled else { return }
        prepareGenerators()
    }

    /// Prepares all haptic feedback generators to reduce latency on first use.
    private func prepareGenerators() {
        lightGenerator.prepare()
        mediumGenerator.prepare()
        heavyGenerator.prepare()
        rigidGenerator.prepare()
        softGenerator.prepare()
        notificationGenerator.prepare()
        selectionFeedbackGenerator.prepare()
    }

    // Purpose: Shared gate for every UIKit trigger path.
    private var canPlay: Bool {
        HapticEase.isEnabled
    }

    // Purpose: Prefer intensity-based playback when a value is provided.
    private func playImpact(
        _ generator: ImpactHapticGenerating,
        intensity: CGFloat?
    ) {
        if let intensity {
            generator.impactOccurred(intensity: intensity)
        } else {
            generator.impactOccurred()
        }
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
    /// - Parameter intensity: Optional relative intensity in the range `0...1`.
    public func light(intensity: CGFloat? = nil) {
        guard canPlay else { return }
        playImpact(lightGenerator, intensity: intensity)
    }

    /// Plays a medium impact haptic.
    /// - Parameter intensity: Optional relative intensity in the range `0...1`.
    public func medium(intensity: CGFloat? = nil) {
        guard canPlay else { return }
        playImpact(mediumGenerator, intensity: intensity)
    }

    /// Plays a heavy impact haptic.
    /// - Parameter intensity: Optional relative intensity in the range `0...1`.
    public func heavy(intensity: CGFloat? = nil) {
        guard canPlay else { return }
        playImpact(heavyGenerator, intensity: intensity)
    }

    /// Plays a rigid impact haptic.
    /// - Parameter intensity: Optional relative intensity in the range `0...1`.
    public func rigid(intensity: CGFloat? = nil) {
        guard canPlay else { return }
        playImpact(rigidGenerator, intensity: intensity)
    }

    /// Plays a soft impact haptic.
    /// - Parameter intensity: Optional relative intensity in the range `0...1`.
    public func soft(intensity: CGFloat? = nil) {
        guard canPlay else { return }
        playImpact(softGenerator, intensity: intensity)
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
