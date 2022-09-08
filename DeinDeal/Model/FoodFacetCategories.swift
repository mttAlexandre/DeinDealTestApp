//
//  FoodFacetCategories.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import Foundation

struct FoodFacetCategories: Identifiable, Codable, Hashable {
    
    var id: String
    var label: String
    var icon: String
    var count: Int
}
