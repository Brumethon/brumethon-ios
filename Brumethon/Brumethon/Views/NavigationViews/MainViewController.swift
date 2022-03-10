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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager = CLLocationManager()
        askUserAuthorizationToLocate(locationManager: self.locationManager)
    }


}

func askUserAuthorizationToLocate(locationManager : CLLocationManager) {
    locationManager.requestWhenInUseAuthorization()
}
