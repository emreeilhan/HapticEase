// Purpose: Verify FeedbackType exposes the expected public API surface.
import XCTest
@testable import HapticEase

final class FeedbackTypeTests: XCTestCase {

    // Purpose: Ensure CaseIterable lists every feedback case, including rigid/soft.
    func testAllFeedbackTypeCasesAreReachable() {
        XCTAssertEqual(FeedbackType.allCases.count, 12)
        XCTAssertTrue(FeedbackType.allCases.contains(.success))
        XCTAssertTrue(FeedbackType.allCases.contains(.rigid))
        XCTAssertTrue(FeedbackType.allCases.contains(.soft))
        XCTAssertTrue(FeedbackType.allCases.contains(.heavyAndWarning))
    }

    // Purpose: Confirm Hashable identity for case values.
    func testFeedbackTypeHashableIdentity() {
        XCTAssertEqual(FeedbackType.light, FeedbackType.light)
        XCTAssertNotEqual(FeedbackType.light, FeedbackType.heavy)

        var set: Set<FeedbackType> = []
        set.insert(.light)
        set.insert(.light)
        XCTAssertEqual(set.count, 1)
    }
}
