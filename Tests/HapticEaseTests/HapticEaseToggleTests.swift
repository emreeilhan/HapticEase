// Purpose: Verify the global HapticEase.isEnabled toggle behavior.
import XCTest
@testable import HapticEase

final class HapticEaseToggleTests: XCTestCase {

    override func tearDown() {
        HapticEase.isEnabled = true
        super.tearDown()
    }

    // Purpose: Confirm the default is enabled and the flag can be toggled.
    func testIsEnabledDefaultsToTrueAndCanBeDisabled() {
        XCTAssertTrue(HapticEase.isEnabled)

        HapticEase.isEnabled = false
        XCTAssertFalse(HapticEase.isEnabled)

        HapticEase.isEnabled = true
        XCTAssertTrue(HapticEase.isEnabled)
    }

#if canImport(UIKit)
    // Purpose: Disabled mode must keep UIKit helpers callable without crashing.
    @MainActor
    func testDisabledHapticFeedbackCallsAreNoOps() {
        HapticEase.isEnabled = false
        let haptic = HapticFeedback()

        haptic.success()
        haptic.light()
        haptic.customLightPattern()

        XCTAssertFalse(HapticEase.isEnabled)
    }

    // Purpose: Init must succeed when disabled without preparing generators.
    @MainActor
    func testInitSucceedsWhenHapticsAreDisabled() {
        HapticEase.isEnabled = false
        let haptic = HapticFeedback()
        XCTAssertNotNil(haptic)
        XCTAssertFalse(HapticEase.isEnabled)
    }
#endif
}
