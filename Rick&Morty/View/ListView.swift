import SwiftUI

struct ListView: View {
    @ObservedObject private var listViewModel = ListViewModel()
    var body: some View {
        VStack {
            NavigationStack {
                List(listViewModel.listModel?.results ?? [], id: \.id) { result in
                    NavigationLink {
                        DetailView(result: result)
                            .toolbarRole(.editor)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: result.image)) { phase in
                                phase.image?
                                    .resizable()
                                    .frame(width: 84, height: 64)
                                    .clipShape(.rect(cornerRadius: 10))
                            }
                            VStack (alignment: .leading, spacing: 6) {
                                Text(result.name)
                                    .font(.custom("IBMPlexSans-Medium", size: 18))
                                HStack {
                                    if result.status.rawValue == "Alive" {
                                        Text(result.status.rawValue)
                                            .foregroundStyle(Color(UIColor(named: "#198737") ?? .white))
                                    } else if result.status.rawValue == "Dead" {
                                        Text(result.status.rawValue)
                                            .foregroundStyle(Color(UIColor(named: "#D62300") ?? .white))
                                    } else {
                                        Text(result.status.rawValue)
                                            .foregroundStyle(Color(UIColor(named: "#686874") ?? .white))
                                    }
                                    Text("•")
                                    Text(result.species.rawValue)
                                }
                                .font(.custom("IBMPlexSans-SemiBold", size: 12))
                                
                                Text(result.gender.rawValue)
                                    .font(.custom("IBMPlexSans-Regular", size: 12))
                            }
                        }
                    }
                    .listRowBackground(Color(UIColor(named: "#151517") ?? .white))
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Rick & Morty Characters")
                                .foregroundColor(.white)
                                .font(.custom("IBMPlexSans-Bold", size: 24))
                        }
                    }
                    .toolbarBackground(.black, for: .navigationBar)
                }
                .scrollContentBackground(.hidden)
                .background(.black)
                .listRowSpacing(4)
                .scrollIndicators(.hidden)
            }
            .background(.black)
        }
        .background(.black)
        .tint(.white)
        .foregroundStyle(.white)
        .onAppear {
            listViewModel.fetch()
        }
    }
}

#Preview {
    ListView()
}
