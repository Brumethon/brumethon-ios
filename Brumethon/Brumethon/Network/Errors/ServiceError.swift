//
//  ServiceError.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

enum ServiceError: Error {
    case badrequest
    case unauthorized
    case forbidden
    case notFound
    case other
    
    init(fromCode code: Int?) {
        switch code {
        case 400:
            self = .badrequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        default:
            self = .other
        }
    }
    
    var description: String {
        switch self {
        case .badrequest:
            return "BAD REQUEST"
        case .unauthorized:
            return "UNAUTHORIZED"
        case .forbidden:
            return "FORBIDDEN"
        case .notFound:
            return "NOT FOUND"
        case .other:
            return "OTHER"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Forbidden"
        default:
            return "Other"
        }
    }
}
