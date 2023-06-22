//
//  Breed.swift
//  TheCatApp2
//
//  Created by Kevin Hernandez on 22/06/23.
//

import Foundation

struct Breed: Identifiable, Codable {
    let id, name, origin: String
    let intelligence: Int
    let referenceImageId: String?
    let image: BreedImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case origin
        case intelligence
        case image
        case referenceImageId = "reference_image_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        origin = try values.decode(String.self, forKey: .origin)
        referenceImageId = try values.decodeIfPresent(String.self, forKey: .referenceImageId)
        
        intelligence = try values.decode(Int.self, forKey: .intelligence)
        
        
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
        
    }
}
