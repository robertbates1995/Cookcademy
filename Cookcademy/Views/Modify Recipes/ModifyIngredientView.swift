//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Robert Bates on 10/9/22.
//

import SwiftUI

struct ModifyIngredientView: View {
    @State var ingredient: Ingredient
    
    var body: some View {
        VStack{
            Form{
                TextField("Ingredient Name", text: $ingredient.name)
            }
        }
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var emptyIngredient = Ingredient(name: "", quantity: 1.0, unit: .none)
    
    static var previews: some View {
        ModifyIngredientView(ingredient: emptyIngredient)
    }
}
