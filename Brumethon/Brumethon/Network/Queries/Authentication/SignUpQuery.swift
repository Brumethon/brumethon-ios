//
//  SignUpQuery.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

import Alamofire

final class SignUpQuery: Query {
    struct QueryParameters: Encodable {
        let email: String
        let lastname: String
        let firstname: String
        let password: String
        let phoneNumber: String
        let address: Address
    }
    
    var endpoint: String = "/users"
    var method: HTTPMethod = .post
    var headers: HTTPHeaders?
    var parameters: QueryParameters?
    
    init(parameters: QueryParameters) {
        self.parameters = parameters
    }
}
