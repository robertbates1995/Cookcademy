//
//  ContentView.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/8/22.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    let listBackgroundColor = AppColor.background
    let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes(for: category)) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipeData.recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}
