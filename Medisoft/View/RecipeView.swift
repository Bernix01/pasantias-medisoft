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
            .navigationBarColor(backgroundColor: UIColor(named: "PrimaryColor") ?? UIColor.black, tintColor: .white)
            .navigationTitle("Receta")
            .navigationBarTitleDisplayMode(.inline)
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
        med.scheduledStart = Calendar.current.date(byAdding: .day,value: 3, to: Date())
        med.dosis = "500gr"
        med.scheduledEnd = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
        med.boughtOn = nil
        
        let med2 = Medicine(context: PersistenceController.preview.container.viewContext)
        med2.id = "123"
        med2.principioActivo = "Metronizadol"
        med2.formaFarmaceutica = "Solución inyectable de 120ml"
        med2.frecuencia = "8h"
        med2.duracionDias = 12
        med2.viaAdministracion = "IV - Intravenoso"
        med2.cantidad = 16
        med2.scheduledStart = Calendar.current.date(byAdding: .day,value: -3, to: Date())
        med2.dosis = "500gr"
        med2.scheduledEnd = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
        med2.boughtOn = nil
        
        let med3 = Medicine(context: PersistenceController.preview.container.viewContext)
        med3.id = "1234"
        med3.principioActivo = "Metronizadol"
        med3.formaFarmaceutica = "Solución inyectable de 120ml"
        med3.frecuencia = "8h"
        med3.duracionDias = 12
        med3.viaAdministracion = "IV - Intravenoso"
        med3.cantidad = 16
        med3.boughtOn = Calendar.current.date(byAdding: .day, value: -4, to: Date())
        med3.scheduledStart = Calendar.current.date(byAdding: .day,value: -3, to: Date())
        med3.dosis = "500gr"
        med3.scheduledEnd = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
        
        let med4 = Medicine(context: PersistenceController.preview.container.viewContext)
        med4.id = "12345"
        med4.principioActivo = "Metronizadol"
        med4.formaFarmaceutica = "Solución inyectable de 120ml"
        med4.frecuencia = "8h"
        med4.duracionDias = 12
        med4.viaAdministracion = "IV - Intravenoso"
        med4.cantidad = 16
        med4.boughtOn = Calendar.current.date(byAdding: .day,value: -2, to: Date())
        med4.scheduledStart = Calendar.current.date(byAdding: .day,value: -3, to: Date())
        med4.dosis = "500gr"
        med4.scheduledEnd = Calendar.current.date(byAdding: .day, value: 10, to: Date())!

        recipe.medicines = [med, med2, med3, med4]
        recipe.pdfURL = "https://www.google.com"


        return
            NavigationView{
                RecipeView(recipe: recipe)
            }.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

