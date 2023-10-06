//
//  RecipeCell.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import SwiftUI

import Kingfisher

struct RecipeCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            VStack {
                Text(recipe.label)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.leading, 20)
            
            Spacer()
            
            KFImage(URL(string: recipe.image)!)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
        }
        .background(.white)
        .cornerRadius(5)
    }
}

struct RecipeCell_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let recipe = Recipe(
            label: "Chicken Vesuvio",
            image: "https://picsum.photos/200",
            images: ImagesType(
                THUMBNAIL: ImageContent(url: String(), width: 1, height: 1),
                SMALL: ImageContent(url: "", width: 1, height: 1),
                REGULAR: ImageContent(url: "", width: 1, height: 1)),
            source: "Serious Eats",
            url: "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html")
        VStack {
            ForEach(1..<12) { _ in
                RecipeCell(recipe: recipe)
            }
        }
        .background(.gray.opacity(0.1))
        .padding(20)
        
    }
}
