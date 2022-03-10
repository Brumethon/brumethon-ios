//
//  Query.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Alamofire

protocol Query {
    associatedtype QueryParameters: Encodable
    
    var endpoint: String { get set }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: QueryParameters? { get }
}

extension Query {
    var url: String { "url://" + endpoint }
    var method: HTTPMethod { .get }
    var headers: HTTPHeaders? { nil }
    var parameters: QueryParameters? { nil }
}
