//
//  Scooter.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation

struct Scooter: Decodable, Equatable {
    let id: Int
    let model: String
    let dateOfPurchase: String
}
