// Purpose: Cover HapticFeedback call sites that can run without a physical device.
import XCTest
@testable import HapticEase

#if canImport(UIKit)
@MainActor
final class HapticFeedbackTests: XCTestCase {

    // Purpose: Confirm the public helper initializes and accepts trigger calls on Simulator.
    func testHapticFeedbackMethodsDoNotCrash() {
        let haptic = HapticFeedback()

        haptic.success()
        haptic.error()
        haptic.warning()
        haptic.selection()
        haptic.light()
        haptic.medium()
        haptic.heavy()
        haptic.rigid()
        haptic.soft()
        haptic.light(intensity: 0.5)
        haptic.medium(intensity: 0.75)
        haptic.heavy(intensity: 1.0)
        haptic.rigid(intensity: 0.4)
        haptic.soft(intensity: 0.2)
        haptic.customLightPattern()
        haptic.lightAndMediumPattern()
        haptic.heavyAndWarningPattern()

        XCTAssertNotNil(haptic)
    }
}
#endif
