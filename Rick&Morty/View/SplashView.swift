import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    var body: some View {
        ZStack {
            Image("splashImage")
                .ignoresSafeArea(.all)
            Image("Rick_and_Morty")
                .frame(alignment: .center)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView(isActive: .constant(true))
}
