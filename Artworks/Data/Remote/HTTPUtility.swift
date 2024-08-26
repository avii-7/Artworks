//
//  HTTPUtility.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation
import Combine

enum RemoteError: Error {
    case badUrl
    case invalidStatusCode
    case decodingError
    case other(Error)
}

class HTTPUtility {
    
    private let decoder = JSONDecoder()
    
    private init() { }
    
    static let shared = HTTPUtility()
    
    func hit<T: Decodable>(with request: RemoteRequest, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, RemoteError> {
        
        guard let request = try? prepareUrlRequest(from: request) else {
            return Fail(error: RemoteError.badUrl).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard
                    let httpResponse = response as? HTTPURLResponse,
                    200...299 ~= httpResponse.statusCode
                else { throw RemoteError.invalidStatusCode}
                
                return data
            }
            .decode(type: T.self, decoder: self.decoder)
            .mapError({ error in
                debugPrint(error)
                switch error {
                case let apiError as RemoteError:
                    return apiError
                default:
                    return .other(error)
                }
            })
            .eraseToAnyPublisher()
    }
    
    func prepareUrlRequest(from request: RemoteRequest) throws -> URLRequest? {
        let stringBaseUrl = request.baseUrl
        
        guard var url = URL(string: stringBaseUrl) else { return nil }
        url.append(path: request.path, directoryHint: .notDirectory)
        
        if let queryItems = request.queryItems {
            url.append(queryItems: queryItems)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        if let body = request.body {
            urlRequest.httpBody = try JSONEncoder().encode(body)
        }
        
        return urlRequest
    }
}

/**
 References:
 1. https://stackoverflow.com/questions/75687418/cannot-convert-return-expression-of-type-anypublishert-any-error-in-combine
 */
