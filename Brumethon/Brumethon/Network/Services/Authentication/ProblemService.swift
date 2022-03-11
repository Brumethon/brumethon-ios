//
//  ProblemService.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 11/03/2022.
//

final class ProblemService: Service<ProblemQuery, [Problem]> {
    override init(query: ProblemQuery) {
        super.init(query: query)
    }
    
    override func query(completion: @escaping (Result<[Problem], ServiceError>) -> Void) {
        super.query(completion: completion)
    }
}

