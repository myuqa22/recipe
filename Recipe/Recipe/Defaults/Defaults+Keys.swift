//
//  Defaults+Keys.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import Defaults

extension Defaults.Keys {
    
    static let searchHistory = Key<[String]>("searchHistory", default: ["Test"])
}
