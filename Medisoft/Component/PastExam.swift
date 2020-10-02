//
//  PastRecipe.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI

struct PastExam: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("#\(recipe.id!)")
                    .font(FontNameManager.menu)
                    .padding(.bottom, 5.0)
                Spacer()
                Text("LABORATORIO")
            }
            DrInfoComponent(drName: recipe.appointment!.drName!,
                   specialty: recipe.appointment!.specialty!)
            HStack {
                Text("Incluye: ")
                    .font(FontNameManager.body2Bold)
                    .foregroundColor(Color("GreyColor"))
                    .padding(.top, 4.0)
                Text("4 exámenes")
                Spacer()
            }
        }
        .padding(.all)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white))
    }
}

struct PastExam_Previews: PreviewProvider {

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

        return PastExam(recipe: recipe).previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
