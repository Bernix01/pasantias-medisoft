//
//  ActiveRecipe.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI
import CoreData

struct PendingExam: View {
    let recipe: Recipe
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationLink(destination: RecipeView(recipe: recipe)) {
            VStack(alignment: .leading) {
                HStack {
                    Text("#\(recipe.wrappedID)")
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
                DrInfoComponent(drName: recipe.appointment!.drName!,
                       specialty: recipe.appointment!.specialty!)
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



struct PendingExam_Previews: PreviewProvider {


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

        return PendingExam(recipe: recipe).previewLayout(.fixed(width: 400.0, height: 300.0)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
