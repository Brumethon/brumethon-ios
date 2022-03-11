//
//  Address.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation

struct Address: Encodable, Decodable, Equatable {
    var id: Int
    var city: String
    var street: String
    var number: String
    var country: String
    var postalCode: String
    var lagitude: Double
    var longitude: Double
}
