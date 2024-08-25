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
        
        let urlString = "https://api.artic.edu/api/v1/artworks"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: RemoteError.badUrl).eraseToAnyPublisher()
        }
        
        let urlRequest = URLRequest(url: url)
        return remoteUtility.hit(with: urlRequest)
    }
}
