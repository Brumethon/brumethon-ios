//
//  NetworkLogger.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation
import Alamofire

enum NetworkLoggerStatus {
    case loading
    case success
    case failure(ServiceError)
    
    var description: String {
        switch self {
        case .loading:
            return "⏳ LOADING"
        case .success:
            return "✅ SUCCESS"
        case .failure(let error):
            return "🚫 FAILURE (\(error.description))"
        }
    }
}

struct NetworkLogger {
    static func log(url: String, method: HTTPMethod, status: NetworkLoggerStatus) {
        print("\(Date()) 🌐 SERVICE | \(status.description) | [\(method.rawValue)] \(url)")
    }
}
