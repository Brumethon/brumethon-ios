//
//  SignUpChooseCategoriesViewController.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import UIKit
import TagListView

class SignUpChooseCategoriesViewController: UIViewController, TagListViewDelegate {
    
    let primaryColor = UIColor(named: "Primary Color")

    @IBOutlet weak var chooseCategoriesTitle: UILabel!
    
    
    @IBOutlet weak var categoriesListView: TagListView!
    
    @IBOutlet weak var setCategoriesButton: UIButton!
    
    @IBAction func handleSetCategories(_ sender: Any) {
        var selectedCategories: [String] = []
        for tagView in categoriesListView.tagViews {
            if tagView.tagBackgroundColor == primaryColor {
                selectedCategories.append(tagView.currentTitle!)
            }
        }
        print(selectedCategories)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.categoriesListView.delegate = self
        
        self.chooseCategoriesTitle.text = languageUtil.getTranslatedText(translationString: "sign_up.what_can_you_do")
        
        self.setCategoriesButton.setTitle(languageUtil.getTranslatedText(translationString: "sign_up.lets_go"), for: .normal)
        categoriesListView.addTags(["Toto", "Tata", "Tutu", "Toto", "Tata", "Tutu", "Toto", "Tata", "Tutu", "Toto", "Tata", "Tutu" ])
        categoriesListView.textFont = UIFont.systemFont(ofSize: 22)

        for tagView in categoriesListView.tagViews {
            tagView.cornerRadius = 20
            tagView.paddingX = 15
            tagView.paddingY = 10
            
            tagView.tagBackgroundColor = .clear
            tagView.borderWidth = 1
            tagView.borderColor = primaryColor!
            tagView.textColor = primaryColor!
        }
       
    }

        func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
            if tagView.tagBackgroundColor == primaryColor {
                tagView.tagBackgroundColor = .clear
                tagView.borderWidth = 1
                tagView.borderColor = primaryColor
                tagView.textColor = primaryColor!
            } else {
                tagView.tagBackgroundColor = primaryColor!
                tagView.borderColor = .clear
                tagView.textColor = .white
            }
        }




}