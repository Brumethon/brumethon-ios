//
//  SignUpInformationViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit

class SignUpInformationViewController: UIViewController, UITextFieldDelegate {

    //Textfields[]
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var scooterIdTextField: UITextField!
    
    //Buttons[]
    @IBOutlet weak var accExistingButton: UIButton!
    @IBOutlet weak var nextStepButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set placeholders
        self.firstNameTextField.placeholder = languageUtil.getTranslatedText(translationString: "firstname")
        self.lastNameTextField.placeholder  = languageUtil.getTranslatedText(translationString: "lastname")
        self.phoneTextField.placeholder     = languageUtil.getTranslatedText(translationString: "phone_number")
//        self.mailTextField.placeholder      = languageUtil.getTranslatedText(translationString: "email")
//        self.passwordTextField.placeholder  = languageUtil.getTranslatedText(translationString: "password")
        self.scooterIdTextField.placeholder = languageUtil.getTranslatedText(translationString: "scooter_id")
        
        //Set buttons title
        self.accExistingButton.setTitle(languageUtil.getTranslatedText(translationString: "sign_up.already_have_acc"), for: .normal)
        self.nextStepButton.setTitle(String(format: languageUtil.getTranslatedText(translationString: "sign_up.next_step"), "1/3"), for: .normal)
        
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.phoneTextField.delegate = self
        self.scooterIdTextField.delegate = self
        self.firstNameTextField.tag = 0
        self.lastNameTextField.tag = 1
        self.phoneTextField.tag = 2
        self.scooterIdTextField.tag = 3

        if firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty || phoneTextField.text!.isEmpty || scooterIdTextField.text!.isEmpty {
                nextStepButton.isEnabled = false
            }
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleHaveExisting(_ sender: Any) {
        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @IBAction func handleNextStepButton(_ sender: Any) {
        if firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty || phoneTextField.text!.isEmpty || scooterIdTextField.text!.isEmpty  {
            let errorDialog = UIAlertController(title: "", message: languageUtil.getTranslatedText(translationString: "error.missing_field"), preferredStyle: .alert)
            self.present(errorDialog, animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.dismiss(animated: true, completion: nil)
            }

        } else {
            self.navigationController?.pushViewController(SignUpAddressViewController(), animated: true)
        }
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if !text.isEmpty{
            nextStepButton.isEnabled = true
        } else {
            nextStepButton.isEnabled = false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // Try to find next responder
       if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
          nextField.becomeFirstResponder()
       } else {
          // Not found, so remove keyboard.
          textField.resignFirstResponder()
       }
       // Do not add a line break
       return false
    }
    
}
