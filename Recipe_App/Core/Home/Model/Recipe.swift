//
//  Recipe.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import Foundation

struct  RecipeRes: Decodable{
    let recipes: [Recipe]
}


struct Recipe: Decodable, Identifiable, Encodable {
    let cuisine: String
    let name: String
    let id: String
    let largePhoto: String
    let smallPhoto: String
    let sourceUrl: String?
    let youtubeUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case id = "uuid"
        case largePhoto = "photo_url_large"
        case smallPhoto = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
        
    }
}
