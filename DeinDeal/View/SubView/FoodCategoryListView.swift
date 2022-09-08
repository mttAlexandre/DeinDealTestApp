//
//  FoodCategoryListView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct FoodCategoryListView: View {
    
    @Binding var selectedFoodCategories: Set<String>
    var categories: [FoodFacetCategories]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories) { category in
                    FoodCategoryItemTemplate(selectedFoodCategories: $selectedFoodCategories,
                                             category: category)
                }
            }
        }
    }
}

struct FoodCategoryListView_Previews: PreviewProvider {
    
    @State static var selectedFoodCategories: Set<String> = []
    
    static var previews: some View {
        FoodCategoryListView(selectedFoodCategories: $selectedFoodCategories,
                             categories: [])
    }
}
