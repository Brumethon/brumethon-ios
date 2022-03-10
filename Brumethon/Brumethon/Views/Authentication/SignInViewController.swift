//
//  SignInViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 09/03/2022.
//

import UIKit

class SignInViewController: UIViewController {

    //Textfields[]
    @IBOutlet weak var loginTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    //Buttons[]
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set right placeholders on textfields
        self.loginTextfield.placeholder = languageUtil.getTranslatedText(translationString: "email")
        self.passwordTextfield.placeholder = languageUtil.getTranslatedText(translationString: "password")
        
        self.loginTextfield.delegate    = self
        self.passwordTextfield.delegate = self
        
        styleUtil.setLeftPadding(paddingValue: 5, input: self.loginTextfield)
        styleUtil.setLeftPadding(paddingValue: 5, input: self.passwordTextfield)
        
        
        //Set right title on button
        self.signInButton.setTitle(languageUtil.getTranslatedText(translationString: "sign_in.sign_in"), for: .normal)
    }
    
    @IBAction func handleSignIn(_ sender: Any) {
        //Set actions here when button is clicked
        let loginValue      = self.loginTextfield.text ?? ""
        let passwordValue   = self.passwordTextfield.text ?? ""
        
        guard loginValue.count > 0 else {
            
            let errorAlert = UIAlertController(title : languageUtil.getTranslatedText(translationString: "error") ,message : languageUtil.getTranslatedText(translationString: "error.username_count"), preferredStyle: .alert)
            
            self.present(errorAlert,animated: true) {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false){ (_) in
                    errorAlert.dismiss(animated: true)
                }
            }
            
            return
        }
        
        guard passwordValue.count > 0 else {
            let errorAlert = UIAlertController(title : languageUtil.getTranslatedText(translationString: "error") ,message : languageUtil.getTranslatedText(translationString: "error.password_count"), preferredStyle: .alert)
            
            self.present(errorAlert,animated: true) {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false){ (_) in
                    errorAlert.dismiss(animated: true)
                }
            }
            
            return
        }
        
        //At last if every tests passed
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
}

extension SignInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == self.loginTextfield {
            self.passwordTextfield.becomeFirstResponder()
        } else if textField == self.passwordTextfield {
            self.handleSignIn(self.signInButton!)
        }
        
        return true
    }
}
