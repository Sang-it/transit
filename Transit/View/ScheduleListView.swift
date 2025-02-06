import SwiftUI

struct ScheduleListView: View {
    var stopID: Int
    var stopName: String
    @State private var schedules: [Schedule] = []
    @State private var error: String?
    @State private var didToggle: Bool = false

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Divider().frame(maxHeight: 20)
                Text(String(stopID))
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .opacity(0.8)
                    .padding()
                Divider().frame(maxHeight: 20)
                Text(stopName)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .opacity(0.8)
                    .padding()
                Divider().frame(maxHeight: 20)
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if (error?.isEmpty) != nil {
                        Text(error!)
                            .foregroundColor(.red)
                            .padding()
                    } else if schedules.isEmpty {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                    } else {
                        ForEach(schedules) { schedule in
                            ScheduleView(schedule: schedule)
                        }
                        Spacer()
                    }
                }
            }.task {
                await getData(overrideCache: false)
            }
            .refreshable {
                await getData(overrideCache: true)
            }
        }
        .navigationTitle("Schedules")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if !didToggle && WidgetStopService.shared.getWidgetStopID() == stopID {
                    RemoveWidgetButton
                } else if !didToggle && WidgetStopService.shared.getWidgetStopID() != stopID {
                    AddWidgetButton
                } else if didToggle && WidgetStopService.shared.getWidgetStopID() == stopID {
                    RemoveWidgetButton
                } else {
                    AddWidgetButton
                }
            }
        }
    }

    private var AddWidgetButton: some View {
        Button {
            WidgetStopService.shared.setWidgetStopID(stopID)
            didToggle.toggle()
        } label: {
            Label("Add Widget", systemImage: "plus")
        }
    }

    private var RemoveWidgetButton: some View {
        Button {
            WidgetStopService.shared.clearWidgetStopID()
            didToggle.toggle()
        } label: {
            Label("Remove Widget", systemImage: "minus")
        }
    }

    private func getData(overrideCache: Bool) async {
        do {
            let (schedules, error) = try await ScheduleService.shared.getSchedule(
                stopID, overrideCache)
            self.schedules = schedules
            self.error = error
        } catch {
            self.error = error.localizedDescription
        }
    }
}
