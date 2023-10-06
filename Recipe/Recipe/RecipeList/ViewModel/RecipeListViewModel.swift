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
    
    let service = RecipeService(apiService: EdamamService())
    
    enum Action {
        case startSearch
        case selectSearchHistoryQuery(String)
    }
    
    func processAction(action: Action){
        switch action {
        case .startSearch:
            Task {
                do {
                    recipes = try await service.getRecipes(by: query)
                } catch {
                    print(error)
                }
            }
        case .selectSearchHistoryQuery(let searchHistoryQuery):
            query = searchHistoryQuery
            Task {
                do {
                    recipes = try await service.getRecipes(by: searchHistoryQuery)
                } catch {
                    print(error)
                }
                
            }
        }
    }
}
