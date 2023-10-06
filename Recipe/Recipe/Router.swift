//
//  Router.swift
//  Recipe
//
//  Created by Privat on 07.10.23.
//

import Foundation

class Router: ObservableObject {
    
    enum NavigationPath: Hashable {
        
        case detail(Recipe)
    }
    
    @Published var path: [NavigationPath] = []
}
