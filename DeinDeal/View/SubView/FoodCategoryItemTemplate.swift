//
//  FoodCategoryItemTemplate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

struct FoodCategoryItemTemplate: View {
    
    @Binding var selectedFoodCategories: Set<String>
    var category: FoodFacetCategories
    
    private var isSelected: Bool {
        selectedFoodCategories.contains(category.id)
    }
    
    var body: some View {
        Button {
            // basic animation on click
            // animates button style (everything depending on 'isSelected'
            // as well as the list filtering 
            withAnimation {
                onTapCategory()
            }
        } label: {
            VStack(spacing: 0) {
                // TODO: try to use cache
                
                // SVG icon (not supported by native SwiftUI component)
                WebImage(
                    url: URL(string: category.icon),
                    options: .progressiveLoad,
                    context: [
                        // generated thumbnail image size, aspect ratio is respected
                        .imageThumbnailPixelSize: CGSize(width: 50, height: 50),
                        // SVG coder
                        .imageCoder: SDImageSVGCoder.shared,
                        // store it in memory because it will, most likely, be displayed multiple times
                        .storeCacheType: SDImageCacheType.memory.rawValue
                    ]
                )
                
                .resizable()
                .placeholder {
                    // placeholder while image is loading
                    Rectangle()
                        .foregroundColor(.gray)
                }
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
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
        // SDWebImage common problem :
        // https://github.com/SDWebImage/SDWebImageSwiftUI
        // I didn't get the issue but it's safer to set the style here
        .buttonStyle(.plain)
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
