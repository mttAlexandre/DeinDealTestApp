//
//  CityDetailView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import SwiftUI

struct CityDetailView: View {
    
    init(city: City) {
        // city State muste be initialized like this
        self._city = State(initialValue: city)
    }
    
    // EnvironmentObject must be @ObservableObject class, can't use protocol here
    @EnvironmentObject private var cityProvider: CityListTabViewModel
    // view model of this view
    @StateObject private var viewModel = CityDetailViewModel()
    // current city must be a @State to be modified on RedBanner tap
    @State private var city: City
    // all category selected, multiple selection enable
    @State private var selectedFoodCategories: Set<String> = []
    // alert to change location
    @State private var showConfirmationDialog = false
    
    // food list content, filtered and sorted
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
    
    // MARK: - body
    
    var body: some View {
        VStack {
            
            // MARK: banner (not clickable yet)
            
            RedBannerView(title: city.id.capitalized,
                          subtitle: "Tap here to change the address")
            // MARK: bonus point - tap to change location
            .onTapGesture {
                // display alert on tap
                // assuming that if there is only on city, we are already diplaying it
                showConfirmationDialog = cityProvider.getCities().count > 1
            }
            .confirmationDialog("Select another location", isPresented: $showConfirmationDialog) {
                ForEach(cityProvider.getCities()) { city in
                    // remove the current city from the choices
                    if city.id != self.city.id {
                        Button(city.id.capitalized) {
                            self.city = city
                            // clear seleted categories
                            selectedFoodCategories = []
                            // reload view for the selected city
                            loadFoodsForCity()
                        }
                    }
                }
                
                // default cancel button
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select another location")
            }

            
            // MARK: filter list
            
            FoodCategoryListView(selectedFoodCategories: $selectedFoodCategories,
                                 categories: viewModel.foods?.facetCategories ?? [])
            
            // MARK: food list
            
            List(filteredFoodItems) { item in
                FoodsItemTemplate(foodItem: item)
                // remove horizontal padding
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
            loadFoodsForCity()
        }
    }
    
    // MARK: - func
    
    private func loadFoodsForCity() {
        Task {
            await viewModel.fetchFoods(cityID: city.id)
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
