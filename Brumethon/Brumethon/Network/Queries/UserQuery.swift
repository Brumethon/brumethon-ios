//
//  UserQuery.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

import Alamofire

final class UserQuery: Query {
    struct QueryParameters: Encodable {
        let email: String
        let lastname: String
        let firstname: String
        let address: String
        let phoneNumber: String
    }
    
    var endpoint: String = "/users"
    var method: HTTPMethod = .get
    var headers: HTTPHeaders?
}
