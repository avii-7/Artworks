//
//  ArtworkRepositoryService.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation
import Combine

class ArtworkRepositoryService: ArtworkRepository {
    
    private let remoteService: ArtworkRemote
    
    init(remoteService: ArtworkRemote) {
        self.remoteService = remoteService
    }
    
    func getArtworks() -> AnyPublisher<[ArtworkItem], RepositoryError> {
        remoteService.getArtworks()
            .map({ $0.data.map { $0.convertToDomain() } })
            .mapError {
                RepositoryError.remoteError(description: $0.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
