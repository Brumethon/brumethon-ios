//
//  HomeViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 09/03/2022.
//

import UIKit
import CoreLocation
import MapKit

class HomeViewController: UIViewController {

    var locationManager : CLLocationManager!
    let tabBarIcons = ["house","person"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Ask user's authorization to locate him
        
        //Define views that'll be in the tabBar
        
        let homeVC      = MainViewController()
        let profileVC   = ProfileViewController()
        
        super.viewDidLoad()
        
        homeVC.title    = languageUtil.getTranslatedText(translationString: "home")
        profileVC.title = languageUtil.getTranslatedText(translationString: "profile")
        
        let tabBarController = UITabBarController()
        
        //Set list of controllers in the tab bar
        tabBarController.setViewControllers([
            homeVC,
            profileVC
        ], animated: false)
        
        let items = tabBarController.tabBar.items
        
        
        for index in 0...1 {
            items![index].image = UIImage(systemName: self.tabBarIcons[index])
        }
        
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.modalPresentationStyle = .fullScreen
        
        present(tabBarController,animated:true)
        
    }

}



