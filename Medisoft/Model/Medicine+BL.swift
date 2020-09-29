//
//  Medicine+Wrapper.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import Foundation

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
}
