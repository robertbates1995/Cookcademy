//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/10/22.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
