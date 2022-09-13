//
//  TitleView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            TitleTextView(text: "Dein")
            
            VStack(alignment: .leading, spacing: -20) {
                TitleTextView(text: "Deal", color: .gray)
                
                TitleTextView(text: "Restaurant")
            }
            
        }
        // reduce font size evenly for all TitleTextView for smaller screan
        .minimumScaleFactor(0.5)
        .padding(.top, 0)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
