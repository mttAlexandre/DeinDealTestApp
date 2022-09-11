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
    
    @State private var selectedFoodCategories: Set<String> = []
    
    private var filteredFoodItems: [FoodItem] {
        if viewModel.foods == nil { return [] }
        
        return viewModel.foods!.items
            .filter {
                // if no categories are selected, we don't have to filter the list
                if selectedFoodCategories.isEmpty {
                    return true
                }
                // if at least one category of the food is selected by the user
                // we display the food on screen
                for theme in $0.myThemes {
                    if selectedFoodCategories.contains(theme) {
                        return true
                    }
                }
                
                return false
            }
        // sort food titles alphabetically
            .sorted {
                $0.title < $1.title
            }
    }
    
    var body: some View {
        VStack {
            
            // MARK: banner (not clickable yet)
            
            RedBannerView(title: city.id.capitalized,
                          subtitle: "Tap here to change the address")
            
            // MARK: filter list
            
            FoodCategoryListView(selectedFoodCategories: $selectedFoodCategories,
                                 categories: viewModel.foods?.facetCategories ?? [])
            
            // MARK: food list
            
            List(filteredFoodItems) { item in
                FoodsItemTemplate(foodItem: item)
                    .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
        }
        .navigationTitle(city.id.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                BagButton()
            }
        }
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
            id: "zurich",
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
