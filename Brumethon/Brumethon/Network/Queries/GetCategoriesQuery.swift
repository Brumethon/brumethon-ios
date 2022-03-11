//
//  GetCategoriesQuery.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

import Alamofire

final class GetCategoriesQuery: Query {
    struct QueryParameters: Encodable {
    }
    
    var endpoint: String = "/categories"
    var method: HTTPMethod = .get
    var headers: HTTPHeaders?
}
