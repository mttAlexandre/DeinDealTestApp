//
//  RequestHelper.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import Foundation

final class RequestHelper {
    
    static func fetchCities() async -> [City]? {
        let stringUrl = "http://testfoodios.herokuapp.com/settings"
        
        guard let url = URL(string: stringUrl) else {
            print("invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedDatas = try JSONDecoder().decode(Cities.self, from: data)
            return decodedDatas.cities
        } catch {
            print(error)
            print(error.localizedDescription)
            return nil
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
    
    /// Encode the given string and return a valid URL if possible.
    /// - Parameter string: a text representation of the URL
    /// - Returns: A URL from the encoded string if possible, else nil.
    static func getUrlEncodingString(_ string: String) -> URL? {
        guard let urlString = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        
        return URL(string: urlString)
    }
}
