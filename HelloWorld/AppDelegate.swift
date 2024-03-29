//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by egamiyuji on 2021/01/09.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var firstRun: Bool?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        firstRunCheck()
        
//        print("Location Manager start...")
//        LocationManager.shared.startUpdating()
//        LocationManager.shared.configureLocationManager()
//        LocationManager.shared.startUpdating()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    private func firstRunCheck() {
        
        firstRun = userDefaults.bool(forKey: kFIRSTRUN)
        if firstRun! { return }
        
        let status = Status.allCases.map { $0.rawValue }
        userDefaults.set(status, forKey: kSTATUS)
        userDefaults.set(true, forKey: kFIRSTRUN)
        
        // キャッシュを保存
        userDefaults.synchronize()
        
    }


}

