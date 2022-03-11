//
//  CategoriesService.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

final class CategoriesService: Service<GetCategoriesQuery, [Category]> {
    override init(query: GetCategoriesQuery) {
        super.init(query: query)
    }
    
    override func query(completion: @escaping (Result<[Category], ServiceError>) -> Void) {
        super.query(completion: completion)
    }
}
