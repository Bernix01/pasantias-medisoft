//
//  Medicine.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 27/9/20.
//

import SwiftUI

struct MedicineComponent: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let medicine: Medicine
    @State private var showingAlert = false
    
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
                Button {
                    if medicine.boughtOn != nil {
                        return
                    }
                    self.showingAlert = true
                }
                label: {
                    Image(medicine.buyStatus.image)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor(medicine.buyStatus.color)
                        .frame(width: 40, height: 40)
                }.actionSheet(isPresented: $showingAlert) {
                    if Calendar.current.compare(Date(), to: medicine.scheduledStart!, toGranularity: .day) == .orderedDescending {
                    return ActionSheet(title: Text("\(medicine.formaFarmaceutica ?? "")"),
                                message: Text("¿Deseas marcarlo como comprado?"),
                                buttons: [.default(Text("Marcar")){
                                    medicine.boughtOn = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
                                    try? viewContext.save()
                                },
                                .default(Text("Marcar y reiniciar conteo de días")){
                                    medicine.boughtOn = Date()
                                    medicine.resetDays = true
                                    try? viewContext.save()
                                },
                                .cancel()])
                    } else {
                        return ActionSheet(title: Text("\(medicine.formaFarmaceutica ?? "")"),
                                    message: Text("¿Deseas marcarlo como comprado?"),
                                    buttons: [.default(Text("Marcar")){
                                        medicine.boughtOn = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
                                        try? viewContext.save()
                                    },
                                    .cancel()])
                    }
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
        let scheduledStart: Date = Calendar.current.date(byAdding: .day,value: 3, to: Date())!
        let scheduledEnd: Date = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
        let duration = Calendar.current.dateComponents([.day], from: scheduledStart, to: scheduledEnd).day!
        let med = Medicine(context: PersistenceController.preview.container.viewContext)
        med.id = "12"
        med.principioActivo = "Metronizadol"
        med.formaFarmaceutica = "Solución inyectable de 120ml"
        med.frecuencia = "8h"
        med.duracionDias = Int32(duration)
        med.viaAdministracion = "IV - Intravenoso"
        med.cantidad = 16
        med.scheduledStart = scheduledStart
        med.dosis = "500gr"
        med.scheduledEnd = scheduledEnd
        med.boughtOn = nil
        
        
        let scheduledStart2: Date = Calendar.current.date(byAdding: .day,value: -3, to: Date())!
        let scheduledEnd2: Date = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
        let duration2 = Calendar.current.dateComponents([.day], from: scheduledStart2, to: scheduledEnd2).day!
        let med2 = Medicine(context: PersistenceController.preview.container.viewContext)
        med2.id = "12345"
        med2.principioActivo = "Metronizadol"
        med2.formaFarmaceutica = "Solución inyectable de 120ml"
        med2.frecuencia = "8h"
        med2.duracionDias = Int32(duration2)
        med2.viaAdministracion = "IV - Intravenoso"
        med2.cantidad = 16
        med2.scheduledStart = scheduledStart2
        med2.dosis = "500gr"
        med2.scheduledEnd = scheduledEnd2
        med2.boughtOn = nil
        
        
        let scheduledStart3: Date = Calendar.current.date(byAdding: .day,value: -3, to: Date())!
        let scheduledEnd3: Date = Calendar.current.date(byAdding: .day, value: 10, to: Date())!
        let duration3 = Calendar.current.dateComponents([.day], from: scheduledStart3, to: scheduledEnd3).day!
        let boughtOn3: Date? = Calendar.current.date(byAdding: .day,value: -6, to: Date())
        let med3 = Medicine(context: PersistenceController.preview.container.viewContext)
        med3.id = "1234"
        med3.principioActivo = "Metronizadol"
        med3.formaFarmaceutica = "Solución inyectable de 120ml"
        med3.frecuencia = "8h"
        med3.duracionDias = Int32(duration3)
        med3.viaAdministracion = "IV - Intravenoso"
        med3.cantidad = 16
        med3.boughtOn = boughtOn3
        med3.scheduledStart = scheduledStart3
        med3.dosis = "500gr"
        med3.scheduledEnd = scheduledEnd3
        
        
        let scheduledStart4: Date = Calendar.current.date(byAdding: .day,value: -3, to: Date())!
        let scheduledEnd4: Date = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
        let duration4 = Calendar.current.dateComponents([.day], from: scheduledStart4, to: scheduledEnd4).day!
        let boughtOn4: Date = Calendar.current.date(byAdding: .day,value: -2, to: Date())!
        let med4 = Medicine(context: PersistenceController.preview.container.viewContext)
        med4.id = "123"
        med4.principioActivo = "Metronizadol"
        med4.formaFarmaceutica = "Solución inyectable de 120ml"
        med4.frecuencia = "8h"
        med4.duracionDias = Int32(duration4)
        med4.viaAdministracion = "IV - Intravenoso"
        med4.cantidad = 16
        med4.boughtOn = boughtOn4
        med4.scheduledStart = scheduledStart4
        med4.dosis = "500gr"
        med4.scheduledEnd = scheduledEnd4
        
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
