//
//  FoodCategoryItemTemplate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodCategoryItemTemplate: View {
    
    @Binding var selectedFoodCategories: Set<String>
    var category: FoodFacetCategories
    
    private var isSelected: Bool {
        selectedFoodCategories.contains(category.id)
    }
    
    var body: some View {
        // TODO: animation on selection
        Button {
            onTapCategory()
        } label: {
            VStack(spacing: 0) {
                // SVG icon
                WebImage(
                    url: URL(string: category.icon)!,
                    context: [
                        // default SVG pixel size
                        .imageThumbnailPixelSize: CGSize(width: 50, height: 50)
                    ]
                )
                .resizable()
                // real image frame
                .frame(width: 50, height: 50)
                .padding(5)
                .background {
                    redColor
                        .opacity(isSelected ? 1 : 0)
                        .clipShape(Circle())
                }
                
                Text(category.label)
                    .fontWeight(isSelected ? .bold : .light)
                    .foregroundColor(isSelected ? redColor : .primary)
            }
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
