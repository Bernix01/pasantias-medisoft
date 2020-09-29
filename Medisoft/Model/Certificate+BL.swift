//
//  Certificate+BL.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 29/9/20.
//

import Foundation
extension Certificate {
    public var wrappedID: String{
        id ?? "Unknown certificate"
    }

    public var wrappedDate: Date {
        date ?? Date.distantPast
    }

    public var wrappedDrName: String {
        drName ?? "Unknown Doctor"
    }
}
