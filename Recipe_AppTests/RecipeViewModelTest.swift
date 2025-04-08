//
//  RecipeViewModelTest.swift
//  Recipe_AppTests
//
//  Created by jade  on 4/8/25.
//

import XCTest
@testable import Recipe_App

class RecipeViewModelTest: XCTestCase {
    
    func testInit(){
        let service = MockRecipeService()
        let viewModel = RecipeViewModel(service: service)
        
        XCTAssertNotNil(viewModel, "the view model should not be nil")
    }
    
    func testSuccessfulRecipeFetch() async {
        let service = MockRecipeService()
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchRecipes()
        
        XCTAssertTrue(viewModel.recipes.count > 0)
        XCTAssertEqual(viewModel.recipes.count, 63)
    }
    
    func testSuccessfulRecipeWithInvalidJson() async {
        let service = MockRecipeService()
        service.mockData = malformedData
        
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchRecipes()
        
        XCTAssertTrue(viewModel.recipes.isEmpty)

    }
    
    func testSuccessfulRecipeWithInvalidJsonAPI() async {
        let service = MockRecipeService()
        service.apiURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
        
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchRecipes()
        
        XCTAssertTrue(viewModel.recipes.isEmpty)

    }
    
    func testSuccessfulRecipeWithEmptyData() async {
        let service = MockRecipeService()
        service.apiURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
        
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchRecipes()
        
        XCTAssertTrue(viewModel.recipes.isEmpty)

    }
    
    
}
