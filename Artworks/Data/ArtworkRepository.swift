//
//  ArtworkRepository.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation
import Combine

enum RepositoryError: Error {
    case remoteError(description: String)
}

protocol ArtworkRepository {
    func getArtworks() -> AnyPublisher<[ArtworkItem], RepositoryError>
}
