//
//  SimpleEntry.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//

import SwiftUI
import WidgetKit

struct ScheduleEntry: TimelineEntry {
    let date: Date
    let schedules: [Schedule]
    let error: String?
}
