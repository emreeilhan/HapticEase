// Purpose: Package-level configuration for haptic playback.

/// Namespace for package-wide HapticEase settings.
public enum HapticEase {
    /// Controls whether any haptic playback may run.
    ///
    /// When `false`, UIKit helpers and SwiftUI modifiers become no-ops.
    /// Defaults to `true`.
    public static var isEnabled: Bool = true
}
