//
//  Utils.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 27/9/20.
//
import Foundation

func formatDate(_ date: Date, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = timeStyle
    formatter.dateStyle = dateStyle
    return formatter.string(from: date)
}

func formatDate(_ date: Date, dateFormat: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    return formatter.string(from: date)
}
