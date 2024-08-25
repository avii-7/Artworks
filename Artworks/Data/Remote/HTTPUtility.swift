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

    func hit<T: Decodable>(with request: URLRequest, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, RemoteError> {
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
}

/**
 References:
 1. https://stackoverflow.com/questions/75687418/cannot-convert-return-expression-of-type-anypublishert-any-error-in-combine
 */
