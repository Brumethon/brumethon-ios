//
//  SignUpInformationViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit

class SignUpInformationViewController: UIViewController {

    //Textfields[]
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var scooterIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Buttons[]
    @IBOutlet weak var accExistingButton: UIButton!
    @IBOutlet weak var nextStepButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set placeholders
        self.firstNameTextField.placeholder = languageUtil.getTranslatedText(translationString: "firstname")
        self.lastNameTextField.placeholder  = languageUtil.getTranslatedText(translationString: "lastname")
        self.phoneTextField.placeholder     = languageUtil.getTranslatedText(translationString: "phone_number")
        self.mailTextField.placeholder      = languageUtil.getTranslatedText(translationString: "email")
        self.passwordTextField.placeholder  = languageUtil.getTranslatedText(translationString: "password")
        self.scooterIdTextField.placeholder = languageUtil.getTranslatedText(translationString: "scooter_id")
        
        //Set buttons title
        self.accExistingButton.setTitle(languageUtil.getTranslatedText(translationString: "sign_up.already_have_acc"), for: .normal)
        self.nextStepButton.setTitle(languageUtil.getTranslatedText(translationString: "sign_up.next_step"), for: .normal)
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleHaveExisting(_ sender: Any) {
        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @IBAction func handleNextStepButton(_ sender: Any) {
        self.navigationController?.pushViewController(SignUpCategoriesAndLocationViewController(), animated: true)
    }
    
}
