//
//  FinalProjectSneakerStoreApp.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 31.01.2025.
//

import SwiftUI
import Firebase

@main
struct FinalProjectSneakerStoreApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CustomAlert()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
