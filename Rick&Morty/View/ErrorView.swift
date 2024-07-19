import SwiftUI

struct ErrorView: View {
    
    @ObservedObject private var networkManager = NetworkManager()
    @State private var showAlert = false
    
    var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay (
                VStack (spacing: 15) {
                    Image("errorImage")
                        .frame(width: 263, height: 263)
                    Text("Network Error")
                        .multilineTextAlignment(.center)
                        .font(.custom("IBMPlexSans-SemiBold", size: 28))
                    Text("There was an error connecting. Please check your internet")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(UIColor(named: "#6D7885") ?? .white))
                        .font(.custom("IBMPlexSans-Regular", size: 16))
                        .frame(width: 253)
                    
                    Button {
                        self.showAlert =  true
                    } label: {
                        Text("Retry")
                            .font(.custom("IBMPlexSans-Medium", size: 18))
                            .padding(.horizontal, 87.5)
                            .padding(.vertical, 10)
                    }
                    .background(Color(UIColor(named: "#42B4CA") ?? .white))
                    .clipShape(.rect(cornerRadius: 16))
                }
                .foregroundStyle(.white))
                .alert(isPresented: $showAlert) {
                if networkManager.isConnected {
                    return Alert(title: Text("Success!"), message: Text("The network request can be performed"), dismissButton: .default(Text("OK")))
            }
            return Alert(title: Text("No internet connection"), message: Text("Please, enable wi-fi or Celluar data"), dismissButton: .default(Text("Cancel")))
        }
    }
}

#Preview {
    ErrorView()
}
