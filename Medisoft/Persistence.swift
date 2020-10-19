//
//  Persistence.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Recipe.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)


        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = Certificate.fetchRequest()
        let deleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try result.container.persistentStoreCoordinator.execute(deleteRequest, with: viewContext)
            try result.container.persistentStoreCoordinator.execute(deleteRequest2, with: viewContext)
        } catch let error as NSError {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        for id in 0..<10 {

            let certificate = Certificate(context: viewContext)
            certificate.id = "00\(id)"
            certificate.date = Calendar.current.date(byAdding: .day,value: id, to: Date())
            certificate.drName = id % 2 == 0 ? "Dra. Paula González" : "Dr. Guillermo Bernal"
            certificate.pdfURL = "https://www.google.com"

            let recipe = Recipe(context: viewContext)
            recipe.id = "01\(id)"

            let apmt = AppointmentInfo(context: viewContext)
            apmt.id = "4"
            apmt.drName = "Dra. Paula González"
            apmt.date = Date()
            apmt.specialty = "Medicina General"
            apmt.location = "Los Álamos"
            recipe.appointment = apmt
            let scheduledStart: Date = Calendar.current.date(byAdding: .day,value: 3, to: Date())!
            let scheduledEnd: Date = Calendar.current.date(byAdding: .day, value: 16, to: Date())!
            let duration = Calendar.current.dateComponents([.day], from: scheduledStart, to: scheduledEnd).day!
            let med = Medicine(context: viewContext)
            med.id = "\(id)12"
            med.principioActivo = "Diclofenaco"
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
            let med2 = Medicine(context: viewContext)
            med2.id = "\(id)12345"
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
            let med3 = Medicine(context: viewContext)
            med3.id = "\(id)1234"
            med3.principioActivo = "Paracetamol"
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
            let med4 = Medicine(context: viewContext)
            med4.id = "\(id)1235"
            med4.principioActivo = "Aspirina"
            med4.formaFarmaceutica = "Solución inyectable de 120ml"
            med4.frecuencia = "8h"
            med4.duracionDias = Int32(duration4)
            med4.viaAdministracion = "IV - Intravenoso"
            med4.cantidad = 16
            med4.boughtOn = boughtOn4
            med4.scheduledStart = scheduledStart4
            med4.dosis = "500gr"
            med4.scheduledEnd = scheduledEnd4

            recipe.medicines = [med, med2, med3, med4]
            recipe.pdfURL = "https://www.google.com"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Medisoft")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
