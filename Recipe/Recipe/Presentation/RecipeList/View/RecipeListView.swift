//
//  RecipeListView.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import SwiftUI

import Defaults

struct RecipeListView: View {
    
    @EnvironmentObject var router: Router
    
    @StateObject var viewModel = RecipeListViewModel()
    @Default(.searchHistory) var searchHistory
    
    var body: some View {
        
        NavigationStack(path: $router.path) {
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()
                VStack {
                    
                    Text("Searching for: \(viewModel.query)")
                        .opacity(viewModel.query.isEmpty ? 0 : 1)
                    
                    ScrollView {
                        LazyVStack {
                            if viewModel.recipes.isEmpty {
                                Text("No recipes found.")
                                    .font(.title3)
                                Text("Enter a keyword to search for a recipe.")
                                    .font(.body)
                            }
                            ForEach(viewModel.recipes, id: \.uri) { recipe in
                                RecipeCellView(recipe: recipe)
                                    .padding(.horizontal, 10)
                                    .clipShape(Rectangle())
                                    .onTapGesture {
                                        router.path.append(.detail(recipe))
                                    }
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
            .navigationDestination(for: Router.NavigationPath.self) { path in
                switch path {
                case let .detail(recipe):
                    RecipeDetailView(recipe: recipe)
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
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeListView()
    }
    
}
