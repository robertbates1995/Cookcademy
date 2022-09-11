//
//  ContentView.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/8/22.
//

import SwiftUI

struct RecipesListView: View {
  @StateObject var recipeData = RecipeData()
    
  var body: some View {
    List {
      ForEach(recipeData.recipes) { recipe in
        Text(recipe.mainInformation.name)
      }
    }
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
