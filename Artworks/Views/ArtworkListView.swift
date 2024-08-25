//
//  ArtworkListView.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import SwiftUI

struct ArtworkListView: View {
    
    @StateObject private var viewModel = ArtworkFactory.getViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.artworks) { artwork in
                    NavigationLink(destination: ArtworkItemView(artworkItem: artwork)) {
                        Text(artwork.title)
                    }
                }
            }
            .onAppear(perform: {
                viewModel.fetchArtworks()
            })
            .navigationTitle("Artworks")
        }
    }
}

#Preview {
    ArtworkListView()
}
