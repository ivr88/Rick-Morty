import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var detailModel: DetailModel?
    
    func fetch(for id: Int) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode/\([id])") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let detailModel = try JSONDecoder().decode(DetailModel.self, from: data)
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
