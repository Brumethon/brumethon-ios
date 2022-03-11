//
//  SignUpCategoriesAndLocationViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit

class SignUpAddressViewController: UIViewController, UITextFieldDelegate {
    
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var scooterId: String?
    var addressNumber: String?
    var street: String?
    var zipCode: String?
    var city: String?
    
    @IBOutlet weak var addressHeader: UILabel!
    
    @IBOutlet weak var addressNumberTextField: UITextField!
    @IBOutlet weak var streetNameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    @IBOutlet weak var nextStepButton: UIButton!
    
    @IBAction func handleNextStep(_ sender: Any) {
        if addressNumberTextField.text!.isEmpty || streetNameTextField.text!.isEmpty || cityTextField.text!.isEmpty || zipCodeTextField.text!.isEmpty  {
            let errorDialog = UIAlertController(title: "", message: languageUtil.getTranslatedText(translationString: "error.missing_field"), preferredStyle: .alert)
            self.present(errorDialog, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            let vc = SignUpLoginInfosViewController()
            vc.firstName = firstName ?? ""
            vc.lastName = lastName ?? ""
            vc.phoneNumber = phoneNumber ?? ""
            vc.scooterId = scooterId ?? ""
            vc.addressNumber = addressNumberTextField.text
            vc.street = streetNameTextField.text
            vc.zipCode = zipCodeTextField.text
            vc.city = cityTextField.text
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.isHidden = true
        
        self.addressNumberTextField.delegate = self
        self.streetNameTextField.delegate = self
        self.cityTextField.delegate = self
        self.zipCodeTextField.delegate = self
        self.addressNumberTextField.tag = 0
        self.streetNameTextField.tag = 1
        self.zipCodeTextField.tag = 2
        self.cityTextField.tag = 3
        
        if addressNumberTextField.text!.isEmpty || streetNameTextField.text!.isEmpty || cityTextField.text!.isEmpty || zipCodeTextField.text!.isEmpty {
                nextStepButton.isEnabled = false
            }
        
        //Set header text
        self.addressHeader.text = languageUtil.getTranslatedText(translationString: "address")
        
        //Set placeholders
        self.addressNumberTextField.placeholder = languageUtil.getTranslatedText(translationString: "number")
        self.streetNameTextField.placeholder = languageUtil.getTranslatedText(translationString: "street_name")
        self.cityTextField.placeholder = languageUtil.getTranslatedText(translationString: "city")
        self.zipCodeTextField.placeholder = languageUtil.getTranslatedText(translationString: "zip_code")
        
        self.nextStepButton.setTitle(String(format: languageUtil.getTranslatedText(translationString: "sign_up.next_step"), "2/3"), for: .normal)
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
