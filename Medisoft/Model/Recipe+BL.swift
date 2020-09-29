//
//  Recipe+BL.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import Foundation


extension Recipe {
    var startDate: Date {
        self.medicines!.reduce(Date.distantFuture, { (date, medicine) -> Date in
            if let med = medicine as? Medicine, med.scheduledStart! < date {
                return med.scheduledStart!
            }
            return date
        })
    }

    var endDate: Date {
        self.medicines!.reduce(Date.distantPast, { (date, medicine) -> Date in
            if let med = medicine as? Medicine, med.scheduledEnd! > date {
                return med.scheduledEnd!
            }
            return date
        })
    }

    var daysLeft: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: endDate).day ?? -1
    }

    var medicineBoughtCount: Int {
        let set = medicines as? Set<Medicine> ?? []

        return set.filter { $0.boughtOn != nil }.count
    }

    // MARK: - Wrappers

    public var wrappedID: String {
        id ?? "Unknown recipe"
    }

    public var wrappedPdfURL:String{
        pdfURL ?? "https://404.com/"
    }
    
    public var medicineArray: [Medicine]  {
        let set = medicines as? Set<Medicine> ?? []

        return set.sorted {
            $0.wrappedPrincipioActivo < $1.wrappedPrincipioActivo
        }
    }
}
