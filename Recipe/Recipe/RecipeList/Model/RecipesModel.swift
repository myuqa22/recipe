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

struct Recipe: Codable {
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
    let totalCO2Emissions: Double?
    let co2EmissionsClass: String?
    let totalWeight: Double?
    let totalTime: Double?
    let cuisineType: [String]?
    let mealType: [String]?
    let dishType: [String]?
//    let totalNutrients:
//    let totalDaily:
//    let digest:
}

struct ImageContent: Codable {
    let url: String?
    let width: Int?
    let height: Int?
}
struct ImagesType: Codable {
    let THUMBNAIL: ImageContent?
    let SMALL: ImageContent?
    let REGULAR: ImageContent?
}

struct Ingredient: Codable {
    let text: String?
    let quantity: Double?
    let measure: String?
    let food: String?
    let weight: Double?
    let foodCategory: String?
    let foodId: String?
    let image: String?
}
