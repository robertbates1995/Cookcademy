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
        ScrollView{
            let columns = [GridItem(), GridItem()]
            LazyVGrid(columns: columns, content: {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    CategoryView(category: category)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
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
