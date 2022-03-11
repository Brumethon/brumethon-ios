//
//  Brumethon.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation
import Alamofire

class Service<Q: Query, CleanedOutput>: ObservableObject where CleanedOutput: Decodable {
    private var query: Q
    private(set) var isLoading = false
    private(set) var shouldConvertParametersToSnakeCase = true
    
    init(query: Q) {
        self.query = query
    }
    
    internal func query(completion: @escaping (Result<CleanedOutput, ServiceError>) -> Void) {
        NetworkLogger.log(url: query.url, method: query.method, status: .loading)
        
        isLoading.toggle()
        
        let encoder = JSONEncoder()
//        if shouldConvertParametersToSnakeCase {
//            encoder.keyEncodingStrategy = .convertToSnakeCase
//        }
//
        AF.request(query.url,
                   method: query.method,
                   parameters: query.parameters,
                   encoder: JSONParameterEncoder(encoder: encoder),
                   headers: query.headers)
            .validate()
            .responseData { response in
                self.isLoading.toggle()

                switch response.result {
                case .success(let data):

                    guard let cleanedData = self.decode(from: data) else {
                        NetworkLogger.log(url: self.query.url, method: self.query.method, status: .failure(.other))
                        return completion(.failure(.other))
                    }
                    
                    NetworkLogger.log(url: self.query.url, method: self.query.method, status: .success)
                    
                    return completion(.success(cleanedData))
                case .failure(let error):
                    print("toto \(error)")
                    NetworkLogger.log(url: self.query.url, method: self.query.method, status: .failure(ServiceError(fromCode: error.responseCode)))
                    
                    return completion(.failure(ServiceError(fromCode: error.responseCode)))
                }
            }
    }
    
    internal func decode(from data: Data) -> CleanedOutput? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601withFractionalSeconds)

        guard let result = try? decoder.decode(CleanedOutput.self, from: data) else {
            return nil
        }

        return result
    }
    
    internal func setCamelCaseEncoding() {
        shouldConvertParametersToSnakeCase = false
    }
}

extension DateFormatter {
    static var iso8601withFractionalSeconds: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter
    }
}
