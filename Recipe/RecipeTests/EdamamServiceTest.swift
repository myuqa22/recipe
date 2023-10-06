//
//  EdamamServiceTest.swift
//  RecipeTests
//
//  Created by Privat on 06.10.23.
//

import XCTest
@testable import Recipe

final class EdamamServiceTest: XCTestCase {
    
    func testParse() throws {
        
        let mockService = EdamamServiceMock()
        
        let result = mockService.getRecipesBy(query: "chicken")
        
        XCTAssertNotNil(result)
    }
    
}
