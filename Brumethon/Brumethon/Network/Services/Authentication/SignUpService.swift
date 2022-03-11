//
//  SignUpService.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

struct EmptyResult: Decodable {
    
}

final class SignUpService: Service<SignUpQuery, EmptyResult> {
    override init(query: SignUpQuery) {
        super.init(query: query)
    }
    
    override func query(completion: @escaping (Result<EmptyResult, ServiceError>) -> Void) {
        super.query(completion: completion)
    }
}
