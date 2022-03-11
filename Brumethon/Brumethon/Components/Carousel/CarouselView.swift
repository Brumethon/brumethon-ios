//
//  CarouselView.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 11/03/2022.
//

import UIKit

class CarouselView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var messageTextPicker: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var refuseButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("CarouselView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        //Stylish the view
        layer.cornerRadius = 10
        layer.borderColor  = UIColor(named: "Primary Color")?.cgColor
        layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        //Content view
        contentView.layer.cornerRadius = 10
        
        //Message
        self.messageTextPicker.backgroundColor = UIColor(white: 1, alpha: 0)
        
        //Buttons
        self.confirmButton.setTitle("", for: .normal)
        self.confirmButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        
        
        self.refuseButton.setTitle("", for: .normal)
        self.refuseButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
    }

}
