//
//  CookcademyApp.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/8/22.
//

import SwiftUI

@main

struct CookcademyApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeDetailView(recipe: Recipe.testRecipes[0])
            //RecipesListView()
        }
    }
}
