//
//  RecipeListViewModel.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

import Defaults
import SwiftMessages

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var query: String = String()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let service = RecipesService(apiService: EdamamService())
    
    var nextPageUrl: String?
    
    enum Action {
        case startSearch
        case selectSearchHistoryQuery(String)
        case triggerPagination
    }
    
    func processAction(action: Action) {
        
        switch action {
        case .startSearch:
            guard !query.isEmpty else { return }
            Task {
                do {
                    isLoading = true
                    if let recipesDto = try await service.getRecipes(by: query) {
                        recipes = recipesDto.hits?.compactMap({ $0.recipe }) ?? []
                        nextPageUrl = recipesDto._links?.next?.href
                    }
                    handleSearchHistory()
                    isLoading = false
                } catch {
                    showError(message: error.localizedDescription)
                    isLoading = false
                }
            }
        case .selectSearchHistoryQuery(let searchHistoryQuery):
            Task {
                query = searchHistoryQuery
                do {
                    isLoading = true
                    if let recipesDto = try await service.getRecipes(by: searchHistoryQuery) {
                        let newRecipies = recipesDto.hits?.compactMap({ $0.recipe}) ?? []
                        recipes.append(contentsOf: newRecipies)
                        nextPageUrl = recipesDto._links?.next?.href
                    }
                    handleSearchHistory()
                    isLoading = false
                } catch {
                    showError(message: error.localizedDescription)
                    isLoading = false
                }
            }
        case .triggerPagination:
            Task {
                do {
                    if let nextPageUrl,
                       let recipesDto = try await service.paginateRecipes(from: nextPageUrl) {
                        let newRecipies = recipesDto.hits?.compactMap({ $0.recipe}) ?? []
                        recipes.append(contentsOf: newRecipies)
                        self.nextPageUrl = recipesDto._links?.next?.href
                    }
                } catch {
                    showError(message: error.localizedDescription)
                }
            }
        }
    }
    
    private func handleSearchHistory() {
        
        Defaults[.searchHistory].removeAll(where: { $0 == query })
        Defaults[.searchHistory].append(query)
        
        if Defaults[.searchHistory].count >= 10 {
            Defaults[.searchHistory].remove(at: 0)
        }
    }
    
    private func showError(message: String) {
        
        SwiftMessages.show(view: Message.getView(with: message))
    }
    
}
