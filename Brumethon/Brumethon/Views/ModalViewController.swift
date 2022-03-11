//
//  ModalViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit
import TagListView
import CoreLocation

class ModalViewController: UIViewController, TagListViewDelegate, UITextViewDelegate {
    private let primaryColor = UIColor(named: "Primary Color")
    private var lagitudeToSend: Double? = User.shared.infos?.address.lagitude ?? 0
    private var longitudeToSend: Double? = User.shared.infos?.address.longitude ?? 0
    private var selectedCategory: Category?
    private var categories: [Category] = []
    
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
    }
    let positionsOptions : [String] = [
        languageUtil.getTranslatedText(translationString: "home_address"),
        languageUtil.getTranslatedText(translationString: "modal.current_pos")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCategories()
        
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
        self.descriptionTextView.delegate = self

       
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
            
            selectedCategory = categories.first(where: {$0.name == tagView.currentTitle!})
    
        }
    

    
    func setTagStyle() {
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
    
    
    func getCategories() {
        let service = CategoriesService(query: GetCategoriesQuery())
        
        service.query { result in
            switch result {
            case .success(let categories):
                for category in categories {
                    self.categories = categories
                    self.categoriesListView.addTag(category.name)
                    self.setTagStyle()
                }
            case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    //-------------------- CONCERNING BUTTON --------------------//
    
    @IBAction func handleAskHelp(_ sender: Any) {
        createProblem()
    }
    
    
    
    func createProblem() {
        let parameters = CreateProblemQuery.QueryParameters(name: selectedCategory?.name ?? "", description: descriptionTextView.text, scooterId: 1, latitude: lagitudeToSend ?? 0, longitude: longitudeToSend ?? 0, categoryId: selectedCategory?.id ?? 1, problemStatusId: 1)
        let createProblemService = CreateProblemService(query: CreateProblemQuery(parameters: parameters))
        
        createProblemService.query { result in
            //self.toggleLoading()
            print(result)
            switch result {
            case .success(_):
                self.dismiss(animated: true, completion: nil)
            case .failure(let error):
                self.dismiss(animated: true, completion: nil)
                print(error)
                //self.toggleError(withMessage: error.localizedDescription)
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

