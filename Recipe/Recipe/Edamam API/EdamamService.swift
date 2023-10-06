//
//  EdamamService.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

protocol EdamamServiceProtocol {
    func getRecipes(by query: String) -> RecipesDto?
}

class EdamamService: EdamamServiceProtocol {
    
    func getRecipes(by query: String) -> RecipesDto? {
        return nil
    }
    
}
