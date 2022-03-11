//
//  ProblemQuery.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Alamofire
import Foundation

final class CreateProblemQuery: Query {
    struct QueryParameters: Encodable {
        let name: String
        let description: String
        let scooterId: Int
        let latitude: Double
        let longitude: Double
        let categoryId: Int
        let problemStatusId: Int
    }
    
    var parameters: QueryParameters?
    var endpoint: String = "/problems"
    var method: HTTPMethod = .post
    var headers: HTTPHeaders? {
        [HTTPHeader(name: "uuid", value: User.shared.token ?? "")]
    }
    
    init(parameters: QueryParameters) {
        self.parameters = parameters
    }
}
