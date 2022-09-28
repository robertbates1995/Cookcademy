//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/10/22.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
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
                            .foregroundColor(listTextColor)
                    }
                }
                .listRowBackground(listBackgroundColor)
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self){ index in
                        let direction = recipe.directions[index]
                        Text(direction.description)
                            .foregroundColor(listTextColor)
                    }
                }.listRowBackground(listBackgroundColor)
            }
            .navigationTitle(recipe.mainInformation.name)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView{
            RecipeDetailView(recipe: recipe)
        }
    }
}