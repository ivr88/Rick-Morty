import SwiftUI

struct DetailView: View {
    let id: Int
    @ObservedObject private var detailViewModel = DetailViewModel()
    var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay (
                VStack {
                    ForEach(detailViewModel.detailModel?.results ?? [], id: \.id) { result in
                        VStack (alignment: .leading, spacing: 20) {
                            AsyncImage(url: URL(string: result.image)) { phase in
                                phase.image?
                                    .resizable()
                                    .frame(width: 320, height: 320)
                                    .clipShape(.rect(cornerRadius: 18))
                            }
                            Text(result.status.rawValue)
                                .font(.custom("IBMPlexSans-SemiBold", size: 16))
                                .padding(.horizontal, 140)
                                .frame(height: 42)
                                .background(Color(UIColor(named: "#198737") ?? .white))
                                .clipShape(.rect(cornerRadius: 16))
                            VStack (alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("Species:")
                                        .font(.custom("IBMPlexSans-SemiBold", size: 16))
                                    Text("\(result.species.rawValue)")
                                        .font(.custom("IBMPlexSans-Regular", size: 16))
                                }
                                HStack {
                                    Text("Gender:")
                                        .font(.custom("IBMPlexSans-SemiBold", size: 16))
                                    Text("\(result.gender.rawValue)")
                                        .font(.custom("IBMPlexSans-Regular", size: 16))
                                }
                                HStack {
                                    Text("Episodes:")
                                        .font(.custom("IBMPlexSans-SemiBold", size: 16))
                                    Text("\("episodes")")
                                        .font(.custom("IBMPlexSans-Regular", size: 16))
                                }
                                HStack {
                                    Text("Last known location:")
                                        .font(.custom("IBMPlexSans-SemiBold", size: 16))
                                    Text("\(result.location.name)")
                                        .font(.custom("IBMPlexSans-Regular", size: 16))
                                }
                            }
                        }
                        .padding()
                        .background(Color(UIColor(named: "#151517") ?? .white))
                        .clipShape(.rect(cornerRadius: 24))
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                VStack {
                                    Text(result.name)
                                        .font(.custom("IBMPlexSans-Bold", size: 24))
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            .foregroundStyle(.white))
            .onAppear {
                detailViewModel.fetch(for: id)
        }
    }
}

#Preview {
    DetailView(id: Int())
}
