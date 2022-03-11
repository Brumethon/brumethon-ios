//
//  MainViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit
import CoreLocation
import iCarousel

class MainViewController: UIViewController, iCarouselDataSource {
    
    var locationManager : CLLocationManager!
    
    @IBOutlet weak var containerView: UIView!
    
    //Buttons[]
    @IBOutlet weak var askHelpButton: UIButton!
    
    @objc func openProfile() {
        self.navigationController?.present(ProfileViewController(), animated: true, completion: nil)
    }
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()
    

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
        
        containerView.addSubview(myCarousel)
        
        self.myCarousel.dataSource = self
        self.myCarousel.frame      = CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        
    }
    
    @IBAction func handleHelp(_ sender: Any) {
        let vc = ModalViewController()
        vc.userLocation = self.locationManager.location
        
        self.present(vc, animated: true)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    @objc func handleConfirmButton(index: Int) {
        print(index)
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let view = CarouselView(frame: CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height))
        view.confirmButton.addTarget(self, action: #selector(handleConfirmButton(index:)), for: .touchUpInside)
        
        return view
    }
                                                                   
    
}


func askUserAuthorizationToLocate(locationManager : CLLocationManager) {
    locationManager.requestWhenInUseAuthorization()
}
