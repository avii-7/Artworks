//
//  ArtworkViewModel.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation
import Combine

class ArtworkViewModel: ObservableObject {
    
    @Published private(set) var artworks = [ArtworkItem]()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let repository: ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func fetchArtworks() {
        
        repository.getArtworks()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] response in
                self?.artworks = response
            }.store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
