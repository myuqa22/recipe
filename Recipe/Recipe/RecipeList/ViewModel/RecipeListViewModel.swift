//
//  RecipeListViewModel.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var query: String = String()
    
    let service = RecipeService(apiService: EdamamServiceMock())
    
    enum Action {
        case startSearch
        case selectSearchHistoryQuery(String)
    }
    
    func processAction(action: Action) {
        switch action {
        case .startSearch:
            recipes = service.getRecipes(by: query)
        case .selectSearchHistoryQuery(let searchHistoryQuery):
            query = searchHistoryQuery
            recipes = service.getRecipes(by: searchHistoryQuery)
        }
    }
}
