//
//  DetailsClothes.swift
//  FilVert
//
//  Created by apprenant83 on 18/09/2025.
//

import SwiftUI

struct DetailsClothes: View {
    let clothe : Clothe
    
    var body: some View {
        ZStack{
            Color.floralWhite.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.almostWhite)
                            
                        /*Image(clothe.image)
                         .resizable()
                         .scaledToFill()
                         .aspectRatio(1, contentMode: .fit)
                         .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                         .padding(8)
                         */
                            .aspectRatio(1, contentMode : .fit)
                            .overlay(
                                Image(clothe.image)
                                    .resizable()
                                    .scaledToFill()
                                    //.padding(8)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        
                        
                    }//.aspectRatio(1.0, contentMode: .fit)
                        .padding()
                    
                    
                    
                    HStack {
                        Text(clothe.name)
                            .foregroundStyle(.deepGreen)
                            .gupterFont(size: 36)
                        
                        Spacer()
                        Text("\(clothe.price, specifier: "%.2f")€")
                            .SFProFont(weight: .regular, size: 25)
                    }.padding()
                    
                    VStack(alignment: .leading, spacing: 16){
                        HStack{
                            Text("De")
                                .SFProFont(weight: .regular, size: 16)
                            Text(clothe.brand.rawValue)
                                .SFProFont(weight: .bold, size: 16)
                            
                            Spacer()
                        }
                        
                        
                        Text(clothe.description)
                            .SFProFont(weight: .regular, size: 16)
                        
                        
                        Text(clothe.material)
                            .SFProFont(weight: .regular, size: 16)
                    }
                    .padding(.horizontal)
                }
                .overlay(
                    Group {
                        if #available(iOS 26.0, *) {
                            Button {
                                
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Me rendre sur le site de \(clothe.brand.rawValue)").SFProFont(weight: .boldBlanc, size: 20)
                                    Spacer()
                                    Image(systemName: "rectangle.portrait.and.arrow.forward").font(.system(size: 30, weight: .semibold))
                                }
                                .SFProFont(weight: .boldBlanc, size: 20)
                                .padding(.horizontal)
                            }
                            .buttonStyle(.glassProminent)
                            .tint(Color.terra)
                            .padding()
                        } else {
                            Button {
                                
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Me rendre sur le site de \(clothe.brand.rawValue)")
                                    Spacer()
                                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                                }
                                .SFProFont(weight: .boldBlanc, size: 20)
                                .padding()
                                .background(.terra)
                                .cornerRadius(22)
                                .cornerRadius(12)
                                .padding(.horizontal)
                            }
                            .padding(.vertical)
                        }
                    }
                    , alignment: .bottom
                )
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DetailsClothes(clothe: clothes[37])
}
