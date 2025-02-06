//
//  ScheduleViewWidget.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//

import SwiftUI

struct ScheduleViewWidget: View {
    var schedule: Schedule

    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Text(schedule.routeID).fontWeight(.semibold).foregroundColor(.blue).opacity(0.8)
            Divider().frame(maxHeight: 20)
            Text(schedule.arrivalTime).fontWeight(.semibold).foregroundColor(.red).opacity(
                0.8)
            Divider().frame(maxHeight: 20)
            Text(schedule.minutesToArrival.filter(\.isNumber) + "mins").fontWeight(.semibold)
                .foregroundStyle(
                    .white
                ).opacity(0.8)
        }.backgroundStyle(.black)
    }
}
