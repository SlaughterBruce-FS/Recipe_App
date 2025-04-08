//
//  RecipeViewModelTest.swift
//  Recipe_AppTests
//
//  Created by jade  on 4/8/25.
//

import XCTest
@testable import Recipe_App

class RecipeViewModelTest: XCTestCase {
    
    func testSuccessfulRecipeFetch() async {
        let viewModel = RecipeViewModel()
        
        await viewModel.fetchRecipes()
        
        XCTAssertTrue(viewModel.recipes.count > 0)
        XCTAssertEqual(viewModel.recipes.count, 61)
    }
    
    func testSuccessfulRecipeWithInvalidJson() async {
        let viewModel = RecipeViewModel()
        
        await viewModel.fetchRecipes()
        
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
    
}
