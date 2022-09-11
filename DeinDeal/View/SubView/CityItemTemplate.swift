//
//  CityItemTemplate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct CityItemTemplate: View {
    
    var cityName: String
    var cityImageUrlString: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let imageURL = RequestHelper.getUrlEncodingString(cityImageUrlString) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(12)
                                .shadow(radius: 7)
                        case .failure:
                            Image(systemName: "xmark")
                        @unknown default:
                            EmptyView()
                    }
                }
                .frame(maxWidth: 200, maxHeight: 100)
            }
            
            Text(cityName.uppercased())
                .foregroundColor(.white)
                .padding(5)
        }
    }
}

struct CityItemTemplate_Previews: PreviewProvider {
    static var previews: some View {
        CityItemTemplate(cityName: "Zurich",
                         cityImageUrlString: "https://neutron.deindeal.ch/channels/config/ChannelConfig_small_imagefood_config_geneva_dd.jpg?v=1580396386")
    }
}
