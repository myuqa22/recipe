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
                Text(recipe.label ?? String())
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.leading, 20)
            
            Spacer()
            
            KFImage(URL(string: (recipe.image ?? String())!))
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
        
        let recipe = Recipe.mock
        VStack {
            ForEach(1..<12) { _ in
                RecipeCell(recipe: recipe)
            }
        }
        .background(.gray.opacity(0.1))
        .padding(20)
        
    }
}
