import Foundation

// MARK: - DetailModel
struct DetailModel: Codable {
    let results: [DetailResult]
}

// MARK: - Result
struct DetailResult: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
