//
//  Scooter.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation

struct Scooter: Encodable,Decodable, Equatable {
    let id: Int
    let scooterModelID: Int
    let serialNumber: String
}
