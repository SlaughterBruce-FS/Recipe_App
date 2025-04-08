//
//  RecipeViewModel.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import Foundation

class RecipeViewModel: ObservableObject {

    @Published var recipes = [Recipe]()
    
    @Published var errorMessage: String?
    
    private let service: RecipeService
    
    init(service: RecipeService) {
        self.service = service
        Task { await fetchRecipes() }
    }
    
    @MainActor
    func fetchRecipes() async {
        do{
            self.recipes = try await service.fetchRecipes()
        } catch {
            guard let error = error as? RecipeAPIError else { return }
            self.errorMessage = error.customDescription
        }
    }
    
    func createCusines(from recipes: [Recipe]) -> [String: [Recipe]] {
        return Dictionary(grouping: recipes) { $0.cuisine}
    }
    
    
    var cuisineTitles: [String] {
           Array(Set(recipes.map { $0.cuisine })).sorted()
       }
    
}
