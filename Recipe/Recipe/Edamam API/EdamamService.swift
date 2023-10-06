//
//  EdamamService.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Foundation

protocol EdamamServiceProtocol {
    func getRecipesBy(query: String) async throws -> RecipesDto?
    func getRecipesBy(url: URL) async throws -> RecipesDto?
}

class EdamamService: EdamamServiceProtocol {
        
    var url = URL(string: "https://api.edamam.com/api/recipes/v2?")!
    let appId = "6cc7056b"
    let appKey = "9425d5f01318992465170a489abceb56"
    let type = "public"
    
    func getRecipesBy(query: String) async throws -> RecipesDto? {
        
        let queryItems = [
            URLQueryItem(name: "app_id", value: appId),
            URLQueryItem(name: "app_key", value: appKey),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "type", value: type)
        ]
        url.append(queryItems: queryItems)
    
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(RecipesDto.self, from: data)
        
        return decoded
    }
    
    func getRecipesBy(url: URL) async throws -> RecipesDto? {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(RecipesDto.self, from: data)
        
        return decoded
    }
    
}
