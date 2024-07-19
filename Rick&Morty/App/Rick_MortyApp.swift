import SwiftUI

@main
struct Rick_MortyApp: App {
    @StateObject private var networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(networkManager)
        }
    }
}
