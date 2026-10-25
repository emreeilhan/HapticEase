// Purpose: Record UIKit generator interactions for unit tests.
import UIKit
@testable import HapticEase

final class MockImpactGenerator: ImpactHapticGenerating {
    private(set) var prepareCallCount = 0
    private(set) var impactCallCount = 0

    func prepare() {
        prepareCallCount += 1
    }

    func impactOccurred() {
        impactCallCount += 1
    }
}

final class MockNotificationGenerator: NotificationHapticGenerating {
    private(set) var prepareCallCount = 0
    private(set) var notifications: [UINotificationFeedbackGenerator.FeedbackType] = []

    func prepare() {
        prepareCallCount += 1
    }

    func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        notifications.append(notificationType)
    }
}

final class MockSelectionGenerator: SelectionHapticGenerating {
    private(set) var prepareCallCount = 0
    private(set) var selectionCallCount = 0

    func prepare() {
        prepareCallCount += 1
    }

    func selectionChanged() {
        selectionCallCount += 1
    }
}
