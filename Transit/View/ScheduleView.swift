import SwiftUI

struct ScheduleView: View {
    var schedule: Schedule

    var body: some View {
        GroupBox(
            label:
                HStack(spacing: 10) {
                    Text(schedule.routeID).fontWeight(.semibold).foregroundColor(.blue).opacity(0.8)
                    Text(schedule.destination).fontWeight(.semibold).foregroundColor(.green)
                        .opacity(0.8)
                }.padding(.horizontal)
        ) {
            HStack(spacing: 10) {
                Text(schedule.arrivalTime).fontWeight(.semibold).foregroundColor(.red).opacity(0.8)
                Divider().frame(maxHeight: 20)
                Text(schedule.minutesToArrival)
            }
        }
    }
}
