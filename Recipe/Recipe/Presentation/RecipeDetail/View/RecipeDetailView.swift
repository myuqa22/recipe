//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import SwiftUI

import Kingfisher

struct RecipeDetailView: View {
    
    @StateObject var viewModel = RecipeListViewModel()
    
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: recipe.images?.REGULAR?.url ?? String()))
                    .resizable()
                    .scaledToFit()
                VStack {
                    Text("Ingredients:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(recipe.ingredientLines ?? [], id: \.hashValue) { ingredient in
                        Text(ingredient)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle(recipe.label ?? String())
    }
    
}

struct RecipeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let recipe = Recipe.mock
        
        RecipeDetailView(recipe: recipe)
    }
    
}
