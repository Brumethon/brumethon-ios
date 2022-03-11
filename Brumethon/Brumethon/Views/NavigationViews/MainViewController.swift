//
//  MainViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    var locationManager : CLLocationManager!
    
    //Buttons[]
    @IBOutlet weak var askHelpButton: UIButton!
    
    @objc func openProfile() {
        self.navigationController?.present(ProfileViewController(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let profileIcon = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(openProfile)
        )
        self.navigationItem.leftBarButtonItem = profileIcon
        
        self.locationManager = CLLocationManager()
        
        
        
        askUserAuthorizationToLocate(locationManager: self.locationManager)
        
        
        self.askHelpButton.setTitle(languageUtil.getTranslatedText(translationString: "main.ask_for_help"), for: .normal)
        
    }
    
    @IBAction func handleHelp(_ sender: Any) {
        let vc = ModalViewController()
        vc.userLocation = self.locationManager.location
        
        self.present(vc, animated: true)
    }
                                                                   
    @objc
    func handleProfile(){
        print("test")
    }
    
}

func askUserAuthorizationToLocate(locationManager : CLLocationManager) {
    locationManager.requestWhenInUseAuthorization()
}


