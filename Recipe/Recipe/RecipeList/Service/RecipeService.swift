//
//  RecipeService.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

class RecipeService {
    
    let apiService: EdamamServiceProtocol
    
    init(apiService: EdamamServiceProtocol) {
        
        self.apiService = apiService
    }
    
    func getRecipes(by query: String) async throws -> RecipesDto? {
        
        try await apiService.getRecipesBy(query: query) 
    }
    
    func paginateRecipes(from url: String) async throws -> RecipesDto? {
        
        try await apiService.getRecipesBy(url: URL(string: url)!)
    }
    
}
