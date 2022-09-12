//
//  ContentView.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/8/22.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink( recipe.mainInformation.name,
                                destination:
                                    RecipeDetailView(recipe:recipe))
            }
        }
        .listRowBackground(listBackgroundColor)
        .foregroundColor(listForegroundColor)
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView()
        }
    }
}
