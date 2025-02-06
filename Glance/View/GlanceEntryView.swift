//
//  GlanceEntryView.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//

import SwiftUI
import WidgetKit

struct GlanceEntryView: View {

    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemMedium:
            MeduimWidgetView(entry: entry)
        default: Text("Unsupported widget family")
        }
    }
}
