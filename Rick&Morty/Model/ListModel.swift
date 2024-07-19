import Foundation

// MARK: - Model
struct ListModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    
    static let example = Result(id: Int(), name: String(), status: .alive, species: .alien, gender: .female, origin: Location.init(name: String(), url: String()), location: Location.init(name: String(), url: String()), image: String(), episode: [String()])
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


