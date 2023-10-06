//
//  EdamamServiceMock.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import UIKit

public class EdamamServiceMock: EdamamServiceProtocol {
    
    public init() {}
    
    func getRecipesBy(query: String) -> RecipesDto? {
        
        let decoder = JSONDecoder()
        let path = Bundle.main.path(forResource: "MockData", ofType: "json")
        let mock = try! String(contentsOfFile: path!)
        
        do {
            let data = mock.data(using: .utf8)
            let recipesDto = try decoder.decode(RecipesDto.self, from: data!)
            return recipesDto
            
        } catch let error {
            print(error)
            return nil
        }
    }
    
    func getRecipesBy(url: URL) async throws -> RecipesDto? {
        
        getRecipesBy(query: "")
    }
    
}
