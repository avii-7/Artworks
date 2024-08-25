//
//  ArtworkItemView.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import SwiftUI

struct ArtworkItemView: View {
    
    private let artworkItem: ArtworkItem
    
    init(artworkItem: ArtworkItem) {
        self.artworkItem = artworkItem
    }
    
    var body: some View {
        VStack (spacing: 24) {
            AsyncImage(url: URL(string: artworkItem.imageUrlString ?? "")) {
                image in
                image.resizable()
                .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Text(artworkItem.title)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArtworkItemView(artworkItem: ArtworkItem.getEmpty())
}
