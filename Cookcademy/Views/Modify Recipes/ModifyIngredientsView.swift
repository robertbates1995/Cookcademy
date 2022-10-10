//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Robert Bates on 10/10/22.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient(name: "", quantity: 0.0, unit: .none)
    
    var body: some View {
        VStack {
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: ModifyIngredientView(ingredient: $newIngredient, createAction: {_ in}))
                Spacer()
            } else {
                List{
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    NavigationLink("Add another ingredient", destination: ModifyIngredientView(ingredient: $newIngredient, createAction: {_ in}))
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var emptyIngredients = [Ingredient]()
    
    static var previews: some View {
        ModifyIngredientsView(ingredients: $emptyIngredients)
    }
}
