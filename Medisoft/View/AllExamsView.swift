//
//  AllRecipesView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 20/9/20.
//

import SwiftUI

struct AllExams: View {

    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: ExamsOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<ExamsOrder>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Pendientes")
                    .font(FontNameManager.title)
                    .foregroundColor(Color("BlackColor"))
                    .padding(.top)
                LazyVStack(spacing: 12) {
                    ForEach(orders, id: \.id) { order in
                        PendingExamsOrderComponent(order: order)
                    }
                }
                Text("Relaizados")
                    .font(FontNameManager.title)
                    .foregroundColor(Color("BlackColor"))
                    .padding(.top)
                LazyVStack(spacing: 12) {
                    ForEach(orders, id: \.self) { order in
                        PastExamsOrderComponent(order: order)
                    }
                }
            }
            .padding(.all)
        }
        .navigationTitle("Órdenes de exámenes")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: UIColor(named: "PrimaryColor") ?? UIColor.black, tintColor: .white)
    }
}

struct AllExams_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AllExams()
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

