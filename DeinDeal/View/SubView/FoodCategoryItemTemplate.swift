//
//  FoodCategoryItemTemplate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct FoodCategoryItemTemplate: View {
    
    @Binding var selectedFoodCategories: Set<String>
    var category: FoodFacetCategories
    
    private var isSelected: Bool {
        selectedFoodCategories.contains(category.id)
    }
    
    var body: some View {
        // TODO: handle selection style
        VStack {
            Text(category.label)
                .fontWeight(isSelected ? .bold : .light)
                .foregroundColor(isSelected ? redColor : .primary)
            
            // TODO: load svg image
            Image(systemName: "xmark")
        }
        .onTapGesture {
            onTapCategory()
        }
    }
    
    private func onTapCategory() {
        let categoryID = category.id
        
        if selectedFoodCategories.contains(categoryID) {
            selectedFoodCategories.remove(categoryID)
        } else {
            selectedFoodCategories.insert(categoryID)
        }
    }
}

struct FoodCategoryItemTemplate_Previews: PreviewProvider {
    
    @State static var selectedFoodCategories: Set<String> = []
    
    static var previews: some View {
        FoodCategoryItemTemplate(
            selectedFoodCategories: $selectedFoodCategories,
            category: FoodFacetCategories(
                id: "fd_pizza",
                label: "Pizza",
                icon: "https://galaxy.deindeal.ch/api/img?p=next/themes/fd_pizza.svg&v=1600854483",
                count: 1
            )
        )
    }
}
