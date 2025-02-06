//
//  Provider.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ScheduleEntry {
        ScheduleEntry(date: .now, schedules: [.preview71, .preview29], error: nil)
    }

    func getSnapshot(in context: Context, completion: @escaping (ScheduleEntry) -> Void) {
        Task {
            do {
                let widgetStopId = WidgetStopService.shared.getWidgetStopID()
                if widgetStopId != 0 {
                    let (schedules, error) = try await ScheduleService.shared.getSchedule(widgetStopId, false)
                    let entry = ScheduleEntry(date: .now, schedules: schedules, error: error)
                    completion(entry)
                } else {
                    let entry = ScheduleEntry(date: .now, schedules: [], error: "Select a Stop to display.")
                    completion(entry)
                }
            } catch {
                completion(
                    ScheduleEntry(
                        date: .now, schedules: [.preview71, .preview29],
                        error: error.localizedDescription)
                )
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ScheduleEntry>) -> Void) {
        Task {
            do {
                let widgetStopId = WidgetStopService.shared.getWidgetStopID()
                if widgetStopId != 0 {
                    let (schedules, error) = try await ScheduleService.shared.getSchedule(widgetStopId, false)
                    let entry = ScheduleEntry(date: .now, schedules: schedules, error: error)
                    let timeline = Timeline(
                        entries: [entry], policy: .after(.now.advanced(by: 1 * 60)))
                    completion(timeline)
                } else {
                    let entry = ScheduleEntry(date: .now, schedules: [], error: "Select a Stop to display.")
                    let timeline = Timeline(
                        entries: [entry], policy: .after(.now.advanced(by: 1 * 60)))
                    completion(timeline)
                }
            } catch {
                let entries = [
                    ScheduleEntry(
                        date: .now, schedules: [.preview71, .preview29],
                        error: error.localizedDescription)
                ]
                let timeline = Timeline(
                    entries: entries, policy: .after(.now.advanced(by: 1 * 60)))
                completion(timeline)
            }
        }
    }
}
