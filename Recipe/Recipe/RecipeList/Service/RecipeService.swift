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
    
    func getRecipes(by query: String) -> [Recipe] {
        return apiService.getRecipes(by: query)?.hits.map({ $0.recipe }) ?? []
    }
}
