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
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager = CLLocationManager()
        
        askUserAuthorizationToLocate(locationManager: self.locationManager)
        
        self.askHelpButton.setTitle(languageUtil.getTranslatedText(translationString: "main.ask_for_help"), for: .normal)
        
        containerView.addSubview(myCarousel)
        
        self.myCarousel.dataSource = self
        self.myCarousel.frame      = CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        
    }
    
    @IBAction func handleHelp(_ sender: Any) {
        self.present(ModalViewController(), animated: true)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.containerView.frame.width, height: self.containerView.frame.height))
        
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .white
        
        
        return view
    }
                                                                   
    
}


func askUserAuthorizationToLocate(locationManager : CLLocationManager) {
    locationManager.requestWhenInUseAuthorization()
}
