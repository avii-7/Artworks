//
//  ArtworkRemoteService.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation
import Combine

class ArtworkRemoteService: ArtworkRemote {
    
    private let remoteUtility: HTTPUtility
    
    init(remoteUtility: HTTPUtility = HTTPUtility.shared) {
        self.remoteUtility = remoteUtility
    }
    
    func getArtworks() -> AnyPublisher<ArtworkResponse, RemoteError> {
        let urlRequest = ArtworkRemoteRequest.artworks
        return remoteUtility.hit(with: urlRequest)
    }
}
