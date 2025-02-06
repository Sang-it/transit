import Foundation
import SwiftUI
import WidgetKit

final class WidgetStopService {
    static let shared = WidgetStopService()

    @AppStorage("widgetStopID", store: UserDefaults(suiteName: "group.Enix.Transit"))
    private var widgetStopID: Int = 0

    func clearWidgetStopID() {
        widgetStopID = 0
        WidgetCenter.shared.reloadTimelines(ofKind: "Glance")
    }

    func setWidgetStopID(_ stopID: Int) {
        widgetStopID = stopID
        WidgetCenter.shared.reloadTimelines(ofKind: "Glance")
    }

    func getWidgetStopID() -> Int {
        return widgetStopID
    }
}
