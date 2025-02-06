//
//  MeduimWidgetView.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//


import SwiftUI
import WidgetKit

struct MeduimWidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if (entry.error?.isEmpty) != nil {
                Text(entry.error!)
                    .foregroundColor(.red)
                    .padding()
            } else {
                ForEach(
                    (entry.schedules.count > 4 ? Array(entry.schedules[0...3]) : entry.schedules)
                ) {
                    schedule in
                    ScheduleViewWidget(schedule: schedule)
                }
            }
        }.containerBackground(for: .widget){
            Color.black
        }
        Spacer()
    }
}
