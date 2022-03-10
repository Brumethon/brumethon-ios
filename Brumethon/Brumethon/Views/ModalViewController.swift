//
//  ModalViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var positionSegmentControl: UISegmentedControl!
    @IBOutlet weak var askHelpButton: UIButton!
        
    
    let positionsOptions : [String] = [
        languageUtil.getTranslatedText(translationString: "home_address"),
        languageUtil.getTranslatedText(translationString: "modal.current_pos")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Stylish that text view
        self.descriptionTextView.layer.cornerRadius = 10
        self.descriptionTextView.text = languageUtil.getTranslatedText(translationString: "modal.describe")
        
        //Styling button
        self.askHelpButton.setTitle(languageUtil.getTranslatedText(translationString: "main.ask_for_help"), for: .normal)
        
        //Segmented control
        for index in 0...positionsOptions.count - 1 {
            self.positionSegmentControl.setTitle(positionsOptions[index], forSegmentAt: index)
        }
       
    }
    
    //-------------------- CONCERNING BUTTON --------------------//
    
    @IBAction func handleAskHelp(_ sender: Any) {
        
    }
    
    
}

