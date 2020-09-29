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
            recipe.id = "00\(id)"
            let apmt = AppointmentInfo(context: viewContext)

            apmt.id = "4"
            apmt.drName = "Dra. Paula González"
            apmt.date = Date()
            apmt.specialty = "Medicina General"
            apmt.location = "Los Álamos"
            recipe.appointment = apmt
            let med = Medicine(context: viewContext)

            med.id = "12\(id)"
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
