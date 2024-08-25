//
//  ArtworkFactory.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation

struct ArtworkFactory {
    
    static func getViewModel() -> ArtworkViewModel {
        let remoteService = ArtworkRemoteService()
        let repository = ArtworkRepositoryService(remoteService: remoteService)
        let viewModel = ArtworkViewModel(repository: repository)
        return viewModel
    }
    
}
