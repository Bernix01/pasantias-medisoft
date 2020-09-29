//
//  Appointment.swift
//  iOS
//
//  Created by Guillermo Bernal on 7/27/20.
//

import Foundation

struct AppointmentExtract {
    let uid: String!
    let doctor: String!
    let specialty: String!
    let date: Date!
}

struct AppointmentsPreviewByDate {
    let date: Date!
    let previews: [AppointmentExtract]!
}
