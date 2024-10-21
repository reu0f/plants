//
//  SetReminderView.swift
//  plants
//
//  Created by Reuof on 17/04/1446 AH.
//

import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var plantName: String = ""
    @State private var selectedRoom: String = ""
    @State private var selectedLight: String = ""
    @State private var selectedWateringDays: String = ""
    @State private var waterAmount: String = ""
    
    let rooms = ["Living Room", "Bedroom", "Kitchen", "Bathroom"]
    let lights = ["Full Sun", "Partial Sun", "Low Light"]
    let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    var body: some View {
        NavigationView {
        

            Form {
                Section(header: Text("")) {

                    HStack {
                                           Text("Plant Name")
                                        
                        
                          Divider()
                            .frame(width: 2, height: 30)
                              .overlay(Color("trq"))// set the divider
                                           TextField("Pothos", text: $plantName)
                                               .textFieldStyle(RoundedBorderTextFieldStyle())
                                             
                                       }
                    //room
                    Picker( selection: $selectedRoom, label: HStack{
                        Image(systemName: "location")
                        Text("room")
                    }) {
                        ForEach(rooms, id: \.self) { room in
                            Text(room).tag(room)
                        }
                      
                    }
                   
                   
                    // light
                    Picker(selection: $selectedLight, label: HStack{
                        Image(systemName: "sun.max")
                            
                        Text("light")
                       }) {
                            ForEach(lights, id: \.self) { light in
                                Text(light).tag(light)
                            }}
                 
                 //water days
        Picker(selection: $selectedWateringDays, label: HStack {
                                         Image(systemName: "drop")
                                             
                                         Text("Watering Days")
                                             
                                     }) {
                                         ForEach(wateringDays, id: \.self) { days in
                                             Text(days).tag(days)}}
   
                    //water amount
        Picker( selection: $waterAmount, label: HStack{
                        Image(systemName: "drop")
                            
                        Text("water")
                          }) {
                        ForEach(waterAmountOptions, id: \.self) { option in
                            Text(option).tag(option)}}
               
                }
                
               
                .disabled(plantName.isEmpty) // Disable if plant name is empty
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Set Reminder")
            .foregroundColor(Color.white)
          
            

            .navigationBarItems(leading: Button("Cancel") {
                dismiss() // Dismiss the view on cancel
            }, trailing: Button("Done") {
                dismiss() // Dismiss the view on done
            })
          
        }
        .foregroundColor(Color("trq")) // Set text color for the entire view
        
        
         }
    
}

#Preview {
    SetReminderView()
}
