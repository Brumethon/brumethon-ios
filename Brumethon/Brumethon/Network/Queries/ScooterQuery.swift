//
//  ScooterQuery.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

import Alamofire

final class ScooterQuery: Query {
    struct QueryParameters: Encodable {
        let scooterModelID: Int
        let serialNumber: String
    }
    
    var endpoint: String = "/scooters"
    var method: HTTPMethod = .get
    var headers: HTTPHeaders?
}
