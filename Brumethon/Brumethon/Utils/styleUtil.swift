//
//  styleUtil.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import Foundation
import UIKit

class styleUtil {
    class func setLeftPadding(paddingValue : Double, input : UITextField){
        let leftPadding     = UIView(frame : CGRect(x: 0, y: 0, width: paddingValue, height: input.frame.size.height))
        input.leftView      = leftPadding
        input.leftViewMode  = .always
    }
    
    class func setRightPadding(paddingValue : Double, input : UITextField){
        let rightPadding    = UIView(frame : CGRect(x: 0, y: 0, width: paddingValue, height: input.frame.size.height))
        input.rightView     = rightPadding
        input.rightViewMode = .always
    }
}
