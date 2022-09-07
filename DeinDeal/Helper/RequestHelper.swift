//
//  RequestHelper.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import Foundation

final class RequestHelper {
    
    static func fetchCities() async -> [City] {
        let stringUrl = "http://testfoodios.herokuapp.com/settings"
        
        guard let url = URL(string: stringUrl) else {
            print("invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedDatas = try JSONDecoder().decode(Cities.self, from: data)
            return decodedDatas.cities
        } catch {
            print(error)
            print(error.localizedDescription)
            return []
        }
    }
    
    static func fetchFoodForCityID(_ cityID: String) async -> Foods? {
        let stringUrl = "http://testfoodios.herokuapp.com/foods/"
        
        guard var url = URL(string: stringUrl) else {
            print("invalid URL")
            return nil
        }
        
        url.appendPathComponent(cityID)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(Foods.self, from: data)
        } catch {
            print(error)
            print(error.localizedDescription)
            return nil
        }
    }
}
