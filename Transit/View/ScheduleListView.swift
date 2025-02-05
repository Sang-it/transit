import SwiftUI

struct ScheduleListView: View {
    var stopID: Int
    var stopName: String
    @State private var schedules: [Schedule] = []
    @State private var error: String?

    var body: some View {
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

