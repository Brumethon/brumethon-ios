//
//  ModalViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit
import DropDown
import TagListView
import CoreLocation

class ModalViewController: UIViewController, TagListViewDelegate {
    private let primaryColor = UIColor(named: "Primary Color")
    private var lagitudeToSend: Double? = User.shared.infos?.address.lagitude ?? 0
    private var longitudeToSend: Double? = User.shared.infos?.address.longitude ?? 0
    private var selectedCategory: String?

    var userLocation: CLLocation?
    
    @IBOutlet weak var categoriesListView: TagListView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var positionSegmentControl: UISegmentedControl!
    @IBOutlet weak var askHelpButton: UIButton!
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        switch positionSegmentControl.selectedSegmentIndex
          {
          case 0:
            lagitudeToSend = User.shared.infos?.address.lagitude
            longitudeToSend = User.shared.infos?.address.longitude
          case 1:
            lagitudeToSend = userLocation?.coordinate.latitude
            longitudeToSend = userLocation?.coordinate.longitude
          default:
              break
          }
        print(selectedCategory)
    }
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
        
        self.categoriesListView.delegate = self
        
        categoriesListView.addTags(["Toto", "Tata", "Tutu", "Toto", "Tata", "Tutu", "Toto", "Tata", "Tutu", "Toto", "Tata", "Tutu" ])
        categoriesListView.textFont = UIFont.systemFont(ofSize: 16)

        for tagView in categoriesListView.tagViews {
            tagView.cornerRadius = 20
            tagView.paddingX = 15
            tagView.paddingY = 10
            
            tagView.tagBackgroundColor = .clear
            tagView.borderWidth = 0.5
            tagView.borderColor = primaryColor!
            tagView.textColor = primaryColor!
        }
       
    }

        func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
            for tag in sender.tagViews {
                if tag.tagBackgroundColor == primaryColor {
                    tag.tagBackgroundColor = .clear
                    tag.borderWidth = 0.5
                    tag.borderColor = primaryColor
                    tag.textColor = primaryColor!
                }
            }
            
            tagView.tagBackgroundColor = primaryColor!
            tagView.borderColor = .clear
            tagView.textColor = .white
            
            selectedCategory = tagView.currentTitle
    
        }
    

    
    //-------------------- CONCERNING BUTTON --------------------//
    
    @IBAction func handleAskHelp(_ sender: Any) {
        
    }
    
    
}

