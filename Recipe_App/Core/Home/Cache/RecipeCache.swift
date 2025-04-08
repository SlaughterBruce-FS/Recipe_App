//
//  RecipeCache.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import Foundation

struct RecipeCache {
    static let shared = RecipeCache()
    
    private let cache = NSCache<NSString, NSData>()
    
    private init(){}
    
    func set(_ recipes: [Recipe], for key: String) {
        guard let data = try? JSONEncoder().encode(recipes) else { return}
        cache.setObject(data as NSData, forKey: key as NSString)
    }
    
    func get(_ key: String) -> [Recipe]? {
        guard let data = cache.object(forKey: key as NSString) as? Data else { return nil}
        return try? JSONDecoder().decode([Recipe].self, from: data)
    }
}
