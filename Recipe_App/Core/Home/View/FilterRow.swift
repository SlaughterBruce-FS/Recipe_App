//
//  FilterRow.swift
//  Recipe_App
//
//  Created by jade  on 4/8/25.
//

import SwiftUI

struct FilterRow: View {
    let viewModel: RecipeViewModel
    @Binding var selectedCusine: String?
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(viewModel.cuisineTitles, id: \.self) { title in
                    
                    Button{
                        print("buttom tapped")
                        selectedCusine = (selectedCusine == title) ? nil : title
                        
                        
                    }
                    label: {
                        Text(title)
                    }
                    .font(.caption)
                      .padding(10)
                      .foregroundStyle(selectedCusine == title ? Color.white : Color.green)
                      .background {
                          selectedCusine == title ? Color.green : Color.white
                      }
                      .overlay(
                          Capsule().stroke(Color.green, lineWidth: 1)
                      )
                      .clipShape(Capsule())

                }
            }
            .padding()
            
        }
    }
}

//#Preview {
//    FilterRow(viewModel: RecipeViewModel(service: <#RecipeService#>), selectedCusine: .constant("american"))
//}
