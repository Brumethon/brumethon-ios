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
    
    @IBOutlet weak var noAccountButton: UIButton!
    
    @IBAction func handleNoAccount(_ sender: Any) {
        
        self.navigationController?.pushViewController(SignUpInformationViewController(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        //Set right placeholders on textfields
        self.loginTextfield.placeholder = languageUtil.getTranslatedText(translationString: "email")
        self.passwordTextfield.placeholder = languageUtil.getTranslatedText(translationString: "password")
        self.noAccountButton.setTitle(languageUtil.getTranslatedText(translationString: "sign_in.no_account"), for: .normal)
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
        
        signIn(email: loginValue, password: passwordValue)
    }
    
    func signIn(email : String, password : String){
        let parameters = SignInQuery.QueryParameters(email: email, password: password)
        let signInService = SignInService(query: SignInQuery(parameters: parameters))
        
        signInService.query { result in
            switch result {
                        case .success(let result):
                        print(result)
                        User.shared.token = result.token
                    UserDefaults.standard.setValue(email, forKey: "email")
                            self.navigationController?.pushViewController(MainViewController(), animated: true)
                        case .failure(let error):
                            print(error)
                            //self.toggleError(withMessage: error.localizedDescription)
                        }
        }
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
