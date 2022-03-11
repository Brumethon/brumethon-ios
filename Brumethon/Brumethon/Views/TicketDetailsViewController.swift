//
//  TicketDetailsViewController.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import UIKit

class TicketDetailsViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var numberStreetLabel: UILabel!
    @IBOutlet weak var zipCodeCityLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var closeTicketButton: UIButton!
    @IBAction func handleCloseTicket(_ sender: Any) {
        let actionSheet = UIAlertController(title: "", message: languageUtil.getTranslatedText(translationString: "ticket.close_confirmation"), preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: languageUtil.getTranslatedText(translationString: "action.cancel"), style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: languageUtil.getTranslatedText(translationString: "action.close"), style: .destructive, handler: {_ in
            print("cloturer ticket")
        }))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBAction func handleSendMessage(_ sender: Any) {
        guard let messageAppURL = URL(string: "sms:0652110215")
        else { return }
        if UIApplication.shared.canOpenURL(messageAppURL) {
            UIApplication.shared.open(messageAppURL)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = "\(User.shared.infos?.firstName ?? "Prénom") \(User.shared.infos?.lastName ?? "Nom")"
        numberStreetLabel.text = "\(User.shared.infos?.address.number ?? "14") \(User.shared.infos?.address.street ?? "rue des Boulet")"
        zipCodeCityLabel.text = "\(User.shared.infos?.address.postalCode ?? "75012") \(User.shared.infos?.address.city ?? "Paris")"
        descriptionTextView.text = "Ceci est un grave problemeCeci est un grave problemeCeci est un grave problemeCeci est un grave problemeCeci est un grave problemeCeci est un grave probleme Ceci est un grave probleme Ceci est un grave probleme "
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
