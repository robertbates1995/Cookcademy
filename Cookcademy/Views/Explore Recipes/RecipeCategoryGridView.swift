//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Robert Bates on 9/12/22.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    
    private var recipeData = RecipeData()
    
    var body: some View {
        VStack{
            ForEach(MainInformation.Category.allCases, id: \.self) { category in
                NavigationLink(destination: RecipesListView(viewStyle: .singleCategory(category)), label: {
                    CategoryView(category: category)
                        .frame(maxWidth: .infinity, minHeight: 0.0)
                        .clipped()
                }
                )
            }
        }
        .navigationTitle("Categories")
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.35)
                .background(.white)
            Text(category.rawValue)
                .font(.title)
                .foregroundColor(Color.black)
                .opacity(0.9)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeCategoryGridView()
        }
    }
}
