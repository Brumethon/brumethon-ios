//
//  SignInService.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 11/03/2022.
//

import Foundation

struct SignInResult : Decodable {
    var token: String
}

final class SignInService: Service<SignInQuery, SignInResult> {    
    override init(query: SignInQuery) {
        super.init(query: query)
    }
    
    override func query(completion: @escaping (Result<SignInResult, ServiceError>) -> Void) {
        super.query(completion: completion)
    }
}
