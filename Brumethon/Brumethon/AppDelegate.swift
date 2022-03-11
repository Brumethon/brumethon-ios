//
//  AppDelegate.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 09/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds) //Taille window == taille écran
        window.rootViewController = UINavigationController(rootViewController : UserDefaults.standard.string(forKey: "token") != nil ? SignUpChooseCategoriesViewController() : SignUpInformationViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        
        
        return true
    }
}

