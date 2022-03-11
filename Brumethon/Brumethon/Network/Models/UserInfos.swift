//
//  Brumethon.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation
import UIKit

struct UserInfos: Encodable, Decodable, Equatable {
    var id: Int
    var mail: String
    var password: String
    var firstName: String
    var lastName: String
    var registerDate: Date
    var phoneNumber: String
    var address: Address
    var roles: [String]
}

