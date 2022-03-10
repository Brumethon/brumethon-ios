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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager = CLLocationManager()
        
        
        
        askUserAuthorizationToLocate(locationManager: self.locationManager)
        
        self.askHelpButton.setTitle(languageUtil.getTranslatedText(translationString: "main.ask_for_help"), for: .normal)
        
    }
    
    @IBAction func handleHelp(_ sender: Any) {
        self.present(ModalViewController(), animated: true)
    }
                                                                   
    @objc
    func handleProfile(){
        print("test")
    }
    
}

func askUserAuthorizationToLocate(locationManager : CLLocationManager) {
    locationManager.requestWhenInUseAuthorization()
}


