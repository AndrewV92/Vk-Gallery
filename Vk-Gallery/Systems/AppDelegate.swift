//
//  AppDelegate.swift
//  Vk-Gallery
//
//  Created by Андрей Воробьев on 25.03.2022.
//

import UIKit
import SwiftyVK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vkDelegate: SwiftyVKDelegate?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        vkDelegate = VKDelegate()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    //MARK: - VK Source
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let app = options[.sourceApplication] as? String
        VK.handle(url: url, sourceApplication: app)
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?,
        annotation: Any) -> Bool {
        VK.handle(url: url, sourceApplication: sourceApplication)
        return true
    }


}

