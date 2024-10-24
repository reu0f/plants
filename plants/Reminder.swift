//
//  Reminder.swift
//  plants
//
//  Created by Reuof on 19/04/1446 AH.
//

 import SwiftUI

struct Reminder: Identifiable {
    let id = UUID()
    var text: String
    var isChecked: Bool
}
/*
struct Reminder: Identifiable {
    let id = UUID()
    var text: String // Name of the reminder
    var room: String // Room name
    var light: String // Light condition
    var wateringDays: String // Watering days
    var water: String // Water amount
    var isChecked: Bool = false // Status of the reminder
}
*/

