//
//  ArtworkDataResponse.swift
//  Artworks
//
//  Created by Arun on 24/08/24.
//

import Foundation

struct ArtworkResponse: Decodable {
    let data: [ArtworkItemResponse]
}

struct ArtworkItemResponse: Decodable {
    let id: Int
    let title: String
    let imageId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageId = "image_id"
    }
}

extension ArtworkItemResponse {
    
    func convertToDomain() -> ArtworkItem {
        
        let imageUrlString =  "https://www.artic.edu/iiif/2/\(imageId)/full/843,/0/default.jpg"

        return ArtworkItem(id: id, title: title, imageUrlString: imageUrlString)
    }
}
