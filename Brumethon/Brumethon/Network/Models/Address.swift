//
//  Address.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation

struct Address: Decodable, Equatable {
    let id: Int
    let city: String
    let street: String
    let number: String
    let country: String
    let postalCode: String
    let lagitude: Double
    let longitude: Double
}
