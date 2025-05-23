//
//  RecipeService.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import Foundation


protocol RecipeServiceProtocol {
    func fetchRecipes() async throws -> [Recipe]
}

class RecipeService: RecipeServiceProtocol {
    private let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: urlString ) else {
            throw RecipeAPIError.requestFailed(description: "Invalid URL")
        }
        
        let cacheKey = url.absoluteString
        
        if let cachedRecipes = RecipeCache.shared.get(cacheKey) {
            print("fetched from cache")
            return cachedRecipes
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(RecipeRes.self, from: data)
            print("DEBUG: data fetched from api")
//            print("DEBUG: recipes \(decoded.recipes)")
            RecipeCache.shared.set(decoded.recipes, for: cacheKey)
            return decoded.recipes
        }catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
       

    }
}
