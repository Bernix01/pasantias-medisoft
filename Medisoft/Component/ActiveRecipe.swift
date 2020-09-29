//
//  ActiveRecipe.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI
import CoreData

struct ActiveRecipe: View {
    let recipe: Recipe
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationLink(destination: RecipeView(recipe: recipe)) {
            VStack(alignment: .leading) {
                Text("#\(recipe.wrappedID)")
                    .font(FontNameManager.title)
                    .padding(.bottom, 5.0)
                Text("5/6 comprados")
                    .font(FontNameManager.title3)
                    .foregroundColor(Color("GreyColor"))
                    .padding(.bottom, 4.0)
                Text(recipe.appointment!.drName!)
                    .font(FontNameManager.title2)
                    .foregroundColor(Color("BlackColor"))
                Text("Incluye:")
                    .font(FontNameManager.menuBold)
                    .foregroundColor(Color("GreyColor"))
                    .padding(.top, 4.0)
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(recipe.medicineArray, id: \.id) { medicine in
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(Color("BlackColor"))
                            Text(medicine.wrappedPrincipioActivo)
                                .font(FontNameManager.body)
                                .foregroundColor(Color("BlackColor"))
                        }
                    }
                }
                ProgressBar(value: .constant(0.4)).frame(height: 16)
                HStack {
                    Text("\(recipe.startDate, formatter: startDateFormatter)")
                        .font(FontNameManager.body2)
                        .foregroundColor(Color("BlackColor"))
                    Spacer()
                    Text("\(recipe.daysLeft) días restantes")
                        .font(FontNameManager.body2)
                        .foregroundColor(Color("BlackColor"))
                }
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



struct ActiveRecipe_Previews: PreviewProvider {


    static var previews: some View {

        let recipe = Recipe(context: PersistenceController.preview.container.viewContext)
        recipe.id = "0099"
        let apmt = AppointmentInfo(context: PersistenceController.preview.container.viewContext)

        apmt.id = "4"
        apmt.drName = "Dra. Paula González"
        apmt.date = Date()
        apmt.specialty = "Medicina General"
        apmt.location = "Los Álamos"
        recipe.appointment = apmt
        let med = Medicine(context: PersistenceController.preview.container.viewContext)

        med.id = "12"
        med.principioActivo = "Metronizadol"
        med.formaFarmaceutica = "Solución inyectable de 120ml"
        med.frecuencia = "8h"
        med.duracionDias = 12
        med.viaAdministracion = "IV - Intravenoso"
        med.cantidad = 16
        med.scheduledStart = Date()
        med.scheduledEnd = Calendar.current.date(byAdding: .day, value: 16, to: Date())!

        recipe.medicines = [med]
        recipe.pdfURL = "https://www.google.com"

        return ActiveRecipe(recipe: recipe).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
