//
//  HomeCellView.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import SwiftUI

struct HomeCellView: View {
    private let imageDemension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    let recipe: Recipe
    var body: some View {
        VStack{
            VStack{
                ImageView(url: recipe.smallPhoto)
                    .aspectRatio( contentMode: .fit)
            }
            .padding()
            
            
            
            
            VStack(alignment: .center){
                
                Text(recipe.name)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.green)
                
               
               
                    Text(recipe.cuisine)
                        .font(.footnote)
                
            }
            .padding(.bottom)
            .padding(.horizontal)
           
        }
       
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color(.black))
              .opacity(0)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 3)
        
    }
}

#Preview {
    HomeCellView(recipe: Recipe(cuisine: "American", name: "Key Lime Pie", id: "303ce395-af37-4cff-87b4-09c75a4e07ed", largePhoto: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/d23ad009-8f17-428f-a41f-5f3b5bc51883/large.jpg", smallPhoto: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/d23ad009-8f17-428f-a41f-5f3b5bc51883/small.jpg", sourceUrl: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/d23ad009-8f17-428f-a41f-5f3b5bc51883/small.jpg", youtubeUrl: "https://www.youtube.com/watch?v=q4Rz7tUkX9A"))
}
