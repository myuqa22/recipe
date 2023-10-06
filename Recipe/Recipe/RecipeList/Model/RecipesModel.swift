//
//  RecipeModel.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

struct RecipesDto: Codable {
    
    let from: Int
    let to: Int
    let count: Int
    let hits: [RecipeContent]
}

struct RecipeContent: Codable {
    let recipe: Recipe
}

struct Recipe: Codable {
    let label: String
    let image: String
    let images: ImagesType
    let source: String
    let url: String
}

struct ImageContent: Codable {
    let url: String
    let width: Int
    let height: Int
}
struct ImagesType: Codable {
    let THUMBNAIL: ImageContent
    let SMALL: ImageContent
    let REGULAR: ImageContent
}
