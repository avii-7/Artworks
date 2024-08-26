//
//  ArtworkRemoteRequest.swift
//  Artworks
//
//  Created by Arun on 26/08/24.
//

import Foundation

enum ArtworkRemoteRequest {
    case artworks
}

extension ArtworkRemoteRequest : RemoteRequest {
    var path: String {
        switch self {
        case .artworks:
            return "api/v1/artworks"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .artworks:
                .get
        }
    }
}
