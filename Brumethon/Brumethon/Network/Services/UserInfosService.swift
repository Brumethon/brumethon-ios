//
//  UserInfosService.swift
//  Brumethon
//
//  Created by Gwendal on 11/03/2022.
//

import Alamofire

final class UserInfosService: Service<UserInfosQuery, UserInfosResponse> {
    override init(query: UserInfosQuery) {
        super.init(query: query)
    }
    
    override func query(completion: @escaping (Result<UserInfosResponse, ServiceError>) -> Void) {
        super.query(completion: completion)
    }
}
