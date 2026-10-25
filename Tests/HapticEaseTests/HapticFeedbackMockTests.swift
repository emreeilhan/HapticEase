// Purpose: Assert haptic call routing through injectable generator mocks.
import XCTest
@testable import HapticEase

#if canImport(UIKit)
@MainActor
final class HapticFeedbackMockTests: XCTestCase {

    private var light: MockImpactGenerator!
    private var medium: MockImpactGenerator!
    private var heavy: MockImpactGenerator!
    private var notification: MockNotificationGenerator!
    private var selection: MockSelectionGenerator!

    override func setUp() {
        super.setUp()
        HapticEase.isEnabled = true
        light = MockImpactGenerator()
        medium = MockImpactGenerator()
        heavy = MockImpactGenerator()
        notification = MockNotificationGenerator()
        selection = MockSelectionGenerator()
    }

    override func tearDown() {
        HapticEase.isEnabled = true
        super.tearDown()
    }

    private func makeSUT() -> HapticFeedback {
        HapticFeedback(
            lightGenerator: light,
            mediumGenerator: medium,
            heavyGenerator: heavy,
            notificationGenerator: notification,
            selectionFeedbackGenerator: selection
        )
    }

    // Purpose: Enabled init should prepare every injected generator once.
    func testInitPreparesGeneratorsWhenEnabled() {
        _ = makeSUT()

        XCTAssertEqual(light.prepareCallCount, 1)
        XCTAssertEqual(medium.prepareCallCount, 1)
        XCTAssertEqual(heavy.prepareCallCount, 1)
        XCTAssertEqual(notification.prepareCallCount, 1)
        XCTAssertEqual(selection.prepareCallCount, 1)
    }

    // Purpose: Disabled init and triggers must not touch generators.
    func testDisabledModeSkipsPrepareAndPlayback() {
        HapticEase.isEnabled = false
        let sut = makeSUT()

        sut.success()
        sut.light()
        sut.selection()
        sut.customLightPattern()

        XCTAssertEqual(light.prepareCallCount, 0)
        XCTAssertEqual(medium.prepareCallCount, 0)
        XCTAssertEqual(heavy.prepareCallCount, 0)
        XCTAssertEqual(notification.prepareCallCount, 0)
        XCTAssertEqual(selection.prepareCallCount, 0)
        XCTAssertEqual(light.impactCallCount, 0)
        XCTAssertEqual(notification.notifications.count, 0)
        XCTAssertEqual(selection.selectionCallCount, 0)
    }

    // Purpose: Direct triggers should hit the matching generator.
    func testDirectTriggersInvokeExpectedGenerators() {
        let sut = makeSUT()

        sut.light()
        sut.medium()
        sut.heavy()
        sut.success()
        sut.selection()

        XCTAssertEqual(light.impactCallCount, 1)
        XCTAssertEqual(medium.impactCallCount, 1)
        XCTAssertEqual(heavy.impactCallCount, 1)
        XCTAssertEqual(notification.notifications, [.success])
        XCTAssertEqual(selection.selectionCallCount, 1)
    }

    // Purpose: Pattern helpers should fire the delayed second step.
    func testCustomLightPatternFiresSecondImpact() {
        let sut = makeSUT()
        let expectation = expectation(description: "second light impact")

        sut.customLightPattern()
        XCTAssertEqual(light.impactCallCount, 1)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.light.impactCallCount, 2)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    // Purpose: Disabling mid-pattern should block the delayed second step.
    func testDisablingBeforeSecondStepSkipsFollowUpImpact() {
        let sut = makeSUT()
        let expectation = expectation(description: "second step skipped")

        sut.customLightPattern()
        XCTAssertEqual(light.impactCallCount, 1)
        HapticEase.isEnabled = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.light.impactCallCount, 1)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
#endif
