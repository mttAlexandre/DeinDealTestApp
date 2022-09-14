//
//  FoodsItemTemplate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct FoodItemTemplate: View {
    
    var foodItem: FoodItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: RequestHelper.getUrlEncodingString(foodItem.images.cover)) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
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

struct FoodItemTemplate_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemTemplate(
            foodItem: FoodItem(id: 90555,
                               title: "Yalla Habibi",
                               subtitle: "Mezze, Schawarma, Falafel & Kafta",
                               images: FoodImage(cover: "https://cosmos2.deindeal.ch/api/img?p=sales/2020/10/{6BDEBABB-1B86-4264-BE17-D0877B1BF035}/66290-VENTE_IMG_MOBILE_DD&v=1602778390"),
                               myThemes: ["fd_libanese"])
        )
    }
}
