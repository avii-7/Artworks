//
//  ArtworkItem.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation

struct ArtworkItem: Identifiable {
    let id: Int
    let title: String
    let imageUrlString: String?
}

extension ArtworkItem {
    
    static func getEmpty() -> ArtworkItem {
        ArtworkItem(id: 1234, title: "The bay of Marseille", imageUrlString: nil)
    }
}
