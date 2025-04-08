//
//  MockRecipeService.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import Foundation


class MockRecipeService: RecipeServiceProtocol{
    
    var mockData: Data?
    var apiURL: URL?
    
    
    func fetchRecipes() async throws -> [Recipe] {
        if let url = apiURL {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(RecipeRes.self, from: data)
            return decoded.recipes
        } else {
            let recipes = try JSONDecoder().decode(RecipeRes.self, from: mockData ?? testData)
            return recipes.recipes
        }
      
    
    }
    
   
    
    
}
