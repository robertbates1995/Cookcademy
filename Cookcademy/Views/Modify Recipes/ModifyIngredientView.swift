//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Robert Bates on 10/9/22.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView {
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient) -> Void)
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.createAction = createAction
    }
    
    @Environment(\.presentationMode) private var mode
    
    var body: some View {
        VStack{
            Form{
                TextField("Ingredient Name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack{
                        Text("Quantity:")
                        TextField("test", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }   .listRowBackground(listBackgroundColor)
                Picker(selection: $ingredient.unit, label: HStack{
                    Text("Unit")
                    Spacer()
                    Text(ingredient.unit.rawValue)
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }   .listRowBackground(listBackgroundColor)
                .pickerStyle(MenuPickerStyle())
                HStack{
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                        mode.wrappedValue.dismiss()
                    }   .listRowBackground(listBackgroundColor)
                    Spacer()
                }
            }   .foregroundColor(listTextColor)
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
    @State static var emptyIngredient = Recipe.testRecipes[0].ingredients[0]
    
    static var previews: some View {
        NavigationView {
            ModifyIngredientView(component: $emptyIngredient) { ingredient in
                print(ingredient)
            }
        }.navigationTitle("Add Ingredient")
    }
}
