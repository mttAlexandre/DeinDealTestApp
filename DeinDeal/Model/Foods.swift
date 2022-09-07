//
//  Food.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import Foundation

struct Foods: Identifiable, Codable {
    
    var id: String
    var name: String
    var items: [FoodItem]
    var facetCategories: [FoodFacetCategories]
}
