struct Memo: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id
        case title
        case body
    }
}
