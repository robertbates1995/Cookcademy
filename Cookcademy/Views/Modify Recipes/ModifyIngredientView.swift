//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Robert Bates on 10/9/22.
//

import SwiftUI

struct ModifyIngredientView: View {
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient) -> Void)
    
    var body: some View {
        VStack{
            Form{
                TextField("Ingredient Name", text: $ingredient.name)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack{
                        Text("Quantity:")
                        TextField("test", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                Picker(selection: $ingredient.unit, label: HStack{
                    Text("Unit")
                    Spacer()
                    Text(ingredient.unit.rawValue)
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                HStack{
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                    }
                    Spacer()
                }
            }
        }
    }
}
    
extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var emptyIngredient = Ingredient(name: "", quantity: 1.0, unit: .none)
    
    static var previews: some View {
        ModifyIngredientView(ingredient: $emptyIngredient) { ingredient in
            print(ingredient)
        }
    }
}
