//
//  ContentView.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import SwiftUI

struct ContentView: View {
    private let service: RecipeServiceProtocol
    @StateObject var viewModel: RecipeViewModel
    
    init(service: RecipeServiceProtocol) {
        self.service = service
        self._viewModel = StateObject(wrappedValue: RecipeViewModel(service: service))
    }
    
    @State private var searchText = ""
    @State private var selectedCusine: String? = nil
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 20),
        .init(.flexible(), spacing: 20),
    ]
    
    var filterRecipes: [Recipe] {
      
        return viewModel.recipes.filter {recipe in
            let matchesSearch = searchText.isEmpty || recipe.name.localizedCaseInsensitiveContains(searchText)
              let matchesCuisine = selectedCusine == nil || recipe.cuisine == selectedCusine
              return matchesSearch && matchesCuisine
        }
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.recipes.isEmpty {
                Text("No recipes found")
            } else {
                // bring in filter row
                FilterRow(viewModel: viewModel, selectedCusine: $selectedCusine)
                //start cards for recipe
                ScrollView {
                    LazyVGrid(columns: gridItems) {
                        if filterRecipes.isEmpty {
                            Text("No recipes found..")
                        }
                        ForEach(filterRecipes) { recipe in
                            HomeCellView(recipe: recipe)
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search recipes")
                }
                .refreshable {
                    searchText = ""
                    selectedCusine =  nil
                }
                .padding(.horizontal)
            }
              
        }
     
    }
}

#Preview {
    ContentView(service: RecipeService())
}
