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
    @Published var isLoading: Bool = false
    
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
                    isLoading = true
                    recipes = try await service.getRecipes(by: query)
                    isLoading = false
                } catch {
                    print(error)
                    isLoading = false
                }
            }
        case .selectSearchHistoryQuery(let searchHistoryQuery):
            query = searchHistoryQuery
            Task {
                do {
                    isLoading = true
                    recipes = try await service.getRecipes(by: searchHistoryQuery)
                    isLoading = false
                } catch {
                    print(error)
                    isLoading = false
                }
                
            }
        }
    }
}
