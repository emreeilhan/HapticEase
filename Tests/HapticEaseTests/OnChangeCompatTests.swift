import SwiftUI
import UIKit
import XCTest
@testable import HapticEase

@MainActor
final class OnChangeCompatTests: XCTestCase {
    private final class Trigger: ObservableObject {
        @Published var value = false
    }

    private struct Probe: View {
        @ObservedObject var trigger: Trigger
        let appeared: () -> Void
        let changed: (Bool) -> Void

        var body: some View {
            Text("Trigger")
                .onChangeCompat(of: trigger.value) {
                    changed(trigger.value)
                }
                .onAppear(perform: appeared)
        }
    }

    func testObservesBothTransitionsWithoutFiringOnAppearance() {
        let appeared = expectation(description: "view appeared")
        let enabled = expectation(description: "false to true")
        let disabled = expectation(description: "true to false")
        let trigger = Trigger()
        var changes: [Bool] = []
        let controller = UIHostingController(rootView: Probe(
            trigger: trigger,
            appeared: { appeared.fulfill() },
            changed: { value in
                changes.append(value)
                if value {
                    enabled.fulfill()
                } else {
                    disabled.fulfill()
                }
            }
        ))
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        defer {
            window.isHidden = true
            window.rootViewController = nil
        }

        wait(for: [appeared], timeout: 2)
        XCTAssertEqual(changes, [])

        trigger.value = true
        wait(for: [enabled], timeout: 2)
        trigger.value = false
        wait(for: [disabled], timeout: 2)

        XCTAssertEqual(changes, [true, false])
    }
}
