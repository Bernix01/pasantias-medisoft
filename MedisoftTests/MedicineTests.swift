//
//  MedicineTests.swift
//  MedisoftTests
//
//  Created by Guillermo Bernal Moreira on 10/18/20.
//

import XCTest
@testable import Medisoft
import CoreData

class MedicineTests: XCTestCase {

    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        let viewContext = PersistenceController.preview.container.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Recipe.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try PersistenceController.preview.container.persistentStoreCoordinator.execute(deleteRequest, with: viewContext)
    }
    
    func testNotStartedNotBought() throws {
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
        med.scheduledEnd = Calendar.current.date(byAdding: .day, value: 19, to: Date())
        med.boughtOn = nil
        
        XCTAssert(med.buyStatus == .fineNotBought, "Should match fineNotBought")
        XCTAssert(med.remainingDays == -1, "Should not have remaining days")
    }
    
    
    func testNotStartedBought() throws {
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
        med.scheduledEnd = Calendar.current.date(byAdding: .day, value: 19, to: Date())
        med.boughtOn = Calendar.current.date(byAdding: .day,value: 1, to: Date())
        
        XCTAssert(med.buyStatus == .fineBought, "Should match fineBought")
        XCTAssert(med.remainingDays == -1, "Should not have remaining days")
    }
    
    
    func testStartedBoughtEarly() throws {
        let today = Date()
        let scheduledStart = Calendar.current.date(byAdding: .day,value: -3, to: today)
        let scheduledEnd = Calendar.current.date(byAdding: .day, value: 6, to: today)
        let duration = Calendar.current.dateComponents([.day], from: scheduledStart!, to: scheduledEnd!).day
        let boughtOn = Calendar.current.date(byAdding: .day,value: -5, to: today)
        
        
        let med = Medicine(context: PersistenceController.preview.container.viewContext)
        med.id = "12"
        med.principioActivo = "Metronizadol"
        med.formaFarmaceutica = "Solución inyectable de 120ml"
        med.frecuencia = "8h"
        med.duracionDias = Int32(duration!)
        med.viaAdministracion = "IV - Intravenoso"
        med.cantidad = 16
        med.scheduledStart = scheduledStart
        med.dosis = "500gr"
        med.scheduledEnd = scheduledEnd
        med.boughtOn = boughtOn
        
        debugPrint(med)
        
        XCTAssert(med.buyStatus == .fineBought, "Should match fineBought")
        XCTAssert(med.remainingDays == 5, "Should have 4 remaining days, found \(med.remainingDays)\n End date: \(med.endDate)")
    }
    

}
