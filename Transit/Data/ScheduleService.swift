import Foundation

final class ScheduleService {
    static let shared = ScheduleService()

    private let serverUrl = "https://njtransit.duckdns.org/"
    private let localUrl = "http://localhost:3000/"

    private func fetch(_ stopID: Int, _ overrideCache: Bool = false) async throws -> (
        [Schedule], String?
    ) {
        guard let url = URL(string: serverUrl) else {
            throw URLError(.badURL)
        }

        let payload = try JSONEncoder().encode(
            Payload(stopID: stopID, overrideCache: overrideCache)
        )

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = payload

        let (data, _) = try await URLSession.shared.data(for: request)

        let result = try JSONDecoder().decode(Response.self, from: data)

        return (result.records, result.error)
    }

    func getSchedule(_ stopID: Int, _ overrideCache: Bool) async throws -> ([Schedule], String?) {
        let (schedules, error) = try await fetch(stopID, overrideCache)
        return (schedules, error)
    }
}
