//
//  BagButton.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 11/09/2022.
//

import SwiftUI

struct BagButton: View {
    var body: some View {
        Button {
            // do nothing
        } label: {
            Image(systemName: "bag.fill")
                .imageScale(.large)
        }
        .disabled(true)
    }
}

struct BagButton_Previews: PreviewProvider {
    static var previews: some View {
        BagButton()
    }
}
