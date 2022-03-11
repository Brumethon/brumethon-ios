//
//  ProblemQuery.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Alamofire

final class ProblemQuery: Query {
    struct QueryParameters: Encodable {}
    
    var endpoint: String = "/problems"
    var method: HTTPMethod = .get
    var headers: HTTPHeaders? {
        [HTTPHeader(name: "authorization", value: User.shared.token ?? "")]
    }
}
