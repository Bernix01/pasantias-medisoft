//
//  ActiveRecipe.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI
import CoreData

struct PendingExamsOrderComponent: View {
    let order: ExamsOrder
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationLink(destination: ExamsOrderView(order: order)) {
            VStack(alignment: .leading) {
                HStack {
                    Text("#\(order.wrappedID)")
                        .font(FontNameManager.title)
                        .foregroundColor(Color("BlackColor"))
                        .padding(.bottom, 5.0)
                    Spacer()
                    Text("LABORATORIO")
                }
                Text("5/6 realizados")
                    .font(FontNameManager.title3)
                    .foregroundColor(Color("GreyColor"))
                    .padding(.bottom, 4.0)
                DrInfoComponent(drName: order.drName!,
                       specialty: order.specialty!)
                Text("Incluye:")
                    .font(FontNameManager.menuBold)
                    .foregroundColor(Color("GreyColor"))
                    .padding(.top, 4.0)
//                LazyVGrid(columns: columns, alignment: .leading) {
//                    ForEach(recipe.medicineArray, id: \.id) { medicine in
//                        HStack {
//                            Circle()
//                                .frame(width: 8, height: 8, alignment: .center)
//                                .foregroundColor(Color("BlackColor"))
//                            Text(medicine.wrappedPrincipioActivo)
//                                .font(FontNameManager.body)
//                                .foregroundColor(Color("BlackColor"))
//                        }
//                    }
//                }
            }
            .padding(.all)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: Color("ShadowColor"),
                                    radius: 1.5, x: 0.0, y: 1))
        }
    }

    var startDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter
    }
}



struct PendingExamsOrderComponent_Previews: PreviewProvider {


    static var previews: some View {

        let order: ExamsOrder = ExamsOrder(context: PersistenceController.preview.container.viewContext)
        
        order.drName = "Dr. Guillermo Bernal"
        order.id = "123"
        order.pdfURL = "https://google.com"
        order.exams = []
        order.preExamIndications = "Test"
        order.specialty = "Rayos Gamma"
        

        return PendingExamsOrderComponent(order: order).previewLayout(.fixed(width: 400.0, height: 300.0)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
