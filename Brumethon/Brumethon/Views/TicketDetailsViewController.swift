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
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var declineButton: UIButton!
    
    var problem: Problem?
    
    @IBAction func handleAccept(_ sender: Any) {
        acceptButton.isHidden = true
        declineButton.isHidden = true
        closeTicketButton.isHidden = false
        sendMessageButton.isHidden = false
    }
    @IBAction func handleDecline(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var closeTicketButton: UIButton!
    @IBAction func handleCloseTicket(_ sender: Any) {
        let actionSheet = UIAlertController(title: "", message: languageUtil.getTranslatedText(translationString: "ticket.close_confirmation"), preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: languageUtil.getTranslatedText(translationString: "action.cancel"), style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: languageUtil.getTranslatedText(translationString: "action.close"), style: .destructive, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBAction func handleSendMessage(_ sender: Any) {
        guard let messageAppURL = URL(string: "sms:\(problem?.owner.phoneNumber ?? "0606060606")")
        else { return }
        if UIApplication.shared.canOpenURL(messageAppURL) {
            UIApplication.shared.open(messageAppURL)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeTicketButton.isHidden = true
        sendMessageButton.isHidden = true
        closeTicketButton.setTitle(languageUtil.getTranslatedText(translationString: "action.close_ticket"), for: .normal)
        sendMessageButton.setTitle(languageUtil.getTranslatedText(translationString: "action.send_message"), for: .normal)
        acceptButton.setTitle(languageUtil.getTranslatedText(translationString: "action.accept"), for: .normal)
        declineButton.setTitle(languageUtil.getTranslatedText(translationString: "action.decline"), for: .normal)
        
        userNameLabel.text = "\(problem?.owner.firstname ?? "Prénom") \(problem?.owner.lastname ?? "Nom")"
        numberStreetLabel.text = "\(problem?.owner.firstname ?? "Prénom") \(problem?.owner.lastname ?? "Nom")"

        numberStreetLabel.text = "\(problem?.owner.address ?? "14 rue de toto 75012 Paris")"
       
        descriptionTextView.text = problem?.description
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
