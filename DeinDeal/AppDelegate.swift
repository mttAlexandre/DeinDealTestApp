//
//  DDRAppDelegate.swift
//  DeinDeal
//
//  Created by Alexandre MONTCUIT on 09/09/2022.
//

import Foundation
import UIKit
import SDWebImageSwiftUI
import SDWebImageSVGCoder

/*
 App delegate for SwiftUI life cycle app :
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app
 */
final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Add SVG support
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
        return true
    }
}
