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
        haptic.customLightPattern()
        haptic.lightAndMediumPattern()
        haptic.heavyAndWarningPattern()

        XCTAssertNotNil(haptic)
    }
}
#endif
