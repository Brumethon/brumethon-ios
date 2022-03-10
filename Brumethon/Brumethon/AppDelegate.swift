//
//  AppDelegate.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 09/03/2022.
//

import UIKit
import DropDown

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds) //Taille window == taille écran
        window.rootViewController = UINavigationController(rootViewController : ModalViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        DropDown.startListeningToKeyboard()
    }

}

