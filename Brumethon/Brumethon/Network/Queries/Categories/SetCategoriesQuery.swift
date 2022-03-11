//
//  SetCategoriesQuery.swift
//  Brumethon
//
//  Created by Nicolas TRAN on 11/03/2022.
//

import Alamofire

final class SetCategoriesQuery: Query {
    struct QueryParameters: Encodable {
        let list : [Int]
    }
    
    var email : String
    var endpoint: String
    var method: HTTPMethod = .post
    var parameters: QueryParameters?
    var headers: HTTPHeaders? {
        [HTTPHeader(name: "uuid", value: User.shared.token ?? "")]
    }
    
    init(parameters : QueryParameters, email : String){
        print(parameters)
        self.parameters = parameters
        self.email = email
        self.endpoint = "/users/" + email + "/categories"
    }
}
