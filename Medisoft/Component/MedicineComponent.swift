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
                    Text("Dosis de \(medicine.dosis!)")
                    Text("\(medicine.viaAdministracion!)")
                    Text("\(medicine.cantidad) unidades")
                }.font(FontNameManager.body)
                .foregroundColor(Color("GreyColor"))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                if (medicine.remainingDays != -1) {
                Text("Quedan \(medicine.remainingDays) días")
                    .font(FontNameManager.menuBold)
                    .foregroundColor(medicine.buyStatus.textColor)
                }else {
                    Text("Empieza\n\(medicine.wrappedScheduledStart, formatter: scheduledStartFormat())")
                        .multilineTextAlignment(.center)
                        .font(FontNameManager.menuBold)
                        .foregroundColor(medicine.buyStatus.textColor)
                }
                Button {}
                    label: {
                        Image(medicine.buyStatus.image)
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .foregroundColor(medicine.buyStatus.color)
                            .frame(width: 40, height: 40)
                    }
            }
        }
    }
    
    func scheduledStartFormat() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter
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
        med.scheduledStart = Calendar.current.date(byAdding: .day,value: 3, to: Date())
        med.dosis = "500gr"
        med.scheduledEnd = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
        med.boughtOn = nil
        
        let med2 = Medicine(context: PersistenceController.preview.container.viewContext)
        med2.id = "12345"
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
        med4.id = "123"
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
        
        return Group {
            MedicineComponent(medicine: med)
                .previewLayout(.fixed(width: 300.0, height: 200.0))
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            MedicineComponent(medicine: med2)
                .previewLayout(.fixed(width: 300.0, height: 200.0))
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            MedicineComponent(medicine: med3)
                .previewLayout(.fixed(width: 300.0, height: 200.0))
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            MedicineComponent(medicine: med4)
                .previewLayout(.fixed(width: 300.0, height: 200.0))
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
