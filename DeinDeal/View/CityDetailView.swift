//
//  CityDetailView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import SwiftUI

struct CityDetailView: View {
    
    var city: City
    
    @StateObject private var viewModel = CityDetailViewModel()
    
    var body: some View {
        VStack {
            
            // MARK: banner (not clickable yet)
            
            RedBannerView(title: city.id.capitalized,
                          subtitle: "Tap here to change the address")
            
            // MARK: filter list
            
            // MARK: food list
            
            List(viewModel.foods?.items ?? []) { item in
                FoodsItemTemplate(foodItem: item)
                    .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
        }
        .navigationTitle(city.id.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                await viewModel.fetchFoods(cityID: city.id)
            }
        }
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(city: City(
            id: "geneve",
            channelInfo: CityChannelInfo(
                title: "Genf",
                images: CityImages(
                    small: "https://neutron.deindeal.ch/channels/config/ChannelConfig_small_imagefood_config_geneva_dd.jpg?v=1580396386",
                    large: "https://neutron.deindeal.ch/channels/config/ChannelConfig_large_imagefood_config_geneva_dd.jpg?v=1580398270"
                )
            )
        )
        )
    }
}
