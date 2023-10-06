//
//  RecipeModel.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

struct RecipesDto: Codable {
    
    let from: Int?
    let to: Int?
    let count: Int?
    let _links: LinksContent?
    let hits: [RecipeContent]?
}

struct LinksContent: Codable {
    
    let next: NextContent?
}

struct NextContent: Codable {
    
    let href: String?
    let title: String?
}

struct RecipeContent: Codable {
    
    let recipe: Recipe?
}
