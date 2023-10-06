//
//  ContentView.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import SwiftUI

import netfox

struct ContentView: View {
    
    init() {
        
        NFX.sharedInstance().start()
    }
    
    var body: some View {
        RecipeListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
