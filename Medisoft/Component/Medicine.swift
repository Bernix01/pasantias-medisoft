//
//  Medicine.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 27/9/20.
//

import SwiftUI

struct MedicineComponent: View {
    let medicine: Medicine

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(medicine.principioActivo ?? "")
                    .font(FontNameManager.menuBold)
                Group{
                Text(medicine.formaFarmaceutica ?? "")
                Text("Cada \(medicine.frecuencia!) durante \(medicine.duracionDias) día(s)")
                Text(medicine.viaAdministracion!)
                Text("\(medicine.cantidad) unidades")
                }.font(FontNameManager.body)
                .foregroundColor(Color("GreyColor"))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                Text("Quedan 3 días")
                    .font(FontNameManager.menuBold)
                    .foregroundColor(Color("GreyColor"))
                Button {}
                    label: {
                        Image(checkImage)
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
            }
        }
    }

    var checkImage: String {
        medicine.boughtOn != nil ? "CheckChecked" : "CheckUnChecked"
    }
}

struct Medicine_Previews: PreviewProvider {

    static var previews: some View {
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
        med.boughtOn = nil

        return MedicineComponent(medicine: med)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
