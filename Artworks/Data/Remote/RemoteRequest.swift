//
//  RemoteRequest.swift
//  Artworks
//
//  Created by Arun on 26/08/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol RemoteRequest {
    
    var baseUrl: String { get }
    
    var path: String { get }
    
    var httpMethod: HTTPMethod { get }
    
    var queryItems: [URLQueryItem]? { get }
    
    var body: Encodable? { get }
    
    var headers: [String: String]? { get }
}

extension RemoteRequest {
    
    var baseUrl: String {
        "https://api.artic.edu"
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var body: Encodable? {
        nil
    }
}
