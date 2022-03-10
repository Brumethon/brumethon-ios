//
//  languageUtill.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 10/03/2022.
//

import Foundation

class languageUtil {
    class func getTranslatedText(translationString : String) -> String {
        return NSLocalizedString(translationString, comment: "")
    }
}
