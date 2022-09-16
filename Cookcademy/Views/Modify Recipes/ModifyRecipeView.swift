//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/16/22.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("Fill in the recipe with test data.") {
            Recipe(mainInformation:
                    MainInformation(
                        name: "test",
                        description: "test",
                        author: "test",
                        category: .breakfast
                    ),
                   ingredients:
                    [Ingredient(
                        name: "test",
                        quantity: 1.0,
                        unit: .cups
                    )],
                   directions:
                    [Direction(
                        description: "test",
                        isOptional: false
                    )]
            )
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
