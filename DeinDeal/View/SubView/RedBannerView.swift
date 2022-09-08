//
//  RedBannerView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct RedBannerView: View {
    
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 40, weight: .light, design: .rounded))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 30, weight: .light, design: .rounded))
                
                Text(subtitle)
                    .font(.system(size: 20, weight: .thin, design: .rounded))
            }
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
        .background {
            redColor
                .overlay {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 120))
                        .foregroundColor(.white.opacity(0.3))
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity,
                               alignment: .trailing)
                }
                .clipped()
        }
    }
}

struct RedBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RedBannerView(title: "Hungry? We deliver!",
                      subtitle: "Tap here to select an address")
    }
}
