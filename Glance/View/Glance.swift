//
//  Glance.swift
//  Glance
//
//  Created by Sangit Manandhar on 2/5/25.
//

import SwiftUI
import WidgetKit

struct Glance: Widget {
    let kind: String = "Glance"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            GlanceEntryView(entry: entry).padding()
        }
        .supportedFamilies([.systemMedium])
    }
}
