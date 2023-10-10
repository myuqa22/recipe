//
//  RecipeModel.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

struct Recipe: Codable, Hashable {
    
    let id: UUID
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
    
    init(id: UUID,
         uri: String,
         label: String?,
         image: String?,
         images: ImagesType?,
         source: String?,
         url: String?,
         shareAs: String?,
         yield: Double?,
         dietLabels: [String]?,
         healthLabels: [String]?,
         cautions: [String]?,
         ingredientLines: [String]?,
         ingredients: [Ingredient]?,
         calories: Double?,
         co2EmissionsClass: String?,
         totalWeight: Double?,
         totalTime: Double?,
         cuisineType: [String]?,
         mealType: [String]?,
         dishType: [String]?) {
        
        self.id = id
        self.uri = uri
        self.label = label
        self.image = image
        self.images = images
        self.source = source
        self.url = url
        self.shareAs = shareAs
        self.yield = yield
        self.dietLabels = dietLabels
        self.healthLabels = healthLabels
        self.cautions = cautions
        self.ingredientLines = ingredientLines
        self.ingredients = ingredients
        self.calories = calories
        self.co2EmissionsClass = co2EmissionsClass
        self.totalWeight = totalWeight
        self.totalTime = totalTime
        self.cuisineType = cuisineType
        self.mealType = mealType
        self.dishType = dishType
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self.id = try container.decode(UUID.self, forKey: .id)
        } catch {
            self.id = UUID()
        }
       
        self.uri = try container.decode(String.self, forKey: .uri)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.images = try container.decodeIfPresent(ImagesType.self, forKey: .images)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.shareAs = try container.decodeIfPresent(String.self, forKey: .shareAs)
        self.yield = try container.decodeIfPresent(Double.self, forKey: .yield)
        self.dietLabels = try container.decodeIfPresent([String].self, forKey: .dietLabels)
        self.healthLabels = try container.decodeIfPresent([String].self, forKey: .healthLabels)
        self.cautions = try container.decodeIfPresent([String].self, forKey: .cautions)
        self.ingredientLines = try container.decodeIfPresent([String].self, forKey: .ingredientLines)
        self.ingredients = try container.decodeIfPresent([Ingredient].self, forKey: .ingredients)
        self.calories = try container.decodeIfPresent(Double.self, forKey: .calories)
        self.co2EmissionsClass = try container.decodeIfPresent(String.self, forKey: .co2EmissionsClass)
        self.totalWeight = try container.decodeIfPresent(Double.self, forKey: .totalWeight)
        self.totalTime = try container.decodeIfPresent(Double.self, forKey: .totalTime)
        self.cuisineType = try container.decodeIfPresent([String].self, forKey: .cuisineType)
        self.mealType = try container.decodeIfPresent([String].self, forKey: .mealType)
        self.dishType = try container.decodeIfPresent([String].self, forKey: .dishType)
    }
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
