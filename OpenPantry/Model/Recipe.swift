//
//  Recipe.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 2/7/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    struct Hits: Codable {
        let recipe: RecipeInfo
    }
    let hits: [Hits]
}

struct RecipeInfo: Codable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels: [String]
    let healthLabels: [String]
    let ingredientLines: [String]
    let calories: Double
    let totalWeight: Double
    let totalTime: Int
}

