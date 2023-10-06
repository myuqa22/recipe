//
//  RecipeCell.swift
//  Recipe
//
//  Created by Privat on 06.10.23.
//

import SwiftUI

import Kingfisher

struct RecipeCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            VStack {
                Text(recipe.label)
                    .font(.title2)
                Spacer()
            }
            Spacer()
            
            KFImage(URL(string: recipe.image)!)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
        }
        .padding(20)
        .background(.white)
        .cornerRadius(10)
    }
}

struct RecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        
        let recipe = Recipe(
            label: "Chicken Vesuvio",
            image: "https://edamam-product-images.s3.amazonaws.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLWVhc3QtMSJGMEQCIEdj69p9ouJbvPKGI%2BNF6pzKKTT58FB%2FbB7AvCzsrpjWAiALGjmgijm2Nz4qw7s8k3ZP%2F%2BnF%2BTMsrre7%2F7g2JGdWHiq5BQh5EAAaDDE4NzAxNzE1MDk4NiIM6jFFnaaabRAdyzljKpYFmpgzvAy2%2FbP6xCmhUlTENJt1U%2F39AQYrcQLUKusAvI8aJPlyoKP7Kf%2BvbBAaN2ksVZBp8SDBzuP4Grd73sEbt%2BngPwNykDfjYH3Imjh%2F0soK%2FEgP40EHs7L0y9iPZy7mDKE2mARH9lnf59f2XKB%2FFMu0z0x0yBL9P8HjZRJFvxwUvXHjqqj9LuW4FZrP3B99O646dcPD5DBtoQHB5bs%2FmWxCKWnoZOzFy5wnnN%2FCzEiSNu952EPqcT0z2OTEaixzMzJrnmxnNN5Pfux4G%2FZ25xBo10NvjJvKpL9hMRwg7libk5jcJxChljJRnJxh96SX5cvAboug6gmd%2FpMwq%2FiEYLksoFIwOLQ5oaQsWktYw2RgAbZ0g1Se9Oe7t7FEtMixNjxlYeint5BILVJNWcIBqu1eduVRke%2BxRYkTY8QBTTxm3rs0TWO7pF%2FuNErO62AKA%2Bv6a1yOEBJtI34FacQsZJ97%2BjE0P4kcUhOZG4UOi8HniVba3hgxSYUliXemN0R10HCI4k%2BkR2qlGUFzYZwHldCDGM2p%2FwfZUMJD5lbu0NoiCcoAyZLx83ivOHXHnbLiS3FH4WOlS%2BYmrqhtcbAEjtJqSM8%2BWuzYVIefcTMFd2MUj3GZEPoHM87nF83%2B2n3mQcbwRIZJpuj0EhW4wc0Yg2FgvRBxpLIAXNw6GyVsmg49nwrm2zKzUsKbcUroFkHL0Sv1Yh%2FtaaBnPIqw3wv0IevP6uBXwFZLufVT9U%2B1aoxTILluSkFnPoXjr2%2FligdFpKRaG%2BMJ8uoGZSKNJLdRHPDt2LRKYrpTWZI4flCyfh5IOgdq1ZjRExom9SOSbELeqX8kE2RTiMozcPYR6TVQqFw1vmmUAlw2EI%2ByzwBa8tsA4lxExuMwxueAqQY6sgH8bHk9o0gpuisAgcwvf62oKBjK1%2B132RKOlZ3ZD7U0LdCYOI9hXqYpAT9GuA8gN9ihHi0%2FilHpWwjsyOyVZVIsUqlWXVEDR%2B%2FiyJAelaB%2FNQPOotKEIKUlQXqTomX1FgnmkrPVv96bL6757rFYPF0u42zDSuuzRc0KluQAvJhAFNOSMwGBJgp0a6K%2F2%2Bq5tlP%2B6YGeSo3TNp178aM%2BZ%2FwIV0%2B95ii9tRqPfhkkZatqWGVw&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231006T164809Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFFVQVT7N3%2F20231006%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=798188e202d067e73cae244f583e3582006cfafc918e776feb4b2a593f6f4291",
            images: ImagesType(
                THUMBNAIL: ImageContent(url: String(), width: 1, height: 1),
                SMALL: ImageContent(url: "", width: 1, height: 1),
                REGULAR: ImageContent(url: "", width: 1, height: 1)),
            source: "Serious Eats",
            url: "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html")
        RecipeCell(recipe: recipe)
    }
}
