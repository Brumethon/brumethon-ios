//
//  Brumethon.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation
import UIKit

struct UserInfos: Decodable, Equatable {
    let id: Int
    let mail: String
    let password: String
    let firstName: String
    let lastName: String
    let registerDate: Date
    let address: Address
    let roles: [String]
}

