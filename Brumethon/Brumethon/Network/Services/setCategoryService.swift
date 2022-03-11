//
//  setCategoryService.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 11/03/2022.
//

import Foundation


final class setCategoriesService: Service<SetCategoriesQuery, EmptyResult> {
    override init(query: SetCategoriesQuery) {
        super.init(query: query)
    }
    
    override func query(completion: @escaping (Result<EmptyResult, ServiceError>) -> Void) {
        super.query(completion: completion)
    }
}
