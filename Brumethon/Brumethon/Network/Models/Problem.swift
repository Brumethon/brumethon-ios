//
//  Problem.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation

struct Problem: Decodable, Equatable {
    let id: Int
    let date: Date
    let scooter: Scooter
    let category: String
    let status: String
    let name: String
    let description: String
    let latitude: String
    let longitude: String

}
