//
//  RecipeView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 21/9/20.
//

import SwiftUI

struct RecipeView: View {

    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    Text("#\(recipe.wrappedID)")
                        .font(FontNameManager.largeTitle2)
                    Spacer()
                    Button {}
                        label: {
                            Image("Pdf")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(Color("BlackColor"))
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                }
                AppointmentPreview(appointment: recipe.appointment!)
                VStack {
                    ProgressBar(value: .constant(0.4)).padding(.top).frame(height: 40)
                    HStack {
                        Text("\(formatDate(recipe.startDate, dateFormat: "d MMM"))")
                            .font(FontNameManager.menu2)
                            .foregroundColor(Color("BlackColor"))
                        Spacer()
                        Text("\(recipe.daysLeft) días restantes")
                            .font(FontNameManager.menu2)
                            .foregroundColor(Color("BlackColor"))
                    }
                }

                HStack {
                    Text("Medicamentos")
                    Spacer()
                    Text("\(recipe.medicineBoughtCount)/\(recipe.medicineArray.count) Comprados")
                }
                .padding(.top)
                .font(FontNameManager.title21)
                .foregroundColor(Color("BlackColor"))
                ForEach(recipe.medicineArray, id: \.wrappedID) { (medicine: Medicine) in
                    MedicineComponent(medicine: medicine)
                }
            }
            .padding([.top, .leading, .trailing])
            .padding(.bottom, 32)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white).shadow(color: Color("ShadowColor"), radius: 3, x: 0, y: 1))
            .padding(.all)
        }

    }

}

struct RecipeView_Previews: PreviewProvider {

    static var previews: some View {

        let recipe = Recipe(context: PersistenceController.preview.container.viewContext)
        recipe.id = "120"
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


        return RecipeView(recipe: recipe).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

