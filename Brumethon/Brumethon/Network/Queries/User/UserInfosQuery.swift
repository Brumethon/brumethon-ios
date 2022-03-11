//
//  UserQuery.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Alamofire

struct UserInfosResponse: Decodable, Encodable, Equatable {
    var email: String
    var firstname: String
    var lastname: String
    var address: String
    var roles: [String]
    var phoneNumber: String
}


final class UserInfosQuery: Query {
    struct QueryParameters: Encodable {
    }
    
    var parameters: QueryParameters?
    var email: String
    var endpoint: String
    var headers: HTTPHeaders? {
        [HTTPHeader(name: "uuid", value: User.shared.token ?? "")]
    }
    
    init(email : String){
        self.email = email
        self.endpoint = "/users/\(email)"
    }
}
