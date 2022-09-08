//
//  CityListTabView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import SwiftUI

struct CityListTabView: View {
    
    @StateObject private var viewModel = CityListTabViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // MARK: title
        
            TitleView()
                .padding(.leading)
            
            ScrollView {
                VStack {
                    // MARK: banner
                    
                    RedBannerView(title: "Hungry? We deliver!",
                                  subtitle: "Tap here to select an address")

                    // MARK: cities list
                    
                    Text("Nearby cities :")
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .horizontal])
                    
                    citiesListView
                    
                    // image
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                Task {
                    await viewModel.fetchCities()
                }
            }
        }
    }
    
    // handle display depending on loading state
    @ViewBuilder private var citiesListView: some View {
        if viewModel.cities == nil {
            // nil -> fetch error
            Text("Check your connection")
        } else if viewModel.cities!.isEmpty {
            // empty -> still waiting for fetch result
            ProgressView()
        } else {
            // not empty -> display the horizontal ScrollView
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(viewModel.cities!) { city in
                        NavigationLink {
                            CityDetailView(city: city)
                        } label: {
                            CityItemTemplate(cityName: city.id,
                                             cityImageUrlString: city.channelInfo.images.small)
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

struct CityListTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CityListTabView()
        }.navigationViewStyle(.stack)
    }
}
