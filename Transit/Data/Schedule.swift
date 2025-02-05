struct Schedule: Decodable, Identifiable {
    var id: String
    var routeID: String
    var destination: String
    var minutesToArrival: String
    var arrivalTime: String
    var congestionStatus: String
}
