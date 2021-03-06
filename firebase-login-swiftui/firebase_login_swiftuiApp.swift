//
//  firebase_login_swiftuiApp.swift
//  firebase-login-swiftui
//
//  Created by Ana Carolina de Sousa Ferreira on 18/04/21.
//

import SwiftUI
import Firebase

@main
struct firebase_login_swiftuiApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate : AppDelegate
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
