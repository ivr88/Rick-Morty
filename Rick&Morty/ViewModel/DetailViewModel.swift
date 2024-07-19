import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var detailModel: ListModel?
    
    func fetch(for id: Int) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let detailModel = try JSONDecoder().decode(ListModel.self, from: data)
                DispatchQueue.main.async {
                    self?.detailModel = detailModel
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
