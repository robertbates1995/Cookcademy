//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/10/22.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack{
            HStack{
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack{
                Text(recipe.mainInformation.description)
                    .font(.body)
                    .padding()
                Spacer()
            }
            List{
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self){ index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                    }
                }
            }
            .padding(7)
            List{
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self){ index in
                        let direction = recipe.directions[index]
                        Text(direction.description)
                    }
                }
            }
            .padding(7)
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[1]
    static var previews: some View {
        NavigationView{
            RecipeDetailView(recipe: recipe)
        }
    }
}

