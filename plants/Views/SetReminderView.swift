//
//  SetReminderView.swift
//  plants
//
//  Created by Reuof on 17/04/1446 AH.
//

/////the new workable one here ///////
 
import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var reminders: [Reminder] // Binding to reminders array
    
    @State private var plantName: String = ""
    @State private var selectedRoom: String = "Living Room"
    @State private var selectedLight: String = "Full Sun"
    @State private var selectedWateringDays: String = "Every day"
    @State private var waterAmount: String = "20-50 ml"
    
    let rooms = ["Living Room", "Bedroom", "Kitchen", "Bathroom"]
    let lights = ["Full Sun", "Partial Sun", "Low Light"]
    let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    var body: some View {
        NavigationView {
            Form {
                // Plant Name Section
                Section(header: Text("")) {
                    HStack {
                        Text("Plant Name")
                        Divider()
                            .frame(width: 2, height: 30)
                            .overlay(Color("trq")) // Set the divider color
                        TextField("Pothos", text: $plantName)
                            .padding()
                            .frame(minWidth: 100)
                            .frame(height: 40)
                    }
                }
                
                // Room Picker
                Section(header: Text("")) {
                    Picker(selection: $selectedRoom, label: HStack {
                        Image(systemName: "location")
                        Text("Room")
                    }) {
                        ForEach(rooms, id: \.self) { room in
                            Text(room).tag(room)
                        }
                    }
                    .disabled(plantName.isEmpty)
                
                
                // Light Picker
               
                    Picker(selection: $selectedLight, label: HStack {
                        Image(systemName: "sun.max")
                        Text("Light")
                    }) {
                        ForEach(lights, id: \.self) { light in
                            Text(light).tag(light)
                        }
                    }
                    .disabled(plantName.isEmpty)
                }
                
                // Watering Days Picker
                Section(header: Text("")) {
                    Picker(selection: $selectedWateringDays, label: HStack {
                        Image(systemName: "drop")
                        Text("Watering Days")
                    }) {
                        ForEach(wateringDays, id: \.self) { days in
                            Text(days).tag(days)
                        }
                    }
                    .disabled(plantName.isEmpty) // Disable if plant name is empty
                
                
                // Water Amount Picker
           
                    Picker(selection: $waterAmount, label: HStack {
                        Image(systemName: "drop")
                        Text("Water Amount")
                    }) {
                        ForEach(waterAmountOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    .disabled(plantName.isEmpty) // Disable if plant name is empty
                }
            }
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel") {
                dismiss() // Dismiss the view
            }
            .foregroundColor(Color("trq")), // Set color for Cancel button

            trailing: Button("Save") {
                // Construct the reminder text
                let reminderText = "Plant: \(plantName), Room: \(selectedRoom), Light: \(selectedLight), Watering Days: \(selectedWateringDays), Water Amount: \(waterAmount)"
                let newReminder = Reminder(text: reminderText, isChecked: false)
                reminders.append(newReminder) // Add new reminder to the array
                
                dismiss() // Dismiss the view
            }
            .foregroundColor(Color("trq")) // Set color for Save button
            .disabled(plantName.isEmpty) // Disable Save button if plant name is empty
            )
        }
    }
}

#Preview {
    SetReminderView(reminders: .constant([])) // Preview with empty reminders
}

