//
//  AllRecipesView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 20/9/20.
//

import SwiftUI

struct AllRecipesView: View {

    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Recipe.entity(), sortDescriptors: [])
    var recipes: FetchedResults<Recipe>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("En curso")
                    .font(FontNameManager.title)
                    .foregroundColor(Color("BlackColor"))
                    .padding(.top)
                LazyVStack(spacing: 12) {
                    ForEach(recipes, id: \.id) { recipe in
                        ActiveRecipe(recipe: recipe)
                    }
                }
                Text("Pasadas")
                    .font(FontNameManager.title)
                    .foregroundColor(Color("BlackColor"))
                    .padding(.top)
                LazyVStack(spacing: 12) {
                    ForEach(recipes, id: \.self) {recipe in
                        PastRecipe(recipe: recipe)
                    }
                }
            }
            .padding(.all)
        }
        .navigationTitle("Recetas")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AllRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipesView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

