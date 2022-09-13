//
//  CookcademyApp.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/8/22.
//

import SwiftUI

@main
struct CookcademyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                //RecipeCategoryGridView()
                RecipesListView(category: .breakfast)
                    .environmentObject(RecipeData())
            }
        }
    }
}
