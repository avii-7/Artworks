//
//  ArtworkRemote.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation
import Combine

protocol ArtworkRemote {
    func getArtworks() -> AnyPublisher<ArtworkResponse, RemoteError>
}
