//
//  CityDetailViewModel.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import Foundation

final class CityDetailViewModel: ObservableObject {
    
    @Published private(set) var foods: Foods?
    
    @MainActor
    func fetchFoods(cityID: String) async {
        foods = await RequestHelper.fetchFoodForCityID(cityID)
    }
}
