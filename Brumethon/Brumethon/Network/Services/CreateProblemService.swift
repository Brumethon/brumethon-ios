//
//  CreateProblemService.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

final class CreateProblemService: Service<CreateProblemQuery, EmptyResult> {
    override init(query: CreateProblemQuery) {
        super.init(query: query)
    }
    
    override func query(completion: @escaping (Result<EmptyResult, ServiceError>) -> Void) {
        super.query(completion: completion)
    }
}
