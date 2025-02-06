struct Schedule: Decodable, Identifiable {
    var id: String
    var routeID: String
    var destination: String
    var minutesToArrival: String
    var arrivalTime: String
    var congestionStatus: String
}

extension Schedule {
    static let preview71 = Schedule(
        id: "87988ac6-bf9d-4a34-8fd6-067b03c130bc", routeID: "71", destination: "WEST CALDWELL",
        minutesToArrival: "Arriving in 2 minutes",
        arrivalTime: "1:00 PM", congestionStatus: "LIGHT")

    static let preview29 = Schedule(
        id: "76454f10-ee2d-457d-bea3-6996ef1c0a35", routeID: "29",
        destination: "BLOOMFIELD AVE WEST CALDWELL",
        minutesToArrival: "Arriving in 20 minutes",
        arrivalTime: "1:18 PM", congestionStatus: "HEAVY")
}
