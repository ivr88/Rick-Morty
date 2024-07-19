import SwiftUI

struct ClearButton: ViewModifier {
    
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        ZStack (alignment: .trailing) {
            content
            
            if !text.isEmpty {
                Button {
                    self.text = ""
                } label: {
                    Image(systemName: "multiply")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 5)
            }
        }
    }
}
