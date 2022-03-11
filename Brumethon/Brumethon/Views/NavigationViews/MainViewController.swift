//
//  MainViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit
import CoreLocation
import iCarousel

class MainViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    
    var locationManager : CLLocationManager!
    var problemsArray : [Problem] = []
    {
        didSet {
            itemsNumber = problemsArray.count
        }
    }
    var itemsNumber: Int = 0
    
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
        getUsersInfos()

        
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
        self.myCarousel.delegate   = self
        self.myCarousel.frame      = CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let service = ProblemService(query : ProblemQuery())
        service.query { result in
            switch result {
            case .success(let problems):
                DispatchQueue.main.async {
                    self.problemsArray = problems
                    
                    self.myCarousel.reloadData()
                }
                
            case .failure(let error):
                    print(error.localizedDescription)
                
            }
        }
    }
    
    @IBAction func handleHelp(_ sender: Any) {
        let vc = ModalViewController()
        vc.userLocation = self.locationManager.location
        
        self.present(vc, animated: true)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        print(self.problemsArray.count)
        return self.problemsArray.count
    }
    
    @objc func handleConfirmButton() {
        self.navigationController?.present(TicketDetailsViewController(), animated: true)
       
    }
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let view = CarouselView(frame: CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height))
        
      
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.handleConfirmButton))

        view.addGestureRecognizer(gesture)
        
        
        let info = problemsArray[index]
        view.messageTextPicker.text = info.description
        
        
        //let userInfo : =
        
        
        return view
    }
    
    func getUsersInfos(){
        let userinfosservice = UserInfosService(query: UserInfosQuery(email:                     UserDefaults.standard.string(forKey: "email") ?? ""))
        
        userinfosservice.query { result in
            switch result {
                case .success(let result):
                User.shared.infos?.mail = result.email
                User.shared.infos?.firstName = result.firstName
                User.shared.infos?.lastName = result.lastName
                User.shared.infos?.address.street = result.address
                User.shared.infos?.roles = result.roles
                User.shared.infos?.phoneNumber = result.phoneNumber
                
                case .failure(let error):
                    print(error)
                    //self.toggleError(withMessage: error.localizedDescription)
                }
        }
    }
                                                                   
    
}


func askUserAuthorizationToLocate(locationManager : CLLocationManager) {
    locationManager.requestWhenInUseAuthorization()
}
