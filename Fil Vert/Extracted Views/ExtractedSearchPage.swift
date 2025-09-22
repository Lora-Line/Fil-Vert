import SwiftUI




struct ExtractedSearchPage: View {
    let brand: Brand
    let fact: String
    
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.almostWhite)
                HStack {
                    Image(brand.logo)
                        .resizable()
                        .frame(width: 122, height: 106)
                        .cornerRadius(8)
                        .padding(8)
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 4){
                                Text(brand.name.rawValue)
                                    .gupterFont(size: 22)
                                HStack {
                                    ForEach(brand.tags, id: \.self) { tag in
                                        Text(tag.rawValue)
                                            .SFProFont(weight: .mediumTerra, size:12)
                                            .textCase(.uppercase)
                                            .padding(4)
                                            .background(.terra.opacity(0.2))
                                            .cornerRadius(4)
                                    }
                                }
                                Text(brand.description)
                                    .SFProFont(weight: .regular, size: 12)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.vertical, 8)
                            Spacer()
                        }
                        Spacer()
                        
                            HStack {
                                Spacer()
                                HStack {
                                    Link("Aller vers \(brand.name.rawValue)", destination: URL(string: brand.link)!)
                                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                                }
                                .SFProFont(weight: .mediumBlanc, size: 12)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(.terra)
                                .cornerRadius(12)
                            }
                        
                    }
                    .padding(8)
                }
            }
        }
        .padding(.horizontal)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
        HStack {
            Text(fact)
                .gupterFont(size: 22)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ScrollView {
        VStack {
            ForEach(brands) { brand in
                ExtractedSearchPage(brand: brand, fact: facts[0])
            }
        }
    }
}
