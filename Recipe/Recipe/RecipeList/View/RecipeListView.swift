//
//  RecipeListView.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import SwiftUI

import Defaults

struct RecipeListView: View {
    
    @StateObject var viewModel = RecipeListViewModel()
    @Default(.searchHistory) var searchHistory
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()
                VStack {
                    Text("Searching for: \(viewModel.query)")
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.recipes, id: \.uri) { recipe in
                                RecipeCellView(recipe: recipe)
                                    .padding(.horizontal, 10)
                            }
                            if viewModel.nextPageUrl != nil {
                                ProgressView()
                                    .padding()
                                    .onAppear {
                                        viewModel.processAction(action: .triggerPagination)
                                    }
                            }
                        }
                        .scrollDismissesKeyboard(.immediately)
                    }
                }
                .navigationTitle("Recipe Search")
                .padding(0)
                
                if viewModel.isLoading {
                    Color.gray.opacity(0.5).ignoresSafeArea()
                    ProgressView()
                        .scaleEffect(1.5)
                }
            }
        }
        .refreshable {
            viewModel.processAction(action: .startSearch)
        }
        .searchable(
            text: $viewModel.query,
            suggestions: {
                ForEach(searchHistory.reversed(), id: \.hashValue) { query in
                    Button {
                        viewModel.processAction(action: .selectSearchHistoryQuery(query))
                    } label: {
                        Label(query, systemImage: "bookmark")
                    }
                }
            })
        .onSubmit(of: .search) {
            viewModel.processAction(action: .startSearch)
        }
        .onAppear {
            viewModel.query = "Chicken"
            viewModel.processAction(action: .startSearch)
        }
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeListView()
    }
    
}
