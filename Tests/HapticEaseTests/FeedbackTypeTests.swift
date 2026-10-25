// Purpose: Verify FeedbackType exposes the expected public API surface.
import XCTest
@testable import HapticEase

final class FeedbackTypeTests: XCTestCase {

    // Purpose: Ensure every documented feedback case remains available.
    func testAllFeedbackTypeCasesAreReachable() {
        let cases: [FeedbackType] = [
            .success,
            .error,
            .warning,
            .selection,
            .light,
            .medium,
            .heavy,
            .customLight,
            .lightAndMedium,
            .heavyAndWarning
        ]

        XCTAssertEqual(cases.count, 10)
    }
}
