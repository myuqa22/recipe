//
//  RecipeModelMock.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

extension Recipe {
    
    static var mock: Recipe {
        
        Recipe(uri: "https://picsum.photos/200",
               label: "Testgericht",
               image: "https://picsum.photos/200",
               images: ImagesType(THUMBNAIL: ImageContent(url: "https://picsum.photos/200", width: 50, height: 50),
                                  SMALL: ImageContent(url: "https://picsum.photos/200", width: 50, height: 50),
                                  REGULAR: ImageContent(url: "https://picsum.photos/200", width: 50, height: 50)),
               source: "",
               url: "",
               shareAs: "",
               yield: 1.0,
               dietLabels: ["dietLabels"],
               healthLabels: ["healthLabels"],
               cautions: ["cautions"],
               ingredientLines: ["ingriedientLines"],
               ingredients: [Ingredient(text: "Ingredient",
                                        quantity: 1,
                                        measure: "kg",
                                        food: "food",
                                        weight: 1.0,
                                        foodCategory: "foodCategory",
                                        foodId: "foodId",
                                        image: "https://picsum.photos/200")
               ],
               calories: 1.0,
               totalCO2Emissions: 1.0,
               co2EmissionsClass: "Z",
               totalWeight: 1.0,
               totalTime: 1.0,
               cuisineType: ["cuisineType"],
               mealType: ["mealType"],
               dishType: ["dishType"])
    }
}
