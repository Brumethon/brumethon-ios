//
//  Problem.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation

struct Problem: Encodable,Decodable, Equatable {
    let id: Int
    let scooter: Scooter
    let category: Category
    let status: Status
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double

}
