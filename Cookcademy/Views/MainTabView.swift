//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Robert Bates on 10/19/22.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            NavigationView {
                RecipeCategoryGridView()
            }   .tabItem { Label("Recipes", systemImage: "list.dash") }
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }   .tabItem { Label("Favorites", systemImage: "heart.fill") }
            NavigationView {
                SettingsView()
            }   .tabItem { Label("Settings", systemImage: "gear") }
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
