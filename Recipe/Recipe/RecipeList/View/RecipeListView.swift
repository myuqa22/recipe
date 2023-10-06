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
            VStack {
                Text("Searching for: \(viewModel.query)")
                ScrollView {
                    VStack {
                        ForEach(viewModel.recipes, id: \.label) { recipe in
                            Text(recipe.label)
                        }
                    }
                    .scrollDismissesKeyboard(.immediately)
                }
            }
            .navigationTitle("Recipe Search")
        }
        .searchable(text: $viewModel.query, suggestions: {
            ForEach(searchHistory, id: \.hashValue) { query in
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
