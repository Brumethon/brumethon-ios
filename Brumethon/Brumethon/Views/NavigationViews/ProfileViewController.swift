//
//  ProfileViewController.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import UIKit
import TagListView

class ProfileViewController: UIViewController {

    @IBOutlet weak var categoriesListView: TagListView!
    
    let primaryColor = UIColor(named: "Primary Color")

    override func viewDidLoad() {
        super.viewDidLoad()

        categoriesListView.addTags(["Moteur", "Roues", "Jantes"])
        categoriesListView.textFont = UIFont.systemFont(ofSize: 18)

        for tagView in categoriesListView.tagViews {
            tagView.cornerRadius = 20
            tagView.paddingX = 15
            tagView.paddingY = 10
            
            tagView.tagBackgroundColor = primaryColor!
            tagView.textColor = .white
        }
        


    }
    
//    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
//        print(title)
//        if tagView.tagBackgroundColor == primaryColor {
//            tagView.tagBackgroundColor = .clear
//            tagView.borderWidth = 1
//            tagView.borderColor = primaryColor
//        } else {
//            tagView.tagBackgroundColor = primaryColor!
//            tagView.borderColor = .clear
//        }
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
