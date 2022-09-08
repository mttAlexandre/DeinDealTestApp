//
//  FoodsItemTemplate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct FoodsItemTemplate: View {
    
    var foodItem: FoodItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let imageURL = RequestHelper.getUrlEncodingString(foodItem.images.cover) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        case .failure:
                            Image(systemName: "xmark")
                        @unknown default:
                            EmptyView()
                    }
                }
            }
            
            Text(foodItem.title)
                .font(.system(.body, design: .rounded))
                .bold()
                .padding([.leading, .top])
            
            Text(foodItem.subtitle)
                .font(.system(.body, design: .rounded))
                .padding([.leading, .bottom])
                          
            Divider()
                .padding(.bottom)
        }
    }
}

struct FoodsItemTemplate_Previews: PreviewProvider {
    static var previews: some View {
        FoodsItemTemplate(
            foodItem: FoodItem(id: 90555,
                               title: "Yalla Habibi",
                               subtitle: "Mezze, Schawarma, Falafel & Kafta",
                               images: FoodImage(cover: "https://cosmos2.deindeal.ch/api/img?p=sales/2020/10/{6BDEBABB-1B86-4264-BE17-D0877B1BF035}/66290-VENTE_IMG_MOBILE_DD&v=1602778390"),
                               myThemes: ["fd_libanese"])
        )
    }
}
