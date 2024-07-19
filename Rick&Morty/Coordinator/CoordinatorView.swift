import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject private var networkManager = NetworkManager()
    
    @State private var isActive = false
    
    var body: some View {
        if networkManager.isConnected && isActive {
            ListView()
        } else if !networkManager.isConnected {
            ErrorView()
        } else {
            SplashView(isActive: $isActive)
        }
    }
}

#Preview {
    CoordinatorView()
}

