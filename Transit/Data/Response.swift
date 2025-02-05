struct Response: Decodable {
    var records: [Schedule]
    var error: String?
}
