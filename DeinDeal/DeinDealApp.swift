//
//  DeinDealApp.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import SwiftUI

@main
struct DeinDealApp: App {
    
    // SwiftUI AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
