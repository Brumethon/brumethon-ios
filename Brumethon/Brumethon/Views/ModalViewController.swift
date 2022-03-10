//
//  ModalViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit
import DropDown

class ModalViewController: UIViewController {

    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var positionSegmentControl: UISegmentedControl!
    @IBOutlet weak var askHelpButton: UIButton!
        
    //Init dropdown
    let categoriesDropDown = DropDown()
    
    lazy var dropDowns: [DropDown] = {
            return [
                self.categoriesDropDown
            ]
        }()
    
    let positionsOptions : [String] = [
        languageUtil.getTranslatedText(translationString: "home_address"),
        languageUtil.getTranslatedText(translationString: "modal.current_pos")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Stylish that shitty button (a lil bit)
        self.categoriesButton.layer.cornerRadius = 10
        self.categoriesButton.setTitle(languageUtil.getTranslatedText(translationString: "categories"), for: .normal)
        
        customizeDropDown()
        setupCategoriesDropDown()
        
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
    
    
    //-------------------- CONCERNING DROP DOWN --------------------//
    
    @IBAction func handleCategories(_ sender: Any) {
        categoriesDropDown.show()
    }
   
    func setupCategoriesDropDown(){
        categoriesDropDown.anchorView = categoriesButton
        
        //Display the list under the button
        categoriesDropDown.bottomOffset = CGPoint(x: 0, y: categoriesButton.bounds.height + 5)
        
        categoriesDropDown.dataSource = [
            "Carosserie",
            "Mécanique",
            "Questions"
        ]
        
        categoriesDropDown.selectionAction = { [weak self] (index, item) in
                    self?.categoriesButton.setTitle(item, for: .normal)
                }
        
        categoriesDropDown.multiSelectionAction = { [weak self] (indices, items) in
            if items.isEmpty {
                self?.categoriesButton.setTitle(languageUtil.getTranslatedText(translationString: "categories"), for: .normal)
            }
        }
    }
    
    func customizeDropDown() {
        
            let appearance = DropDown.appearance()
            
            appearance.cellHeight = 60
            appearance.backgroundColor = UIColor(white: 1, alpha: 1)
            appearance.selectionBackgroundColor = UIColor(red: 0.6494, green: 0.8155, blue: 1.0, alpha: 0.2)
            appearance.separatorColor = UIColor(white: 0.7, alpha: 0.8)
            appearance.cornerRadius = 10
            appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
            appearance.shadowOpacity = 0.9
            appearance.shadowRadius = 25
            appearance.animationduration = 0.25
            appearance.textColor = .darkGray
            
    }
    
    //-------------------- CONCERNING BUTTON --------------------//
    
    @IBAction func handleAskHelp(_ sender: Any) {
        
    }
    
    
}

