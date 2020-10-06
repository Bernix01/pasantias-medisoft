//
//  Medicine+Wrapper.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import Foundation
import SwiftUI

extension Medicine {
    public var wrappedID: String {
        id ?? ""
    }
    public var wrappedPrincipioActivo: String {
        principioActivo ?? "Unknown medicine"
    }
    public var wrappedFormaFarmaceutica: String {
        formaFarmaceutica ?? "Unknown medicine"
    }
    public var wrappedFrecuencia: String {
        frecuencia ?? ""
    }
    public var wrappedDuracionDias: Int {
        Int(duracionDias)
    }
    public var wrappedViaAdministracion: String {
        viaAdministracion ?? ""
    }
    public var wrappedCantidad: Int {
        Int(cantidad)
    }
    public var wrappedScheduledStart: Date {
        scheduledStart ?? Date.distantPast
    }
    public var wrappedScheduledEnd: Date {
        scheduledEnd ?? Date.distantFuture
    }
    
    var buyStatus: BuyState {
        if let boughtOn = boughtOn {
            if boughtOn > wrappedScheduledStart {
                return .lateBought
            }
            return .fineBought
        }
        if wrappedScheduledStart > Date() {
            return .fineNotBought
        }
        return .lateNotBought
    }
    
    var endDate: Date {
        if resetDays, let dateBought = boughtOn {
            return Calendar.current.date(byAdding: .day,
                                         value: Int(duracionDias),
                                         to: dateBought) ?? Date()
        }
        return wrappedScheduledStart
    }

    var remainingDays: Int {
        if Calendar.current.compare(wrappedScheduledStart, to: Date(), toGranularity: .day) == .orderedDescending {
            // Not started yet
            return -1
        }
        return Calendar.current.dateComponents([.day], from: Date(), to: endDate).day ?? -1
    }

    enum BuyState {
        case fineBought
        case fineNotBought
        case lateBought
        case lateNotBought
        
        var image: String {
            switch self {
            case .fineBought, .lateBought:
                return "CheckChecked"
            case .fineNotBought, .lateNotBought:
                return "CheckUnChecked"
            }
        }
        
        var color: Color {
            switch self {
            case .fineBought, .fineNotBought:
                return .accentColor
            case .lateBought:
                return Color("PresencialColor")
            case .lateNotBought:
                return Color("TeleconsultaColor")
            }
        }
        
        var textColor: Color {
            switch self {
            case .fineBought, .fineNotBought:
                return Color("GreyColor")
            case .lateBought:
                return Color("PresencialColor")
            case .lateNotBought:
                return Color("TeleconsultaColor")
            }
        }
        
        var str: String {
            switch self {
            case .fineBought:
                return "fineBought"
            case .fineNotBought:
                return "fineNotBought"
            case .lateBought:
                return "lateBought"
            case .lateNotBought:
                return "lateNotBought"
            }
        }
        
    }
}
