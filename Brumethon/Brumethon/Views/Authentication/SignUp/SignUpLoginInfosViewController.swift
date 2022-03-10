//
//  SignUpLoginInfosViewController.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import UIKit

class SignUpLoginInfosViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signInInfosLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBAction func handleCreateAccount(_ sender: Any) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            let errorDialog = UIAlertController(title: "", message: languageUtil.getTranslatedText(translationString: "error.missing_field"), preferredStyle: .alert)
            self.present(errorDialog, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self

        self.emailTextField.tag = 0
        self.passwordTextField.tag = 1

        self.passwordTextField.isSecureTextEntry = true
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
                createAccountButton.isEnabled = false
            }
        
    
        self.signInInfosLabel.text = languageUtil.getTranslatedText(translationString: "sign_in.sign_in_infos")
        self.emailTextField.placeholder = languageUtil.getTranslatedText(translationString: "email")
        self.passwordTextField.placeholder = languageUtil.getTranslatedText(translationString: "password")
        
        self.createAccountButton.setTitle(languageUtil.getTranslatedText(translationString: "sign_up.create_account"), for: .normal)
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if !text.isEmpty{
            createAccountButton.isEnabled = true
        } else {
            createAccountButton.isEnabled = false
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
