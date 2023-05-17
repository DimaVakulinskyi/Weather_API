//
//  Weather_APIApp.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 17.05.2023.
//

import SwiftUI
import CoreLocation

@main
struct Weather_APIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Request location permission on app launch
        CLLocationManager().requestWhenInUseAuthorization()
        return true
    }
}
