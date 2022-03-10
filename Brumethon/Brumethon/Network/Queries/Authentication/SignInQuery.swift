//
//  SignIn.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Alamofire

final class SignInQuery: Query {
    struct QueryParameters: Encodable {
        let email: String
        let password: String
    }
    
    var endpoint: String = "url here"
    var method: HTTPMethod = .post
    var headers: HTTPHeaders?
    var parameters: QueryParameters?
    
    init(parameters: QueryParameters) {
        self.parameters = parameters
    }
}
