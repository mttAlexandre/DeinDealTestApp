//
//  FoodsItemTemplate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodItemTemplate: View {
    
    var foodItem: FoodItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            WebImage(
                url: RequestHelper.getUrlEncodingString(foodItem.images.cover),
                     options: .progressiveLoad, context: [
                        // store it in disk
                        .storeCacheType: SDImageCacheType.disk.rawValue
                     ]
            )
            .resizable()
            .placeholder {
                // placeholder while image is loading
                Rectangle()
                    .foregroundColor(.gray)
            }
            .indicator(.activity) // Activity Indicator
            .transition(.fade(duration: 0.5)) // Fade Transition with duration
            .scaledToFit()
            
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
