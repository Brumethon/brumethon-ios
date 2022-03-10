//
//  SignUpCategoriesAndLocationViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit

class SignUpCategoriesAndLocationViewController: UIViewController {
    
    @IBOutlet weak var addressHeader: UILabel!
    
    @IBOutlet weak var addressNumber: UITextField!
    @IBOutlet weak var streetNameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set header text
        self.addressHeader.text = languageUtil.getTranslatedText(translationString: "address") + " : "
        
        //Set placeholders
        self.addressNumber.placeholder = languageUtil.getTranslatedText(translationString: "number")
        self.streetNameTextField.placeholder = languageUtil.getTranslatedText(translationString: "street_name")
        self.cityTextField.placeholder = languageUtil.getTranslatedText(translationString: "city")
        self.zipCodeTextField.placeholder = languageUtil.getTranslatedText(translationString: "zip_code")
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
