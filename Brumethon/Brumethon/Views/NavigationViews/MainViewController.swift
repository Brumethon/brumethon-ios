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
        self.navigationController?.navigationBar.isHidden = false

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
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let view = CarouselView(frame: CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height))
        
        
        let problem = problemsArray[index]
        let userInfo : UserInfosResponse = problem.owner
        
      
        let tapGesture = CustomTapGestureRecognizer(target: self, action: #selector(goToDetailsView(sender:)))
        
        tapGesture.problem = problem
        
        print(problem)
              
        self.view.addGestureRecognizer(tapGesture)
        
        
        view.messageTextPicker.text = problem.description
        view.userNameLabel.text     = userInfo.firstname + " " + userInfo.lastname
        view.addressLabel.text      = userInfo.address
        
        
        return view
    }
    
    @objc
    func goToDetailsView(sender: CustomTapGestureRecognizer) {
        let vc = TicketDetailsViewController()
        vc.problem = sender.problem
        self.navigationController?.present(vc, animated: true)
       
    }
    
    func getUsersInfos(){
        let userinfosservice = UserInfosService(query: UserInfosQuery(email:                     UserDefaults.standard.string(forKey: "email") ?? ""))
        
        userinfosservice.query { result in
            switch result {
                case .success(let result):
                
                User.shared.infos?.mail = result.email
                User.shared.infos?.firstName = result.firstname
                User.shared.infos?.lastName = result.lastname
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

class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var problem: Problem?
}
