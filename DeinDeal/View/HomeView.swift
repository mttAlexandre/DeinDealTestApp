//
//  HomeView.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            NavigationView {
                CityListTabView()
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Label("DeinDeal", systemImage: "text.magnifyingglass")
            }
            
            OrderTabView()
                .tabItem {
                    Label("Order", systemImage: "d.circle.fill")
                }
            
            AccountTabView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
        .accentColor(redColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
