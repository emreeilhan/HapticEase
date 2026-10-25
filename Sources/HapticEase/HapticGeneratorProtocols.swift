// Purpose: Internal seams for UIKit generators so tests can inject mocks.
import UIKit

@MainActor
protocol ImpactHapticGenerating: AnyObject {
    func prepare()
    func impactOccurred()
    func impactOccurred(intensity: CGFloat)
}

@MainActor
protocol NotificationHapticGenerating: AnyObject {
    func prepare()
    func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType)
}

@MainActor
protocol SelectionHapticGenerating: AnyObject {
    func prepare()
    func selectionChanged()
}

extension UIImpactFeedbackGenerator: ImpactHapticGenerating {}
extension UINotificationFeedbackGenerator: NotificationHapticGenerating {}
extension UISelectionFeedbackGenerator: SelectionHapticGenerating {}
