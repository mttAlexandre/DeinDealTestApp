//
//  TitleTextView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 08/09/2022.
//

import SwiftUI

struct TitleTextView: View {
    
    var text: String
    var color: Color = .red
    
    var body: some View {
        Text(text)
            .font(.system(size: 60, weight: .light, design: .rounded))
            .foregroundColor(color)
    }
}

struct TitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextView(text: "Dein")
    }
}
