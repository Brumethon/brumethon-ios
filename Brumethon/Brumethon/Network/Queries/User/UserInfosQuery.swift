//
//  UserQuery.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Alamofire

final class UserInfosQuery: Query {
    struct QueryParameters: Encodable {
        
    }
    
    var endpoint: String = "url here"
    var headers: HTTPHeaders? {
        [HTTPHeader(name: "authorization", value: User.shared.token ?? "")]
    }
}
