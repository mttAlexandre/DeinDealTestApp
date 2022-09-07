//
//  FoodItem.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import Foundation

struct FoodItem: Identifiable, Codable {
    
    var id: Int
    var title: String
    var subtitle: String
    var images: FoodImage
    var myThemes: [String]
}
