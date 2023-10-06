//
//  RecipeModel.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

struct Recipe: Codable, Hashable {
    
    let uri: String
    let label: String?
    let image: String?
    let images: ImagesType?
    let source: String?
    let url: String?
    let shareAs: String?
    let yield: Double?
    let dietLabels: [String]?
    let healthLabels: [String]?
    let cautions: [String]?
    let ingredientLines: [String]?
    let ingredients: [Ingredient]?
    let calories: Double?
    let co2EmissionsClass: String?
    let totalWeight: Double?
    let totalTime: Double?
    let cuisineType: [String]?
    let mealType: [String]?
    let dishType: [String]?
}

struct ImagesType: Codable, Hashable {
    
    let THUMBNAIL: ImageContent?
    let SMALL: ImageContent?
    let REGULAR: ImageContent?
}

struct ImageContent: Codable, Hashable {
    
    let url: String?
    let width: Int?
    let height: Int?
}

struct Ingredient: Codable, Hashable {
    
    let text: String?
    let quantity: Double?
    let measure: String?
    let food: String?
    let weight: Double?
    let foodCategory: String?
    let foodId: String?
    let image: String?
}
