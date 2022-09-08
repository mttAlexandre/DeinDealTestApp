//
//  CityListTabViewModel.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import Foundation

final class CityListTabViewModel: ObservableObject {
    
    @Published private(set) var cities = [City]()
    
    @MainActor
    func fetchCities() async {
        cities = await RequestHelper.fetchCities()
    }
}
