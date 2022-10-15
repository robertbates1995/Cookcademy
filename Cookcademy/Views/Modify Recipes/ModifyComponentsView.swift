//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Robert Bates on 10/10/22.
//

import SwiftUI

protocol RecipeComponent {
    init()
}

protocol ModifyComponentView: View {
    associatedtype Component
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}

struct ModifyComponentsView: View {
    @Binding var ingredients: [Ingredient]
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @State private var newIngredient = Ingredient()
    
    var body: some View {
        VStack {
            let addIngredientView = ModifyIngredientView(component: $newIngredient) { ingredient in
                ingredients.append(ingredient)
                newIngredient = Ingredient()
            }.navigationTitle("Add Ingredient")
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: addIngredientView)
                Spacer()
            } else {
                HStack {
                    Text("Ingredients")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    .listRowBackground(listBackgroundColor)
                    NavigationLink("Add another Ingredient",
                                   destination: addIngredientView)
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(listBackgroundColor)
                }.foregroundColor(listTextColor)
            }
        }
    }
}

struct ModifyComponentsView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    @State static var emptyIngredients = [Ingredient]()
    static var previews: some View {
        NavigationView {
            ModifyComponentsView(ingredients: $recipe.ingredients)
        }
        NavigationView {
            ModifyComponentsView(ingredients: $emptyIngredients)
        }
    }
}
